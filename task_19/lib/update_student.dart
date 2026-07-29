import 'package:flutter/material.dart';

import 'student.dart';

class UpdateStudent extends StatefulWidget {

  final Student student;

  const UpdateStudent({
    super.key,
    required this.student,
  });

  @override
  State<UpdateStudent> createState() => _UpdateStudentState();
}

class _UpdateStudentState extends State<UpdateStudent> {

  late TextEditingController nameController;
  late TextEditingController courseController;
  late TextEditingController ageController;

  @override
  void initState() {
    super.initState();

    nameController = TextEditingController(
      text: widget.student.name,
    );

    courseController = TextEditingController(
      text: widget.student.course,
    );

    ageController = TextEditingController(
      text: widget.student.age.toString(),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    courseController.dispose();
    ageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text(
          "Update Student",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepPurple,
      ),

      body: Padding(

        padding: const EdgeInsets.all(16),

        child: Column(

          children: [

            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: "Student Name",
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: courseController,
              decoration: const InputDecoration(
                labelText: "Course",
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: ageController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Age",
              ),
            ),

            const SizedBox(height: 30),

            SizedBox(

              width: double.infinity,

              child: ElevatedButton(

                onPressed: () async {

                  widget.student.name = nameController.text;

                  widget.student.course = courseController.text;

                  widget.student.age =
                      int.parse(ageController.text);

                  await widget.student.save();

                  Navigator.pop(context);

                },

                child: const Text("Update Student"),

              ),

            ),

          ],

        ),

      ),

    );
  }
}