import 'package:flutter/material.dart';

import '../database/database_helper.dart';
import '../models/student_model.dart';
import 'edit_student_screen.dart';

class StudentListScreen extends StatefulWidget {
  const StudentListScreen({super.key});

  @override
  State<StudentListScreen> createState() => _StudentListScreenState();
}

class _StudentListScreenState extends State<StudentListScreen> {
  List<Student> students = [];
  List<Student> filteredStudents = [];

  @override
  void initState() {
    super.initState();
    loadStudents();
  }

  Future<void> loadStudents() async {
    students = await DatabaseHelper.instance.getStudents();

    setState(() {
      filteredStudents = students;
    });
  }

  void searchStudent(String value) {
    setState(() {
      filteredStudents = students.where((student) {
        return student.studentName
                .toLowerCase()
                .contains(value.toLowerCase()) ||
            student.rollNumber
                .toLowerCase()
                .contains(value.toLowerCase());
      }).toList();
    });
  }

  Future<void> deleteStudent(Student student) async {
    await DatabaseHelper.instance.deleteStudent(student.id!);

    loadStudents();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Registered Students"),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),

      body: Padding(
        padding: const EdgeInsets.all(12),

        child: Column(
          children: [

            TextField(
              decoration: InputDecoration(
                hintText: "Search by name or roll number",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onChanged: searchStudent,
            ),

            const SizedBox(height: 15),

            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Total Students : ${filteredStudents.length}",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),

            const SizedBox(height: 10),

            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,

                child: SingleChildScrollView(
                  child: DataTable(

                    headingRowColor: WidgetStateProperty.all(
                      Colors.deepPurple.shade100,
                    ),

                    columns: const [

                      DataColumn(label: Text("Name")),

                      DataColumn(label: Text("Roll No")),

                      DataColumn(label: Text("Dept")),

                      DataColumn(label: Text("Sem")),

                      DataColumn(label: Text("CGPA")),

                      DataColumn(label: Text("Actions")),
                    ],

                    rows: filteredStudents.map((student) {

                      return DataRow(

                        cells: [

                          DataCell(Text(student.studentName)),

                          DataCell(Text(student.rollNumber)),

                          DataCell(Text(student.department)),

                          DataCell(Text(student.semester)),

                          DataCell(Text(student.cgpa.toString())),

                          DataCell(

                            Row(

                              children: [

                                IconButton(

                                  icon: const Icon(
                                    Icons.edit,
                                    color: Colors.blue,
                                  ),

                                  onPressed: () async {

                                    await Navigator.push(

                                      context,

                                      MaterialPageRoute(

                                        builder: (_) =>
                                            EditStudentScreen(
                                          student: student,
                                        ),

                                      ),

                                    );

                                    loadStudents();

                                  },

                                ),

                                IconButton(

                                  icon: const Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  ),

                                  onPressed: () {

                                    showDialog(

                                      context: context,

                                      builder: (_) {

                                        return AlertDialog(

                                          title: const Text(
                                              "Delete Student"),

                                          content: const Text(
                                              "Are you sure you want to delete this student?"),

                                          actions: [

                                            TextButton(

                                              onPressed: () {

                                                Navigator.pop(context);

                                              },

                                              child: const Text("Cancel"),

                                            ),

                                            ElevatedButton(

                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.red,
                                              ),

                                              onPressed: () {

                                                deleteStudent(student);

                                                Navigator.pop(context);

                                              },

                                              child: const Text(
                                                "Delete",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),

                                            ),

                                          ],

                                        );

                                      },

                                    );

                                  },

                                ),

                              ],

                            ),

                          ),

                        ],

                      );

                    }).toList(),

                  ),

                ),

              ),

            ),

          ],

        ),

      ),

    );
  }
}