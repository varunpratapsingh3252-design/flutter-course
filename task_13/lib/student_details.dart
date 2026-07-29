import 'package:flutter/material.dart';
import 'edit_course.dart';

class StudentDetailsScreen extends StatefulWidget {
  const StudentDetailsScreen({super.key});

  @override
  State<StudentDetailsScreen> createState() =>
      _StudentDetailsScreenState();
}

class _StudentDetailsScreenState
    extends State<StudentDetailsScreen> {

  late String name;
  late String roll;
  late String course;

  bool loaded = false;

  @override
  Widget build(BuildContext context) {

    if (!loaded) {
      final data = ModalRoute.of(context)!
          .settings
          .arguments as Map<String, dynamic>;

      name = data["name"];
      roll = data["roll"];
      course = data["course"];

      loaded = true;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Student Details"),
        backgroundColor: Colors.green,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [

            Card(
              elevation: 5,

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),

              child: Padding(
                padding: const EdgeInsets.all(15),

                child: Column(
                  children: [

                    ListTile(
                      leading: const CircleAvatar(
                        child: Icon(Icons.person),
                      ),
                      title: const Text("Name"),
                      subtitle: Text(name),
                    ),

                    ListTile(
                      leading: const CircleAvatar(
                        child: Icon(Icons.badge),
                      ),
                      title: const Text("Roll Number"),
                      subtitle: Text(roll),
                    ),

                    ListTile(
                      leading: const CircleAvatar(
                        child: Icon(Icons.school),
                      ),
                      title: const Text("Course"),
                      subtitle: Text(
                        course,
                        style: const TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 25),

            SizedBox(
              width: double.infinity,

              child: ElevatedButton.icon(
                icon: const Icon(Icons.edit),

                label: const Text("Edit Course"),

                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                ),

                onPressed: () async {

                  final result = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          EditCourseScreen(course: course),
                    ),
                  );

                  if (result != null) {
                    setState(() {
                      course = result.toString();
                    });
                  }
                },
              ),
            ),

            const SizedBox(height: 15),

            SizedBox(
              width: double.infinity,

              child: OutlinedButton.icon(
                icon: const Icon(Icons.arrow_back),

                label: const Text("Go Back"),

                onPressed: () {
                  Navigator.pop(context, course);
                },
              ),
            ),

          ],
        ),
      ),
    );
  }
}