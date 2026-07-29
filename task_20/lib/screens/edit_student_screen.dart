import 'package:flutter/material.dart';

import '../database/database_helper.dart';
import '../models/student_model.dart';

class EditStudentScreen extends StatefulWidget {
  final Student student;

  const EditStudentScreen({
    super.key,
    required this.student,
  });

  @override
  State<EditStudentScreen> createState() => _EditStudentScreenState();
}

class _EditStudentScreenState extends State<EditStudentScreen> {
  late TextEditingController nameController;
  late TextEditingController rollController;
  late TextEditingController emailController;
  late TextEditingController mobileController;
  late TextEditingController cgpaController;

  late String department;
  late String semester;

  final departments = [
    "Computer Science",
    "Information Technology",
    "Electronics",
    "Mechanical",
    "Civil"
  ];

  final semesters = [
    "Semester 1",
    "Semester 2",
    "Semester 3",
    "Semester 4",
    "Semester 5",
    "Semester 6",
    "Semester 7",
    "Semester 8",
  ];

  @override
  void initState() {
    super.initState();

    nameController =
        TextEditingController(text: widget.student.studentName);

    rollController =
        TextEditingController(text: widget.student.rollNumber);

    emailController =
        TextEditingController(text: widget.student.email);

    mobileController =
        TextEditingController(text: widget.student.mobile);

    cgpaController =
        TextEditingController(text: widget.student.cgpa.toString());

    department = widget.student.department;
    semester = widget.student.semester;
  }

  Widget buildField({
    required TextEditingController controller,
    required String label,
    TextInputType keyboard = TextInputType.text,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextField(
        controller: controller,
        keyboardType: keyboard,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }

  Future<void> updateStudent() async {
    Student student = Student(
      id: widget.student.id,
      studentName: nameController.text,
      rollNumber: rollController.text,
      email: emailController.text,
      mobile: mobileController.text,
      department: department,
      semester: semester,
      cgpa: double.parse(cgpaController.text),
    );

    await DatabaseHelper.instance.updateStudent(student);

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Student"),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          children: [

            buildField(
              controller: nameController,
              label: "Student Name",
            ),

            buildField(
              controller: rollController,
              label: "Roll Number",
            ),

            buildField(
              controller: emailController,
              label: "Email",
              keyboard: TextInputType.emailAddress,
            ),

            buildField(
              controller: mobileController,
              label: "Mobile Number",
              keyboard: TextInputType.phone,
            ),

            DropdownButtonFormField(
              value: department,
              decoration: const InputDecoration(
                labelText: "Department",
                border: OutlineInputBorder(),
              ),
              items: departments.map((e) {
                return DropdownMenuItem(
                  value: e,
                  child: Text(e),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  department = value!;
                });
              },
            ),

            const SizedBox(height: 15),

            DropdownButtonFormField(
              value: semester,
              decoration: const InputDecoration(
                labelText: "Semester",
                border: OutlineInputBorder(),
              ),
              items: semesters.map((e) {
                return DropdownMenuItem(
                  value: e,
                  child: Text(e),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  semester = value!;
                });
              },
            ),

            const SizedBox(height: 15),

            buildField(
              controller: cgpaController,
              label: "CGPA",
              keyboard: TextInputType.number,
            ),

            const SizedBox(height: 25),

            Row(
              children: [

                Expanded(
                  child: ElevatedButton(
                    onPressed: updateStudent,
                    child: const Text("Update Student"),
                  ),
                ),

                const SizedBox(width: 10),

                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Cancel"),
                  ),
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }
}