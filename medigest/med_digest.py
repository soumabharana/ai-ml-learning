"""Daily medical and biomedical research digest sent to Telegram."""

import email.utils
import html
import os
import time
from datetime import datetime, timedelta, timezone
from zoneinfo import ZoneInfo

import feedparser
import requests

TELEGRAM_TOKEN = os.environ.get("TELEGRAM_BOT_TOKEN", "").strip()
CHAT_ID = os.environ.get("TELEGRAM_CHAT_ID", "").strip()
IST = ZoneInfo("Asia/Kolkata")

SOURCES = {
    "Tier 0 - medRxiv (Medical Preprints)": {
        "type": "api",
        "url": "https://api.medrxiv.org/details/medrxiv/last_1d",
    },
    "Tier 0 - bioRxiv (Biology Preprints)": {
        "type": "api",
        "url": "https://api.biorxiv.org/details/biorxiv/last_1d",
    },
    "Tier 0 - arXiv (Quantitative Biology)": {
        "type": "rss",
        "url": "https://export.arxiv.org/rss/q-bio",
    },
    "Tier 1 - EurekAlert! (Medicine & Health)": {
        "type": "rss",
        "url": "https://www.eurekalert.org/rss/medicine_health.xml",
    },
    "Tier 1 - MedicalXpress (Medical News)": {
        "type": "rss",
        "url": "https://medicalxpress.com/rss-feed/",
    },
    "Tier 2 - Nature Latest": {
        "type": "rss",
        "url": "https://www.nature.com/nature.rss",
    },
    "Tier 2 - Science Latest": {
        "type": "rss",
        "url": "https://www.science.org/rss/news_current.xml",
    },
    "Tier 2 - Cell Press Latest": {
        "type": "rss",
        "url": "https://www.cell.com/rss/feed",
    },
    "Tier 2 - Lancet Latest": {
        "type": "rss",
        "url": "https://www.thelancet.com/rssfeed/latest.xml",
    },
}


def entry_datetime(entry):
    """Return the feed entry date in UTC, or None when it is not supplied."""
    for attr in ("published_parsed", "updated_parsed"):
        parsed = getattr(entry, attr, None)
        if parsed:
            try:
                return datetime(*parsed[:6], tzinfo=timezone.utc)
            except (TypeError, ValueError):
                pass
    for attr in ("published", "updated", "date"):
        value = getattr(entry, attr, None)
        if value:
            try:
                parsed = email.utils.parsedate_to_datetime(value)
                if parsed.tzinfo is None:
                    parsed = parsed.replace(tzinfo=timezone.utc)
                return parsed.astimezone(timezone.utc)
            except (TypeError, ValueError, OverflowError):
                pass
    return None


def fetch_api(url, tier, cutoff):
    articles = []
    response = requests.get(
        url,
        headers={"User-Agent": "MedicalResearchDigest/1.0"},
        timeout=60,
    )
    response.raise_for_status()
    for item in response.json().get("collection", []):
        try:
            date_text = item.get("date", "")
            published_at = datetime.strptime(date_text, "%Y-%m-%d").replace(
                tzinfo=timezone.utc
            )
            if published_at < cutoff:
                continue
            doi = item.get("doi", "")
            articles.append(
                {
                    "tier": tier,
                    "title": str(item.get("title") or "Untitled"),
                    "link": f"https://doi.org/{doi}" if doi else "https://scholar.google.com",
                    "author": str(item.get("authors") or "Author not specified"),
                    "summary": str(item.get("abstract") or "Abstract unavailable.")[:500],
                    "published": published_at.strftime("%Y-%m-%d %H:%M UTC"),
                    "sort_date": published_at,
                }
            )
        except (TypeError, ValueError):
            continue
    return articles


def fetch_rss(url, tier, cutoff):
    articles = []
    response = requests.get(
        url,
        headers={"User-Agent": "Mozilla/5.0 MedicalResearchDigest/1.0"},
        timeout=40,
    )
    response.raise_for_status()
    feed = feedparser.parse(response.content)
    for entry in feed.entries:
        published_at = entry_datetime(entry)
        if published_at is None or published_at < cutoff:
            continue
        articles.append(
            {
                "tier": tier,
                "title": str(getattr(entry, "title", "Untitled article")),
                "link": str(getattr(entry, "link", "https://scholar.google.com")),
                "author": str(getattr(entry, "author", "Author not specified")),
                "summary": str(entry.get("summary", entry.get("description", "Abstract unavailable.")))[:500],
                "published": published_at.strftime("%Y-%m-%d %H:%M UTC"),
                "sort_date": published_at,
            }
        )
    return articles


def get_recent_articles():
    cutoff = datetime.now(timezone.utc) - timedelta(hours=24)
    all_articles = []
    print(f"Fetching from {len(SOURCES)} sources; cutoff is {cutoff:%Y-%m-%d %H:%M UTC}.")
    for tier, config in SOURCES.items():
        try:
            if config["type"] == "api":
                found = fetch_api(config["url"], tier, cutoff)
            else:
                found = fetch_rss(config["url"], tier, cutoff)
            print(f"  {tier}: {len(found)} articles")
            all_articles.extend(found)
        except Exception as exc:
            # One unavailable feed should not prevent the other feeds from running.
            print(f"  ERROR {tier}: {exc}")
    all_articles.sort(key=lambda item: item["sort_date"], reverse=True)
    return all_articles


def generate_digest(articles, limit=None):
    selected = articles if limit is None else articles[:limit]
    timestamp = datetime.now(IST).strftime("%Y-%m-%d %H:%M IST")
    if not selected:
        return (
            "<b>COMPREHENSIVE CLINICAL RESEARCH DIGEST</b><br><br>"
            "No new dated articles were recorded in the last 24 hours."
        )

    report = (
        "🩺 <b><u>ACADEMIC &amp; CLINICAL RESEARCH DIGEST</u></b> 🔬<br>"
        f"📅 <b>Date:</b> {timestamp} | <b>Articles in report:</b> {len(selected)} "
        f"(collected: {len(articles)})<br>"
        "────────────────────────────────────────<br><br>"
    )
    for index, article in enumerate(selected, start=1):
        title = html.escape(article["title"])
        author = html.escape(article["author"])
        summary = html.escape(article["summary"][:300])
        link = html.escape(article["link"], quote=True)
        tier = html.escape(article["tier"])
        report += (
            f"<b>🔬 [{tier}] Article #{index}: {title}</b><br>"
            f"✍️ <b>Authors:</b> {author}<br>"
            f"📅 <b>Published:</b> <i>{article['published']}</i><br>"
            f"🎯 <b>Core summary:</b> {summary}<br>"
            f'<a href="{link}">🔗 Access original publication</a><br><br>'
            "────────────────────────────────────────<br><br>"
        )
    return report


def save_report(content):
    output_dir = os.path.join(os.getcwd(), "output")
    os.makedirs(output_dir, exist_ok=True)
    path = os.path.join(output_dir, "Complete_Medical_Research_Digest.html")
    timestamp = datetime.now(IST).strftime("%Y-%m-%d %H:%M:%S IST")
    document = f"""<!doctype html>
<html lang="en"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width, initial-scale=1">
<title>Medical Research Digest</title>
<style>body{{font-family:Arial,sans-serif;line-height:1.7;max-width:1000px;margin:24px auto;padding:24px;background:#f0f4f8;color:#1a1a1a}}main{{background:white;padding:32px;border-top:6px solid #0056b3;border-radius:12px;overflow-wrap:anywhere}}a{{color:#065fc4}}</style>
</head><body><main><h1>Medical Research Digest</h1><p><b>Generated:</b> {timestamp}</p><hr>{content}</main></body></html>"""
    with open(path, "w", encoding="utf-8") as file:
        file.write(document)
    print(f"Digest saved to {path}")
    return path


def send_telegram_document(path, caption):
    url = f"https://api.telegram.org/bot{TELEGRAM_TOKEN}/sendDocument"
    for attempt in range(1, 4):
        try:
            with open(path, "rb") as file:
                response = requests.post(
                    url,
                    data={"chat_id": CHAT_ID, "caption": caption, "parse_mode": "HTML"},
                    files={"document": (os.path.basename(path), file, "text/html")},
                    timeout=60,
                )
            if response.ok:
                print("Digest document sent to Telegram.")
                return True
            print(f"Telegram API returned {response.status_code}: {response.text}")
            if response.status_code in (400, 401, 403):
                return False
        except requests.RequestException as exc:
            print(f"Telegram attempt {attempt} failed: {exc}")
        if attempt < 3:
            time.sleep(4)
    return False


def main():
    if not TELEGRAM_TOKEN:
        raise RuntimeError("Missing TELEGRAM_BOT_TOKEN repository secret.")
    if not CHAT_ID:
        raise RuntimeError("Missing TELEGRAM_CHAT_ID repository secret.")

    articles = get_recent_articles()
    print(f"Collected {len(articles)} dated articles.")
    digest_path = save_report(generate_digest(articles, limit=None))
    today = datetime.now(IST).strftime("%Y-%m-%d")
    caption = f"🩺 <b>Medical Research Digest</b> — {today} IST\n📚 {len(articles)} articles | Top 10 in preview"
    if not send_telegram_document(digest_path, caption):
        raise RuntimeError("Telegram dispatch failed; check both repository secrets and bot access.")


if __name__ == "__main__":
    main()
