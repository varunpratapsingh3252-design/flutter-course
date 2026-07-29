import 'package:flutter/material.dart';

void main() {
  runApp(const StudentRegistrationApp());
}

class StudentRegistrationApp extends StatelessWidget {
  const StudentRegistrationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Student Registration",
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const RegistrationScreen(),
    );
  }
}

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() =>
      _RegistrationScreenState();
}

class _RegistrationScreenState
    extends State<RegistrationScreen> {

  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final mobileController = TextEditingController();
  final rollController = TextEditingController();
  final cityController = TextEditingController();

  String? selectedCourse;

  final List<String> courses = [
    "B.Tech Computer Science",
    "B.Tech IT",
    "BCA",
    "MCA",
    "MBA",
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text(
          "Student Registration",
          style: TextStyle(color: Colors.white),
        ),
      ),

      body: SingleChildScrollView(

        padding: const EdgeInsets.all(16),

        child: Form(

          key: _formKey,

          child: Column(

            children: [

              const CircleAvatar(
                radius: 40,
                backgroundColor: Color(0xffE8E6FF),
                child: Icon(
                  Icons.school,
                  color: Colors.deepPurple,
                  size: 45,
                ),
              ),

              const SizedBox(height: 12),

              const Text(
                "Student Registration",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const Text(
                "Please fill in the details to register",
                style: TextStyle(color: Colors.grey),
              ),

              const SizedBox(height: 25),

              TextFormField(

                controller: nameController,

                decoration: const InputDecoration(
                  labelText: "Full Name",
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                ),

                validator: (value) {

                  if (value == null || value.isEmpty) {
                    return "Please enter your full name";
                  }

                  return null;

                },

              ),

              const SizedBox(height: 15),

              TextFormField(

                controller: emailController,

                keyboardType:
                    TextInputType.emailAddress,

                decoration: const InputDecoration(
                  labelText: "Email Address",
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(),
                ),

                validator: (value) {

                  if (value == null || value.isEmpty) {
                    return "Please enter your email";
                  }

                  if (!value.contains("@")) {
                    return "Enter a valid email";
                  }

                  return null;

                },

              ),

              const SizedBox(height: 15),

              TextFormField(

                controller: mobileController,

                keyboardType: TextInputType.phone,

                decoration: const InputDecoration(
                  labelText: "Mobile Number",
                  prefixIcon: Icon(Icons.phone),
                  border: OutlineInputBorder(),
                ),

                validator: (value) {

                  if (value == null || value.isEmpty) {
                    return "Please enter mobile number";
                  }

                  if (value.length != 10) {
                    return "Enter 10 digit mobile number";
                  }

                  return null;

                },

              ),

              const SizedBox(height: 15),

              TextFormField(

                controller: rollController,

                decoration: const InputDecoration(
                  labelText: "Roll Number",
                  prefixIcon: Icon(Icons.badge),
                  border: OutlineInputBorder(),
                ),

                validator: (value) {

                  if (value == null || value.isEmpty) {
                    return "Please enter roll number";
                  }

                  return null;

                },

              ),

              const SizedBox(height: 15),
                            DropdownButtonFormField<String>(

                value: selectedCourse,

                decoration: const InputDecoration(
                  labelText: "Course",
                  prefixIcon: Icon(Icons.menu_book),
                  border: OutlineInputBorder(),
                ),

                items: courses.map((course) {

                  return DropdownMenuItem(
                    value: course,
                    child: Text(course),
                  );

                }).toList(),

                validator: (value) {

                  if (value == null) {
                    return "Please select your course";
                  }

                  return null;

                },

                onChanged: (value) {

                  setState(() {

                    selectedCourse = value;

                  });

                },

              ),

              const SizedBox(height: 15),

              TextFormField(

                controller: cityController,

                decoration: const InputDecoration(
                  labelText: "City",
                  prefixIcon: Icon(Icons.location_city),
                  border: OutlineInputBorder(),
                ),

                validator: (value) {

                  if (value == null || value.isEmpty) {
                    return "Please enter your city";
                  }

                  return null;

                },

              ),

              const SizedBox(height: 25),

              Row(

                children: [

                  Expanded(

                    child: OutlinedButton.icon(

                      icon: const Icon(
                        Icons.refresh,
                        color: Colors.red,
                      ),

                      label: const Text(
                        "Reset",
                        style: TextStyle(
                          color: Colors.red,
                        ),
                      ),

                      onPressed: () {

                        nameController.clear();

                        emailController.clear();

                        mobileController.clear();

                        rollController.clear();

                        cityController.clear();

                        setState(() {

                          selectedCourse = null;

                        });

                      },

                    ),

                  ),

                  const SizedBox(width: 15),

                  Expanded(

                    child: ElevatedButton.icon(

                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple,
                        padding: const EdgeInsets.symmetric(
                          vertical: 15,
                        ),
                      ),

                      icon: const Icon(
                        Icons.send,
                        color: Colors.white,
                      ),

                      label: const Text(
                        "Submit",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),

                      onPressed: () {

                        if (_formKey.currentState!.validate()) {

                          showDialog(

                            context: context,

                            builder: (context) {

                              return AlertDialog(

                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(20),
                                ),

                                title: const Column(

                                  children: [

                                    CircleAvatar(
                                      radius: 30,
                                      backgroundColor:
                                          Colors.green,
                                      child: Icon(
                                        Icons.check,
                                        color: Colors.white,
                                        size: 35,
                                      ),
                                    ),

                                    SizedBox(height: 10),

                                    Text(
                                      "Student Registered Successfully!",
                                      textAlign: TextAlign.center,
                                    ),

                                  ],

                                ),
                                                                content: Column(

                                  mainAxisSize:
                                      MainAxisSize.min,

                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,

                                  children: [

                                    Row(
                                      children: [

                                        const Icon(
                                          Icons.person,
                                          size: 18,
                                        ),

                                        const SizedBox(width: 8),

                                        Expanded(
                                          child: Text(
                                            "Name : ${nameController.text}",
                                          ),
                                        ),

                                      ],
                                    ),

                                    const SizedBox(height: 10),

                                    Row(
                                      children: [

                                        const Icon(
                                          Icons.email,
                                          size: 18,
                                        ),

                                        const SizedBox(width: 8),

                                        Expanded(
                                          child: Text(
                                            "Email : ${emailController.text}",
                                          ),
                                        ),

                                      ],
                                    ),

                                    const SizedBox(height: 10),

                                    Row(
                                      children: [

                                        const Icon(
                                          Icons.phone,
                                          size: 18,
                                        ),

                                        const SizedBox(width: 8),

                                        Expanded(
                                          child: Text(
                                            "Mobile : ${mobileController.text}",
                                          ),
                                        ),

                                      ],
                                    ),

                                    const SizedBox(height: 10),

                                    Row(
                                      children: [

                                        const Icon(
                                          Icons.badge,
                                          size: 18,
                                        ),

                                        const SizedBox(width: 8),

                                        Expanded(
                                          child: Text(
                                            "Roll No : ${rollController.text}",
                                          ),
                                        ),

                                      ],
                                    ),

                                    const SizedBox(height: 10),

                                    Row(
                                      children: [

                                        const Icon(
                                          Icons.menu_book,
                                          size: 18,
                                        ),

                                        const SizedBox(width: 8),

                                        Expanded(
                                          child: Text(
                                            "Course : $selectedCourse",
                                          ),
                                        ),

                                      ],
                                    ),

                                    const SizedBox(height: 10),

                                    Row(
                                      children: [

                                        const Icon(
                                          Icons.location_on,
                                          size: 18,
                                        ),

                                        const SizedBox(width: 8),

                                        Expanded(
                                          child: Text(
                                            "City : ${cityController.text}",
                                          ),
                                        ),

                                      ],
                                    ),

                                  ],

                                ),

                                actions: [

                                  Center(

                                    child: ElevatedButton(

                                      style:
                                          ElevatedButton.styleFrom(
                                        backgroundColor:
                                            Colors.deepPurple,
                                      ),

                                      onPressed: () {

                                        Navigator.pop(context);

                                      },

                                      child: const Text(
                                        "OK",
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),

                                    ),

                                  ),

                                ],

                              );

                            },

                          );

                        }

                      },

                    ),

                  ),

                ],

              ),

              const SizedBox(height: 20),
                          ],

          ),

        ),

      ),

    );

  }

}