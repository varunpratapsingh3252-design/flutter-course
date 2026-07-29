import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';
void main() {
  runApp(const PlacementApp());
}

class PlacementApp extends StatelessWidget {
  const PlacementApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Student Placement Registration",
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const RegistrationPage(),
    );
  }
}

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}
class DashboardPage extends StatelessWidget {
  final String name;
  final String roll;
  final String email;
  final String mobile;
  final String branch;
  final String cgpa;
  final bool interested;

  const DashboardPage({
    super.key,
    required this.name,
    required this.roll,
    required this.email,
    required this.mobile,
    required this.branch,
    required this.cgpa,
    required this.interested,
  });

  Widget detailTile(String title, String value) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: ListTile(
        leading: const Icon(Icons.person, color: Colors.deepPurple),
        title: Text(title),
        subtitle: Text(value),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Student Dashboard",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepPurple,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          children: [

            const CircleAvatar(
              radius: 50,
              backgroundColor: Colors.deepPurple,
              child: Icon(
                Icons.person,
                size: 60,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 20),

            Card(
              color: Colors.green.shade100,
              child: const Padding(
                padding: EdgeInsets.all(16),
                child: Row(
                  children: [
                    Icon(
                      Icons.check_circle,
                      color: Colors.green,
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        "Registration Successful!",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            detailTile("Student Name", name),
            detailTile("Roll Number", roll),
            detailTile("Email", email),
            detailTile("Mobile", mobile),
            detailTile("Branch", branch),
            detailTile("CGPA", cgpa),

            detailTile(
              "Placement Interest",
              interested ? "Yes" : "No",
            ),
            const SizedBox(height: 20),

Row(
  children: [

    Expanded(
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.deepPurple,
          padding: const EdgeInsets.symmetric(vertical: 14),
        ),
        icon: const Icon(
          Icons.edit,
          color: Colors.white,
        ),
        label: const Text(
          "EDIT",
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    ),

    const SizedBox(width: 10),

    Expanded(
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          padding: const EdgeInsets.symmetric(vertical: 14),
        ),
        icon: const Icon(
          Icons.delete,
          color: Colors.white,
        ),
        label: const Text(
          "DELETE",
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () {
          showDialog(
            context: context,
            builder: (_) => AlertDialog(
              title: const Text("Delete Details"),
              content: const Text(
                "Are you sure you want to delete all saved details?"
              ),
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
                  onPressed: () async {

                    final prefs =
                        await SharedPreferences.getInstance();

                    await prefs.clear();

                    Navigator.pop(context);

                    Navigator.pop(context);

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Details Deleted"),
                      ),
                    );
                  },
                  child: const Text(
                    "Delete",
                    style: TextStyle(color: Colors.white),
                  ),
                ),

              ],
            ),
          );
        },
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
class _RegistrationPageState extends State<RegistrationPage> {

  final nameController = TextEditingController();
  final rollController = TextEditingController();
  final emailController = TextEditingController();
  final mobileController = TextEditingController();
  final cgpaController = TextEditingController();

  String selectedBranch = "Computer Science";
  bool interested = true;
Future<void> saveData() async {
  final prefs = await SharedPreferences.getInstance();

  await prefs.setString("name", nameController.text);
  await prefs.setString("roll", rollController.text);
  await prefs.setString("email", emailController.text);
  await prefs.setString("mobile", mobileController.text);
  await prefs.setString("branch", selectedBranch);
  await prefs.setString("cgpa", cgpaController.text);
  await prefs.setBool("interested", interested);

  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Text("Details Saved Successfully"),
      backgroundColor: Colors.green,
    ),
  );
  Navigator.push(
  context,
  MaterialPageRoute(
    builder: (_) => DashboardPage(
      name: nameController.text,
      roll: rollController.text,
      email: emailController.text,
      mobile: mobileController.text,
      branch: selectedBranch,
      cgpa: cgpaController.text,
      interested: interested,
    ),
  ),
);
}Future<void> loadData() async {
  final prefs = await SharedPreferences.getInstance();

  setState(() {
    nameController.text = prefs.getString("name") ?? "";
    rollController.text = prefs.getString("roll") ?? "";
    emailController.text = prefs.getString("email") ?? "";
    mobileController.text = prefs.getString("mobile") ?? "";
    selectedBranch =
        prefs.getString("branch") ?? "Computer Science";
    cgpaController.text = prefs.getString("cgpa") ?? "";
    interested = prefs.getBool("interested") ?? true;
  });
}
  final List<String> branches = [
    "Computer Science",
    "Information Technology",
    "Electronics",
    "Mechanical",
    "Civil"
  ];
  @override
void initState() {
  super.initState();
  loadData();
}
    @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text(
          "Student Placement Registration",
          style: TextStyle(color: Colors.white),
        ),
      ),

      body: SingleChildScrollView(

        padding: const EdgeInsets.all(16),

        child: Column(

          children: [

            Image.network(
              "https://cdn-icons-png.flaticon.com/512/3135/3135755.png",
              height: 120,
            ),

            const SizedBox(height: 20),

            const Text(
              "Register Your Details",
              style: TextStyle(
                color: Colors.deepPurple,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),

            const SizedBox(height: 20),
            TextField(
  controller: nameController,
  decoration: const InputDecoration(
    labelText: "Student Name",
    prefixIcon: Icon(Icons.person),
    border: OutlineInputBorder(),
  ),
),

const SizedBox(height: 15),
TextField(
  controller: rollController,
  decoration: const InputDecoration(
    labelText: "Roll Number",
    prefixIcon: Icon(Icons.badge),
    border: OutlineInputBorder(),
  ),
),

const SizedBox(height: 15),
TextField(
  controller: emailController,
  keyboardType: TextInputType.emailAddress,
  decoration: const InputDecoration(
    labelText: "Email",
    prefixIcon: Icon(Icons.email),
    border: OutlineInputBorder(),
  ),
),

const SizedBox(height: 15),
TextField(
  controller: mobileController,
  keyboardType: TextInputType.phone,
  decoration: const InputDecoration(
    labelText: "Mobile Number",
    prefixIcon: Icon(Icons.phone),
    border: OutlineInputBorder(),
  ),
),

const SizedBox(height: 15),
DropdownButtonFormField<String>(
  value: selectedBranch,
  decoration: const InputDecoration(
    labelText: "Branch",
    prefixIcon: Icon(Icons.school),
    border: OutlineInputBorder(),
  ),
  items: branches.map((branch) {
    return DropdownMenuItem(
      value: branch,
      child: Text(branch),
    );
  }).toList(),
  onChanged: (value) {
    setState(() {
      selectedBranch = value!;
    });
  },
),

const SizedBox(height: 15),
TextField(
  controller: cgpaController,
  keyboardType: const TextInputType.numberWithOptions(decimal: true),
  decoration: const InputDecoration(
    labelText: "CGPA",
    prefixIcon: Icon(Icons.bar_chart),
    border: OutlineInputBorder(),
  ),
),

const SizedBox(height: 15),
SwitchListTile(
  title: const Text("Interested in Placement"),
  secondary: const Icon(Icons.work),
  activeColor: Colors.deepPurple,
  value: interested,
  onChanged: (value) {
    setState(() {
      interested = value;
    });
  },
),

const SizedBox(height: 20),
Row(
  children: [

    Expanded(
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.deepPurple,
          padding: const EdgeInsets.symmetric(vertical: 14),
        ),
        onPressed: () {
  saveData();
},
        icon: const Icon(Icons.save, color: Colors.white),
        label: const Text(
          "SAVE",
          style: TextStyle(color: Colors.white),
        ),
      ),
    ),

    const SizedBox(width: 10),

    Expanded(
      child: OutlinedButton.icon(
        onPressed: () {
          nameController.clear();
          rollController.clear();
          emailController.clear();
          mobileController.clear();
          cgpaController.clear();

          setState(() {
            selectedBranch = "Computer Science";
            interested = true;
          });
        },
        icon: const Icon(Icons.refresh),
        label: const Text("CLEAR"),
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