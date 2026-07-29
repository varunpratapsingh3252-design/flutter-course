import 'package:flutter/material.dart';
import 'student_details.dart';

void main() {
  runApp(const StudentNavigatorApp());
}

class StudentNavigatorApp extends StatelessWidget {
  const StudentNavigatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Student Navigator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/details': (context) => const StudentDetailsScreen(),
      },
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final TextEditingController nameController =
      TextEditingController();

  final TextEditingController rollController =
      TextEditingController();

  String selectedCourse = "Flutter";

  String updatedCourse = "";

  final List<String> courses = [
    "Flutter",
    "Java",
    "Python",
    "AI",
  ];

  Future<void> openDetails() async {

    final result = await Navigator.pushNamed(
      context,
      "/details",
      arguments: {
        "name": nameController.text,
        "roll": rollController.text,
        "course": selectedCourse,
      },
    );

    if (result != null) {
      setState(() {
        updatedCourse = result.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Student Information"),
        backgroundColor: Colors.blue,
      ),

      body: SingleChildScrollView(

        padding: const EdgeInsets.all(20),

        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            const Center(
              child: Icon(
                Icons.school,
                size: 80,
                color: Colors.blue,
              ),
            ),

            const SizedBox(height: 20),

            const Text("Student Name"),

            const SizedBox(height: 5),

            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter Name",
              ),
            ),

            const SizedBox(height: 15),

            const Text("Roll Number"),

            const SizedBox(height: 5),

            TextField(
              controller: rollController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter Roll Number",
              ),
            ),

            const SizedBox(height: 15),

            const Text("Select Course"),

            const SizedBox(height: 5),

            DropdownButtonFormField<String>(

              value: selectedCourse,

              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),

              items: courses.map((course) {

                return DropdownMenuItem(
                  value: course,
                  child: Text(course),
                );

              }).toList(),

              onChanged: (value) {

                setState(() {

                  selectedCourse = value!;

                });

              },

            ),

            const SizedBox(height: 25),

            SizedBox(

              width: double.infinity,

              child: ElevatedButton.icon(

                icon: const Icon(Icons.visibility),

                label: const Text("View Details"),

                onPressed: openDetails,

              ),

            ),

            const SizedBox(height: 20),

            if (updatedCourse.isNotEmpty)

              Container(

                width: double.infinity,

                padding: const EdgeInsets.all(15),

                decoration: BoxDecoration(

                  color: Colors.green.shade50,

                  border: Border.all(color: Colors.green),

                  borderRadius: BorderRadius.circular(10),

                ),

                child: Text(

                  "Updated Course : $updatedCourse",

                  style: const TextStyle(

                    fontWeight: FontWeight.bold,

                    color: Colors.green,

                  ),

                ),

              ),

          ],

        ),

      ),

    );

  }

}