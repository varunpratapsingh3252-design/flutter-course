import 'package:flutter/material.dart';

class EditCourseScreen extends StatefulWidget {
  final String course;

  const EditCourseScreen({
    super.key,
    required this.course,
  });

  @override
  State<EditCourseScreen> createState() =>
      _EditCourseScreenState();
}

class _EditCourseScreenState
    extends State<EditCourseScreen> {

  late String selectedCourse;

  final List<String> courses = [
    "Flutter",
    "Java",
    "Python",
    "AI",
  ];

  @override
  void initState() {
    super.initState();
    selectedCourse = widget.course;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Edit Course"),
        backgroundColor: Colors.orange,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            const Center(
              child: Text(
                "Select New Course",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                ),
              ),
            ),

            const SizedBox(height: 25),

            ...courses.map(
              (course) => RadioListTile<String>(
                title: Text(course),
                value: course,
                groupValue: selectedCourse,
                onChanged: (value) {
                  setState(() {
                    selectedCourse = value!;
                  });
                },
              ),
            ),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.check),
                label: const Text("Save Changes"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: const EdgeInsets.symmetric(
                    vertical: 15,
                  ),
                ),
                onPressed: () {
                  Navigator.pop(
                    context,
                    selectedCourse,
                  );
                },
              ),
            ),

          ],
        ),
      ),
    );
  }
}