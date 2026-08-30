"""Student Management System

A command-line student management project developed from my Python course capstone.
"""

students = [
    {"roll": 101, "name": "Rahul", "age": 20, "course": "Python", "marks": 85},
    {"roll": 102, "name": "Neha", "age": 19, "course": "SQL", "marks": 92},
    {"roll": 103, "name": "Amit", "age": 22, "course": "Python", "marks": 74},
    {"roll": 104, "name": "Priya", "age": 21, "course": "AI", "marks": 96},
    {"roll": 105, "name": "Rohan", "age": 20, "course": "Python", "marks": 67},
]


def calc_grade(marks):
    if marks > 90:
        return "A"
    elif marks > 75:
        return "B"
    elif marks > 60:
        return "C"
    return "D"


def search_by_roll(roll_no):
    for student in students:
        if student["roll"] == roll_no:
            return student
    return None


def search_by_name(name):
    for student in students:
        if student["name"].lower() == name.lower():
            return student
    return None


def find_topper():
    if not students:
        return None
    return max(students, key=lambda student: student["marks"])


def calculate_average():
    if not students:
        return 0
    return sum(student["marks"] for student in students) / len(students)


def add_student():
    print("\n--- Add New Student ---")
    try:
        roll = int(input("Enter Roll Number: "))
        name = input("Enter Name: ")
        age = int(input("Enter Age: "))
        course = input("Enter Course: ")
        marks = int(input("Enter Marks: "))

        students.append({
            "roll": roll,
            "name": name,
            "age": age,
            "course": course,
            "marks": marks,
        })
        print(f"Student {name} added successfully!")
    except ValueError:
        print("Invalid input. Please enter numbers for Roll, Age, and Marks.")


def display_students():
    print("\n--- All Students ---")
    if not students:
        print("No students to display.")
        return

    for student in students:
        print(
            f"Roll: {student['roll']} | Name: {student['name']} | "
            f"Age: {student['age']} | Course: {student['course']} | "
            f"Marks: {student['marks']} | Grade: {calc_grade(student['marks'])}"
        )


def search_student():
    print("\n--- Search Student ---")
    search_choice = input("Search by (R)oll Number or (N)ame? ").lower()

    if search_choice == "r":
        try:
            roll = int(input("Enter Roll Number to search: "))
            student = search_by_roll(roll)
        except ValueError:
            print("Invalid input for Roll Number.")
            return
    elif search_choice == "n":
        name = input("Enter Name to search: ")
        student = search_by_name(name)
    else:
        print("Invalid search choice.")
        return

    if student:
        print("Record Found:", student)
    else:
        print("Record Not Found")


def save_student_data():
    filename = "students_data.txt"
    try:
        with open(filename, "w") as file:
            for student in students:
                file.write(str(student) + "\n")
        print(f"Student data saved to {filename} successfully!")
    except OSError as error:
        print(f"Error saving data: {error}")


def main():
    while True:
        print("\n--- Student Management System ---")
        print("1. Add New Student")
        print("2. Display All Students")
        print("3. Search Student")
        print("4. Find Topper")
        print("5. Calculate Average Marks")
        print("6. Save Student Data")
        print("7. Exit")

        try:
            choice = int(input("Enter your choice (1-7): "))
        except ValueError:
            print("Invalid input. Please enter a number between 1 and 7.")
            continue

        if choice == 1:
            add_student()
        elif choice == 2:
            display_students()
        elif choice == 3:
            search_student()
        elif choice == 4:
            topper = find_topper()
            print("\nTopper:", topper["name"] if topper else "No students")
        elif choice == 5:
            print(f"\nAverage marks: {calculate_average():.2f}")
        elif choice == 6:
            save_student_data()
        elif choice == 7:
            print("Exiting Student Management System. Goodbye!")
            break
        else:
            print("Invalid choice. Please enter a number between 1 and 7.")


if __name__ == "__main__":
    main()
