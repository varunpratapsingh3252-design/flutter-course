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
      title: "User Preferences",
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const UserPreferenceScreen(),
    );
  }
}

class UserPreferenceScreen extends StatefulWidget {
  const UserPreferenceScreen({super.key});

  @override
  State<UserPreferenceScreen> createState() =>
      _UserPreferenceScreenState();
}

class _UserPreferenceScreenState
    extends State<UserPreferenceScreen> {

  bool notifications = true;

  bool darkMode = true;

  int gender = 1;

  bool accepted = true;

  double fontSize = 20;

  String selectedInterest = "Flutter";

  int currentStep = 1;

  final List<String> interests = [
    "Flutter",
    "AI",
    "Web Development",
    "Game Development",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        leading: const Icon(Icons.arrow_back, color: Colors.white),
        title: const Text(
          "User Preferences",
          style: TextStyle(color: Colors.white),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(Icons.more_vert, color: Colors.white),
          )
        ],
      ),

      body: ListView(
        padding: const EdgeInsets.all(15),
        children: [

          /// Notifications
          Row(
            children: [

              CircleAvatar(
                radius: 16,
                backgroundColor: Colors.deepPurple.shade50,
                child: const Icon(
                  Icons.notifications_none,
                  color: Colors.deepPurple,
                  size: 18,
                ),
              ),

              const SizedBox(width: 12),

              const Expanded(
                child: Text(
                  "Enable Notifications",
                  style: TextStyle(fontSize: 16),
                ),
              ),

              Switch(
                value: notifications,
                activeColor: Colors.deepPurple,
                onChanged: (value) {
                  setState(() {
                    notifications = value;
                  });
                },
              )

            ],
          ),

          Padding(
            padding: const EdgeInsets.only(left: 45),
            child: Text(
              "Notifications : ${notifications ? "Enabled" : "Disabled"}",
              style: TextStyle(
                color: notifications
                    ? Colors.green
                    : Colors.red,
              ),
            ),
          ),

          const Divider(height: 30),

          /// Theme

          Row(
            children: [

              CircleAvatar(
                radius: 16,
                backgroundColor: Colors.orange.shade50,
                child: const Icon(
                  Icons.wb_sunny_outlined,
                  color: Colors.orange,
                  size: 18,
                ),
              ),

              const SizedBox(width: 12),

              const Text(
                "Choose Theme",
                style: TextStyle(fontSize: 16),
              ),

            ],
          ),

          const SizedBox(height: 15),

          ToggleButtons(

            borderRadius: BorderRadius.circular(8),

            isSelected: [
              !darkMode,
              darkMode,
            ],

            selectedColor: Colors.white,

            fillColor: Colors.deepPurple,

            constraints: const BoxConstraints(
              minWidth: 150,
              minHeight: 45,
            ),

            onPressed: (index) {

              setState(() {

                darkMode = index == 1;

              });

            },

            children: const [

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Icon(Icons.wb_sunny),

                  SizedBox(width: 6),

                  Text("Light"),

                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Icon(Icons.nightlight_round),

                  SizedBox(width: 6),

                  Text("Dark"),

                ],
              ),

            ],

          ),

          const SizedBox(height: 10),

          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Text(
              "Selected Mode : ${darkMode ? "Dark" : "Light"}",
              style: TextStyle(
                color: Colors.deepPurple.shade700,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const Divider(height: 35),
                    /// Gender Selection

          Row(
            children: [

              CircleAvatar(
                radius: 16,
                backgroundColor: Colors.pink.shade50,
                child: const Icon(
                  Icons.person_outline,
                  color: Colors.pink,
                  size: 18,
                ),
              ),

              const SizedBox(width: 12),

              const Text(
                "Select Gender",
                style: TextStyle(fontSize: 16),
              ),

            ],
          ),

          const SizedBox(height: 12),

          Row(
            children: [

              Expanded(
                child: RadioListTile<int>(
                  value: 0,
                  groupValue: gender,
                  title: const Text("Male"),
                  onChanged: (value) {
                    setState(() {
                      gender = value!;
                    });
                  },
                ),
              ),

              Expanded(
                child: RadioListTile<int>(
                  value: 1,
                  groupValue: gender,
                  title: const Text("Female"),
                  onChanged: (value) {
                    setState(() {
                      gender = value!;
                    });
                  },
                ),
              ),

              Expanded(
                child: RadioListTile<int>(
                  value: 2,
                  groupValue: gender,
                  title: const Text("Other"),
                  onChanged: (value) {
                    setState(() {
                      gender = value!;
                    });
                  },
                ),
              ),

            ],
          ),

          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Text(
              "Selected Gender : ${gender == 0 ? "Male" : gender == 1 ? "Female" : "Other"}",
              style: TextStyle(
                color: Colors.deepPurple.shade700,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const Divider(height: 35),

          /// Terms & Conditions

          CheckboxListTile(
            value: accepted,
            activeColor: Colors.green,
            controlAffinity: ListTileControlAffinity.leading,
            title: RichText(
              text: const TextSpan(
                style: TextStyle(color: Colors.black),
                children: [
                  TextSpan(text: "I accept the "),
                  TextSpan(
                    text: "Terms & Conditions",
                    style: TextStyle(
                      color: Colors.deepPurple,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            onChanged: (value) {
              setState(() {
                accepted = value!;
              });
            },
          ),

          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Text(
              "Status : ${accepted ? "Accepted" : "Not Accepted"}",
              style: TextStyle(
                color: accepted ? Colors.green : Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const Divider(height: 35),

          /// Font Size

          Row(
            children: [

              CircleAvatar(
                radius: 16,
                backgroundColor: Colors.blue.shade50,
                child: const Text(
                  "A",
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(width: 12),

              const Text(
                "Font Size",
                style: TextStyle(fontSize: 16),
              ),

              const SizedBox(width: 5),

              Text(
                "(Sample Text)",
                style: TextStyle(
                  color: Colors.grey.shade600,
                ),
              ),

            ],
          ),

          const SizedBox(height: 15),

          Row(
            children: [

              const Text("10"),

              Expanded(
                child: Slider(
                  min: 10,
                  max: 30,
                  divisions: 20,
                  value: fontSize,
                  activeColor: Colors.deepPurple,
                  label: fontSize.round().toString(),
                  onChanged: (value) {
                    setState(() {
                      fontSize = value;
                    });
                  },
                ),
              ),

              const Text("30"),

            ],
          ),

          Align(
            alignment: Alignment.centerRight,
            child: Text(
              "Current Size : ${fontSize.round()}",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const SizedBox(height: 15),

          Center(
            child: Text(
              "Flutter is Awesome!",
              style: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const Divider(height: 35),
                    /// Interests

          Row(
            children: [

              CircleAvatar(
                radius: 16,
                backgroundColor: Colors.purple.shade50,
                child: const Icon(
                  Icons.favorite_border,
                  color: Colors.purple,
                  size: 18,
                ),
              ),

              const SizedBox(width: 12),

              const Text(
                "Choose Your Interests",
                style: TextStyle(fontSize: 16),
              ),

              const SizedBox(width: 5),

              Text(
                "(Select One)",
                style: TextStyle(
                  color: Colors.grey.shade600,
                ),
              ),

            ],
          ),

          const SizedBox(height: 15),

          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: interests.map((interest) {

              return ChoiceChip(

                label: Text(interest),

                selected: selectedInterest == interest,

                selectedColor: Colors.deepPurple,

                labelStyle: TextStyle(
                  color: selectedInterest == interest
                      ? Colors.white
                      : Colors.deepPurple,
                ),

                avatar: selectedInterest == interest
                    ? const Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 18,
                      )
                    : null,

                onSelected: (selected) {
                  setState(() {
                    selectedInterest = interest;
                  });
                },

              );

            }).toList(),
          ),

          const SizedBox(height: 12),

          Text(
            "Selected Interest : $selectedInterest",
            style: TextStyle(
              color: Colors.deepPurple.shade700,
              fontWeight: FontWeight.bold,
            ),
          ),

          const Divider(height: 35),

          /// Action Chips

          Row(
            children: [

              CircleAvatar(
                radius: 16,
                backgroundColor: Colors.yellow.shade100,
                child: const Icon(
                  Icons.flash_on,
                  color: Colors.orange,
                  size: 18,
                ),
              ),

              const SizedBox(width: 12),

              const Text(
                "Quick Actions",
                style: TextStyle(fontSize: 16),
              ),

            ],
          ),

          const SizedBox(height: 15),

          Wrap(
            spacing: 12,
            children: [

              ActionChip(
                avatar: const Icon(
                  Icons.refresh,
                  size: 18,
                  color: Colors.deepPurple,
                ),
                label: const Text("Reset"),
                onPressed: () {
                  setState(() {
                    notifications = true;
                    darkMode = true;
                    gender = 1;
                    accepted = true;
                    fontSize = 20;
                    selectedInterest = "Flutter";
                    currentStep = 1;
                  });
                },
              ),

              ActionChip(
                avatar: const Icon(
                  Icons.save,
                  size: 18,
                  color: Colors.white,
                ),
                backgroundColor: Colors.deepPurple,
                label: const Text(
                  "Save",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      backgroundColor: Colors.green,
                      content: Text(
                        "Preferences Saved Successfully!",
                      ),
                    ),
                  );
                },
              ),

            ],
          ),

          const SizedBox(height: 25),

          /// Success Banner

          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 12,
            ),
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: const [

                Icon(
                  Icons.check_circle,
                  color: Colors.white,
                ),

                SizedBox(width: 10),

                Expanded(
                  child: Text(
                    "Preferences Saved Successfully!",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                Text(
                  "DISMISS",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),

              ],
            ),
          ),

          const Divider(height: 35),
                    /// Profile Completion

          const Text(
            "Profile Completion",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 15),

          Stepper(
            currentStep: currentStep,
            physics: const NeverScrollableScrollPhysics(),
            controlsBuilder: (context, details) {
              return const SizedBox.shrink();
            },
            onStepTapped: (step) {
              setState(() {
                currentStep = step;
              });
            },
            steps: const [

              Step(
                title: Text("Account"),
                subtitle: Text("Create your account"),
                content: Text(
                  "Account details completed.",
                ),
                isActive: true,
              ),

              Step(
                title: Text("Profile"),
                subtitle: Text("Personal information"),
                content: Text(
                  "Profile information completed.",
                ),
                isActive: true,
              ),

              Step(
                title: Text("Finish"),
                subtitle: Text("Ready to use"),
                content: Text(
                  "You're all set!",
                ),
                isActive: true,
              ),

            ],
          ),

          const SizedBox(height: 25),

          Row(
            children: [

              Expanded(
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50),
                  ),
                  onPressed: () {
                    if (currentStep > 0) {
                      setState(() {
                        currentStep--;
                      });
                    }
                  },
                  child: const Text(
                    "Cancel",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),

              const SizedBox(width: 15),

              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    minimumSize: const Size.fromHeight(50),
                  ),
                  onPressed: () {
                    if (currentStep < 2) {
                      setState(() {
                        currentStep++;
                      });
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          backgroundColor: Colors.green,
                          content: Text(
                            "Setup Completed Successfully!",
                          ),
                        ),
                      );
                    }
                  },
                  child: const Text(
                    "Continue",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),

            ],
          ),

          const SizedBox(height: 30),

        ],
      ),
    );
  }
}