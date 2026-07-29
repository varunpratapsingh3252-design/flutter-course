import 'package:flutter/material.dart';
class RegistrationPage extends StatefulWidget {
  final nameController = TextEditingController();
final rollController = TextEditingController();
final emailController = TextEditingController();
final mobileController = TextEditingController();
final cgpaController = TextEditingController();

String branch = "Computer Science";
bool interested = true;

final branches = [
  "Computer Science",
  "Information Technology",
  "Electronics",
  "Mechanical",
  "Civil"
];
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}
