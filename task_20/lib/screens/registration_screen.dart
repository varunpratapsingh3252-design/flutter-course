import 'package:flutter/material.dart';

import '../database/database_helper.dart';
import '../models/student_model.dart';
import 'student_list_screen.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final rollController = TextEditingController();
  final emailController = TextEditingController();
  final mobileController = TextEditingController();
  final cgpaController = TextEditingController();

  String department = "Computer Science";
  String semester = "Semester 1";

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

  void registerStudent() async {
    if (!_formKey.currentState!.validate()) return;

    Student student = Student(
      studentName: nameController.text,
      rollNumber: rollController.text,
      email: emailController.text,
      mobile: mobileController.text,
      department: department,
      semester: semester,
      cgpa: double.parse(cgpaController.text),
    );

    await DatabaseHelper.instance.insertStudent(student);

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          title: const Icon(
            Icons.check_circle,
            color: Colors.green,
            size: 70,
          ),
          content: const Text(
            "Student Registered Successfully!",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);

                nameController.clear();
                rollController.clear();
                emailController.clear();
                mobileController.clear();
                cgpaController.clear();

                setState(() {
                  department = "Computer Science";
                  semester = "Semester 1";
                });
              },
              child: const Text("OK"),
            )
          ],
        );
      },
    );
  }

  Widget buildTextField({
    required TextEditingController controller,
    required String label,
    TextInputType keyboard = TextInputType.text,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboard,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Required";
          }
          return null;
        },
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Student Registration"),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [

              buildTextField(
                controller: nameController,
                label: "Student Name",
              ),

              buildTextField(
                controller: rollController,
                label: "Roll Number",
              ),

              buildTextField(
                controller: emailController,
                label: "Email",
                keyboard: TextInputType.emailAddress,
              ),

              buildTextField(
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

              buildTextField(
                controller: cgpaController,
                label: "CGPA",
                keyboard: TextInputType.number,
              ),

              const SizedBox(height: 25),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: registerStudent,
                  child: const Text("Register Student"),
                ),
              ),

              const SizedBox(height: 10),

              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const StudentListScreen(),
                      ),
                    );
                  },
                  child: const Text("View Students"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}