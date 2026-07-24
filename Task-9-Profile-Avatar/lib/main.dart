import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const ProfileAvatarScreen(),
    );
  }
}

class ProfileAvatarScreen extends StatelessWidget {
  const ProfileAvatarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Task-8B: Profile Avatars"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [

              const SizedBox(height: 20),

              const Text(
                "Profile with Camera Icon",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              Stack(
                clipBehavior: Clip.none,
                children: [

                  const CircleAvatar(
                    radius: 90,
                    backgroundImage: AssetImage("assets/profile.jpg"),
                  ),

                  Positioned(
                    right: -5,
                    bottom: -5,
                    child: CircleAvatar(
                      radius: 26,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 22,
                        backgroundColor: Colors.blue,
                        child: const Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                          size: 28,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 80),

              const Text(
                "Profile with Online Indicator",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              Stack(
                clipBehavior: Clip.none,
                children: [

                  const CircleAvatar(
                    radius: 90,
                    backgroundImage: AssetImage("assets/profile.jpg"),
                  ),

                  Positioned(
                    right: 10,
                    top: 10,
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white,
                          width: 3,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}