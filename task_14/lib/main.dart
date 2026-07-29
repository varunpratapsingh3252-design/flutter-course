import 'package:flutter/material.dart';

void main() {
  runApp(const CollegePortalApp());
}

class CollegePortalApp extends StatelessWidget {
  const CollegePortalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "College Student Portal",
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const MainScreen(),
    );
  }
}


class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {

  late TabController _tabController;

  int currentIndex = 0;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(
      length: 3,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  final List<Widget> pages = const [

    HomePage(),

    AttendancePage(),

    AssignmentPage(),

    ProfilePage(),

  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      drawer: Drawer(

        child: ListView(

          children: [

            UserAccountsDrawerHeader(

              decoration: const BoxDecoration(
                color: Colors.deepPurple,
              ),

              accountName: const Text("varun pratap singh"),

              accountEmail:
                  const Text("B.Tech CSE\nRoll No : 101"),

              currentAccountPicture: const CircleAvatar(
                child: Icon(
                  Icons.person,
                  size: 40,
                ),
              ),

            ),

            ListTile(
              leading: const Icon(Icons.dashboard),
              title: const Text("Dashboard"),
              onTap: () {
                Navigator.pop(context);
              },
            ),

            ListTile(
              leading: const Icon(Icons.person),
              title: const Text("Profile"),
              onTap: () {
                setState(() {
                  currentIndex = 3;
                });
                Navigator.pop(context);
              },
            ),

            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text("Settings"),
            ),

            ListTile(
              leading: const Icon(Icons.help),
              title: const Text("Help"),
            ),

            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text("Logout"),
            ),

          ],

        ),

      ),

      appBar: AppBar(

        backgroundColor: Colors.deepPurple,

        title: const Text(
          "College Student Portal",
        ),

        bottom: currentIndex == 0
            ? TabBar(
                controller: _tabController,
                tabs: const [

                  Tab(text: "Courses"),

                  Tab(text: "Notices"),

                  Tab(text: "Results"),

                ],
              )
            : null,

      ),
body: currentIndex == 0
    ? Column(
        children: [

          const Expanded(
            flex: 4,
            child: HomePage(),
          ),

          Expanded(
            flex: 5,
            child: TabBarView(
              controller: _tabController,
              children: const [
                CoursesTab(),
                NoticesTab(),
                ResultsTab(),
              ],
            ),
          ),

        ],
      )
    : pages[currentIndex],

      bottomNavigationBar: BottomNavigationBar(

        currentIndex: currentIndex,

        selectedItemColor: Colors.deepPurple,

        type: BottomNavigationBarType.fixed,

        onTap: (index) {

          setState(() {

            currentIndex = index;

          });

        },

        items: const [

          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.fact_check),
            label: "Attendance",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: "Assignments",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),

        ],

      ),

    );
  }
}

/// ---------------- HOME ----------------

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Widget quickCard(
      Color color, IconData icon, String title) {
    return Container(
      width: 150,
      height: 85,
      decoration: BoxDecoration(
        color: color.withOpacity(0.15),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color, size: 30),
          const SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [

          Container(
            padding: const EdgeInsets.all(18),
            decoration: const BoxDecoration(
              color: Colors.teal,
            ),
            child: Row(
              children: [

                Expanded(
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: const [

                      Text(
                        "Welcome Back 👋",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),

                      SizedBox(height: 10),

                      Text(
                        "Varun Pratap Singh",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),

                      SizedBox(height: 5),

                      Text(
                        "B.Tech CSE | Roll No:101",
                        style: TextStyle(
                          color: Colors.white70,
                        ),
                      ),

                    ],
                  ),
                ),

                const CircleAvatar(
                  radius: 35,
                  child: Icon(
                    Icons.person,
                    size: 40,
                  ),
                )

              ],
            ),
          ),

          const SizedBox(height: 20),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Quick Links",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          const SizedBox(height: 15),

          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16),

            child: Wrap(
              spacing: 15,
              runSpacing: 15,
              children: [

                quickCard(
                  Colors.orange,
                  Icons.menu_book,
                  "Courses",
                ),

                quickCard(
                  Colors.deepPurple,
                  Icons.campaign,
                  "Notices",
                ),

                quickCard(
                  Colors.green,
                  Icons.assignment,
                  "Assignments",
                ),

                quickCard(
                  Colors.red,
                  Icons.bar_chart,
                  "Results",
                ),

              ],
            ),
          ),

          const SizedBox(height: 25),

          Card(
            margin:
                const EdgeInsets.symmetric(horizontal: 16),

            child: ListTile(
              leading: const CircleAvatar(
                child: Icon(Icons.school),
              ),
              title: const Text(
                "Flutter Development",
              ),
              subtitle: const Text(
                  "Instructor : Mr. Sharma"),
              trailing: Chip(
                label: const Text("Active"),
                backgroundColor:
                    Colors.green.shade100,
              ),
            ),
          ),

          Card(
            margin:
                const EdgeInsets.symmetric(horizontal: 16),

            child: ListTile(
              leading: const CircleAvatar(
                child: Icon(Icons.computer),
              ),
              title: const Text(
                "Python Programming",
              ),
              subtitle:
                  const Text("Instructor : Mr. Verma"),
              trailing: Chip(
                label: const Text("Ongoing"),
                backgroundColor:
                    Colors.orange.shade100,
              ),
            ),
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

/// ---------------- ATTENDANCE ----------------

class AttendancePage extends StatelessWidget {
  const AttendancePage({super.key});

  Widget attendanceTile(
      IconData icon,
      Color color,
      String title,
      String value) {
    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 6,
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color.withOpacity(.15),
          child: Icon(
            icon,
            color: color,
          ),
        ),
        title: Text(title),
        trailing: Text(
          value,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(

      child: Column(

        children: [

          const SizedBox(height: 20),

          const Text(
            "My Attendance",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 20),

          SizedBox(
            height: 180,
            width: 180,
            child: Stack(
              alignment: Alignment.center,
              children: [

                SizedBox(
                  height: 170,
                  width: 170,
                  child: CircularProgressIndicator(
                    value: .85,
                    strokeWidth: 12,
                    backgroundColor: Colors.grey.shade300,
                    color: Colors.blue,
                  ),
                ),

                const Column(
                  mainAxisAlignment:
                      MainAxisAlignment.center,
                  children: [

                    Text(
                      "85%",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Text("Present"),

                  ],
                ),

              ],
            ),
          ),

          const SizedBox(height: 25),

          attendanceTile(
            Icons.calendar_month,
            Colors.blue,
            "Total Classes",
            "120",
          ),

          attendanceTile(
            Icons.check_circle,
            Colors.green,
            "Classes Attended",
            "102",
          ),

          attendanceTile(
            Icons.cancel,
            Colors.red,
            "Classes Missed",
            "18",
          ),

          attendanceTile(
            Icons.percent,
            Colors.deepPurple,
            "Attendance Percentage",
            "85%",
          ),

          const SizedBox(height: 20),

          Card(
            margin:
                const EdgeInsets.symmetric(horizontal: 16),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: const [

                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                    children: [

                      Text("Minimum Required"),

                      Text(
                        "75%",
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                    ],
                  ),

                  SizedBox(height: 10),

                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                    children: [

                      Text("Current"),

                      Text(
                        "85%",
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                    ],
                  ),

                ],
              ),
            ),
          ),

          const SizedBox(height: 20),

        ],
      ),
    );
  }
}

/// ---------------- ASSIGNMENTS ----------------

class AssignmentPage extends StatelessWidget {
  const AssignmentPage({super.key});

  Widget assignmentCard({
    required IconData icon,
    required Color color,
    required String title,
    required String subject,
    required String dueDate,
    required String status,
    required Color statusColor,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color.withOpacity(.15),
          child: Icon(
            icon,
            color: color,
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(subject),
            const SizedBox(height: 4),
            Text(
              "Due: $dueDate",
              style: const TextStyle(
                color: Colors.red,
                fontSize: 12,
              ),
            ),
          ],
        ),
        trailing: Chip(
          backgroundColor: statusColor.withOpacity(.15),
          label: Text(
            status,
            style: TextStyle(
              color: statusColor,
              fontWeight: FontWeight.bold,
              fontSize: 11,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(

      child: Column(

        children: [

          const SizedBox(height: 20),

          const Text(
            "My Assignments",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 20),

          assignmentCard(
            icon: Icons.description,
            color: Colors.blue,
            title: "Flutter Assignment-13",
            subject: "Build Navigation UI",
            dueDate: "24 May 2025",
            status: "Due Tomorrow",
            statusColor: Colors.red,
          ),

          assignmentCard(
            icon: Icons.code,
            color: Colors.green,
            title: "Java Assignment-7",
            subject: "OOP Concepts",
            dueDate: "25 May 2025",
            status: "3 Days Left",
            statusColor: Colors.orange,
          ),

          assignmentCard(
            icon: Icons.memory,
            color: Colors.orange,
            title: "Python Assignment-5",
            subject: "Functions & Modules",
            dueDate: "28 May 2025",
            status: "6 Days Left",
            statusColor: Colors.green,
          ),

          assignmentCard(
            icon: Icons.storage,
            color: Colors.deepPurple,
            title: "DBMS Assignment",
            subject: "Normalization",
            dueDate: "30 May 2025",
            status: "1 Week Left",
            statusColor: Colors.blue,
          ),

          assignmentCard(
            icon: Icons.language,
            color: Colors.teal,
            title: "Web Development",
            subject: "Responsive Layout",
            dueDate: "02 June 2025",
            status: "Pending",
            statusColor: Colors.purple,
          ),

          const SizedBox(height: 20),

          Card(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: const [

                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                    children: [

                      Text(
                        "Total Assignments",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      Text("5"),

                    ],
                  ),

                  SizedBox(height: 12),

                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                    children: [

                      Text(
                        "Completed",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      Text(
                        "2",
                        style: TextStyle(
                          color: Colors.green,
                        ),
                      ),

                    ],
                  ),

                  SizedBox(height: 12),

                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                    children: [

                      Text(
                        "Pending",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      Text(
                        "3",
                        style: TextStyle(
                          color: Colors.red,
                        ),
                      ),

                    ],
                  ),

                ],
              ),
            ),
          ),

          const SizedBox(height: 20),

        ],
      ),
    );
  }
}

/// ---------------- PROFILE ----------------

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  Widget infoTile(
      IconData icon,
      Color color,
      String title,
      String value) {
    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 6,
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color.withOpacity(.15),
          child: Icon(
            icon,
            color: color,
          ),
        ),
        title: Text(title),
        subtitle: Text(value),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(

      child: Column(

        children: [

          const SizedBox(height: 25),

          const CircleAvatar(
            radius: 55,
            backgroundColor: Colors.deepPurple,
            child: Icon(
              Icons.person,
              size: 60,
              color: Colors.white,
            ),
          ),

          const SizedBox(height: 15),

          const Text(
            "Varun Pratap Singh",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 5),

          const Text(
            "B.Tech Computer Science",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 16,
            ),
          ),

          const SizedBox(height: 25),

          infoTile(
            Icons.badge,
            Colors.blue,
            "Roll Number",
            "101",
          ),

          infoTile(
            Icons.email,
            Colors.red,
            "Email",
            "varunpratap singh@gmail.com",
          ),

          infoTile(
            Icons.phone,
            Colors.green,
            "Phone",
            "+91 9876543210",
          ),

          infoTile(
            Icons.school,
            Colors.orange,
            "Department",
            "Computer Science",
          ),

          infoTile(
            Icons.calendar_today,
            Colors.purple,
            "Semester",
            "5th Semester",
          ),

          const SizedBox(height: 25),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),

            child: SizedBox(
              width: double.infinity,

              child: ElevatedButton.icon(

                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  padding: const EdgeInsets.all(15),
                ),

                icon: const Icon(Icons.edit),

                label: const Text(
                  "Edit Profile",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),

                onPressed: () {

                  ScaffoldMessenger.of(context).showSnackBar(

                    const SnackBar(

                      content:
                          Text("Profile Updated Successfully"),

                    ),

                  );

                },

              ),

            ),

          ),

          const SizedBox(height: 15),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),

            child: SizedBox(
              width: double.infinity,

              child: OutlinedButton.icon(

                icon: const Icon(Icons.logout),

                label: const Text("Logout"),

                onPressed: () {

                  ScaffoldMessenger.of(context).showSnackBar(

                    const SnackBar(

                      content: Text("Logged Out"),

                    ),

                  );

                },

              ),

            ),

          ),

          const SizedBox(height: 30),

        ],

      ),

    );
  }
}

/// ---------------- TAB 1 ----------------

class CoursesTab extends StatelessWidget {
  const CoursesTab({super.key});

  Widget courseCard(
      IconData icon,
      Color color,
      String title,
      String subtitle,
      String teacher) {
    return Card(
      margin: const EdgeInsets.symmetric(
          horizontal: 12, vertical: 6),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color.withOpacity(.15),
          child: Icon(icon, color: color),
        ),
        title: Text(
          title,
          style: const TextStyle(
              fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            Text(subtitle),
            Text(
              teacher,
              style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [

        courseCard(
          Icons.menu_book,
          Colors.blue,
          "Flutter Development",
          "Learn Flutter from Basics",
          "Instructor: Mr. Sharma",
        ),

        courseCard(
          Icons.computer,
          Colors.green,
          "Java Programming",
          "Core Java and OOPs",
          "Instructor: Ms. Joshi",
        ),

        courseCard(
          Icons.code,
          Colors.orange,
          "Python Programming",
          "Python for Beginners",
          "Instructor: Mr. Verma",
        ),

      ],
    );
  }
}

/// ---------------- TAB 2 ----------------

class NoticesTab extends StatelessWidget {
  const NoticesTab({super.key});

  Widget noticeCard(
      IconData icon,
      Color color,
      String title,
      String date,
      String subtitle) {
    return Card(
      margin: const EdgeInsets.symmetric(
          horizontal: 12, vertical: 6),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color.withOpacity(.15),
          child: Icon(icon, color: color),
        ),
        title: Text(
          title,
          style: const TextStyle(
              fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            Text(
              date,
              style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey),
            ),
            const SizedBox(height: 4),
            Text(subtitle),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [

        noticeCard(
          Icons.campaign,
          Colors.deepPurple,
          "Holiday Tomorrow",
          "20 May 2025",
          "College will remain closed tomorrow on account of Local Holiday.",
        ),

        noticeCard(
          Icons.description,
          Colors.blue,
          "Flutter Assignment Submission",
          "18 May 2025",
          "Submit your Flutter Assignment before 22 May 2025.",
        ),

        noticeCard(
          Icons.calendar_month,
          Colors.orange,
          "Mid Semester Exam",
          "15 May 2025",
          "Mid Semester Exams will start from 1st June 2025.",
        ),

      ],
    );
  }
}

/// ---------------- TAB 3 ----------------

class ResultsTab extends StatelessWidget {
  const ResultsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox();
  }
}
