# Medigest — daily Telegram research digest

This project gathers research and medical-news items from medRxiv, bioRxiv, arXiv, EurekAlert!, MedicalXpress, Nature, Science, Cell Press, and The Lancet, then sends an HTML digest document to Telegram.

## Schedule

The GitHub Actions workflow is scheduled for **9:00 PM every day in Asia/Kolkata**. GitHub Actions can occasionally start scheduled jobs a little late during periods of high load. You can also launch a one-off test from the repository's **Actions** tab using **Medigest Daily → Run workflow**.

## One-time Telegram setup

The bot token was present in the originally uploaded Python file. Treat that token as exposed: revoke it and generate a replacement with @BotFather before enabling this workflow.

In this repository, open **Settings → Secrets and variables → Actions → New repository secret** and add these two secrets:

- **TELEGRAM_BOT_TOKEN** — the newly generated token from @BotFather.
- **TELEGRAM_CHAT_ID** — the chat ID where the digest should be sent.

Start the bot from the destination Telegram account first (send /start), then run the workflow manually once to verify delivery.

Do not put either value directly in the Python source, the workflow file, or this README. This repository is public, so the source code is visible to everyone; GitHub Actions secrets keep the credentials out of the committed files.

## Files

- **med_digest.py** — research collection and Telegram delivery.
- **requirements.txt** — Python dependencies.
- **.github/workflows/medigest-daily.yml** — daily scheduler and runner configuration.

The HTML file is generated temporarily on the Actions runner and delivered to Telegram; the workflow does not commit the generated report back into the repository.
