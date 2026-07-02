void main() {
  List<String> students = ["Rahul","Priya","Aman", "Sneha","Karan"];

  Map<String, int> marks = { "Rahul": 85,"Priya": 72,"Aman": 91,"Sneha": 65,"Karan": 38,};

  print("=========================================");
  print("Displaying Student Names using Different Loops");
  print("=========================================\n");

  
  print("Using for loop:");
  for (int i = 0; i < students.length; i++) {
    print(students[i]);
  }

  // while loop
  print("\nUsing while loop:");
  int i = 0;
  while (i < students.length) {
    print(students[i]);
    i++;
  }

  // do-while loop
  print("\nUsing do-while loop:");
  int j = 0;
  do {
    print(students[j]);
    j++;
  } while (j < students.length);

  // for-in loop
  print("\nUsing for-in loop:");
  for (String student in students) {
    print(student);
  }

  // forEach loop
  print("\nUsing forEach loop:");
  students.forEach((student) {
    print(student);
  });

  print("\n=========================================");
  print("        STUDENT GRADE REPORT");
  print("=========================================\n");

  // Step 4 & 5
  for (String student in students) {
    int mark = marks[student]!;

    String grade;

    if (mark >= 90) {
      grade = "A+";
    } else if (mark >= 80) {
      grade = "A";
    } else if (mark >= 70) {
      grade = "B";
    } else if (mark >= 60) {
      grade = "C";
    } else if (mark >= 40) {
      grade = "D";
    } else {
      grade = "Fail";
    }

    String performance;

    switch (grade) {
      case "A+":
        performance = "Outstanding";
        break;
      case "A":
        performance = "Excellent";
        break;
      case "B":
        performance = "Very Good";
        break;
      case "C":
        performance = "Good";
        break;
      case "D":
        performance = "Needs Improvement";
        break;
      default:
        performance = "Failed";
    }

    print("Student : $student");
    print("Marks   : $mark");
    print("Grade   : $grade");
    print("Remarks : $performance");
    print("-----------------------------------------");
  }

  print("=========================================");
}
