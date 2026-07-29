import 'package:flutter/material.dart';

void main() {
  runApp(const StudentPortalApp());
}

class StudentPortalApp extends StatelessWidget {
  const StudentPortalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Student Information Portal",
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Widget buildInfoRow(IconData icon, String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Icon(icon, size: 20),
          const SizedBox(width: 15),

          SizedBox(
            width: 100,
            child: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          Expanded(
            child: SelectableText(
              value,
              style: const TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

Widget tableHeading(String text) {

  return Padding(

    padding: const EdgeInsets.all(8),

    child: Center(

      child: Text(

        text,

        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),

      ),

    ),

  );

}

TableRow tableRow(
    String subject,
    String max,
    String obtained) {

  return TableRow(

    children: [

      tableCell(subject),

      tableCell(max),

      Padding(

        padding: const EdgeInsets.all(8),

        child: Center(

          child: Text(

            obtained,

            style: const TextStyle(
              color: Colors.green,
              fontWeight: FontWeight.bold,
            ),

          ),

        ),

      ),

    ],

  );

}

Widget tableCell(String value) {

  return Padding(

    padding: const EdgeInsets.all(8),

    child: Center(
      child: Text(value),
    ),

  );

}

Widget summaryCard(
    IconData icon,
    String title,
    String value) {

  return Column(

    children: [

      Icon(
        icon,
        color: Colors.deepPurple,
      ),

      const SizedBox(height: 5),

      Text(
        title,
        style: const TextStyle(
          fontSize: 12,
        ),
      ),

      const SizedBox(height: 4),

      Text(

        value,

        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.deepPurple,
        ),

      ),

    ],

  );

}

void showStudentActions(BuildContext context) {

  showModalBottomSheet(

    context: context,

    shape: const RoundedRectangleBorder(

      borderRadius: BorderRadius.vertical(
        top: Radius.circular(20),
      ),

    ),

    builder: (context) {

      return Padding(

        padding: const EdgeInsets.all(16),

        child: Column(

          mainAxisSize: MainAxisSize.min,

          children: [

            const Text(

              "Student Actions",

              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),

            ),

            const SizedBox(height: 20),

            ListTile(

              leading: const Icon(
                Icons.email,
                color: Colors.deepPurple,
              ),

              title: const Text("Send Email"),

              onTap: () {

                Navigator.pop(context);

                showSnackBar(
                  context,
                  "Email option selected",
                );

              },

            ),

            ListTile(

              leading: const Icon(
                Icons.phone,
                color: Colors.green,
              ),

              title: const Text("Call Student"),

              onTap: () {

                Navigator.pop(context);

                showSnackBar(
                  context,
                  "Calling Student...",
                );

              },

            ),

            ListTile(

              leading: const Icon(
                Icons.location_on,
                color: Colors.red,
              ),

              title: const Text("View Address"),

              onTap: () {

                Navigator.pop(context);

                showSnackBar(
                  context,
                  "Opening Address",
                );

              },

            ),

            ListTile(

              leading: const Icon(
                Icons.share,
                color: Colors.orange,
              ),

              title: const Text("Share Profile"),

              onTap: () {

                Navigator.pop(context);

                showSnackBar(
                  context,
                  "Profile Shared Successfully",
                );

              },

            ),

            ListTile(

              leading: const Icon(
                Icons.download,
                color: Colors.blue,
              ),

              title: const Text("Download Marksheet"),

              onTap: () {

                Navigator.pop(context);

                showSnackBar(
                  context,
                  "Downloading Marksheet...",
                );

              },

            ),

            const Divider(),

            ListTile(

              leading: const Icon(
                Icons.close,
                color: Colors.red,
              ),

              title: const Text("Close"),

              onTap: () {

                Navigator.pop(context);

              },

            ),

          ],

        ),

      );

    },

  );

}
void showSnackBar(
  BuildContext context,
  String message,
) {

  ScaffoldMessenger.of(context).showSnackBar(

    SnackBar(

      content: Text(message),

      backgroundColor: Colors.deepPurple,

      duration: const Duration(seconds: 2),

      behavior: SnackBarBehavior.floating,

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),

      action: SnackBarAction(
        label: "OK",
        textColor: Colors.white,
        onPressed: () {},
      ),

    ),

  );

}
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text(
          "Student Information Portal",
          style: TextStyle(color: Colors.white),
        ),
        leading: const Icon(
          Icons.school,
          color: Colors.white,
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
          )
        ],
      ),

      body: SingleChildScrollView(

        padding: const EdgeInsets.all(12),

        child: Column(

          children: [

            Card(

              elevation: 4,

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),

              child: Padding(

                padding: const EdgeInsets.all(16),

                child: Column(

                  crossAxisAlignment:
                      CrossAxisAlignment.start,

                  children: [

                    Row(

                      children: [

                        const CircleAvatar(
                          radius: 22,
                          backgroundColor:
                              Colors.deepPurple,
                          child: Icon(
                            Icons.person,
                            color: Colors.white,
                          ),
                        ),

                        const SizedBox(width: 10),

                        const Text(

                          "Student Details",

                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepPurple,
                          ),

                        ),

                      ],

                    ),

                    const SizedBox(height: 20),

                    buildInfoRow(
                      Icons.person,
                      "Student Name",
                      " Varun pratap singh",
                    ),

                    buildInfoRow(
                      Icons.email,
                      "Email",
                      "varun@gmail.com",
                    ),

                    buildInfoRow(
                      Icons.phone,
                      "Mobile",
                      "+91 9876543210",
                    ),

                    buildInfoRow(
                      Icons.badge,
                      "Roll Number",
                      "CS202501",
                    ),

                    buildInfoRow(
                      Icons.language,
                      "College Website",
                      "www.fluttercollege.com",
                    ),

                  ],

                ),

              ),

            ),

            const SizedBox(height: 20),

                        Card(

              elevation: 4,

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),

              child: Padding(

                padding: const EdgeInsets.all(16),

                child: Column(

                  crossAxisAlignment:
                      CrossAxisAlignment.start,

                  children: [

                    Row(

                      children: [

                        const CircleAvatar(
                          radius: 22,
                          backgroundColor:
                              Colors.deepPurple,
                          child: Icon(
                            Icons.table_chart,
                            color: Colors.white,
                          ),
                        ),

                        const SizedBox(width: 10),

                        const Text(

                          "Student Marksheet",

                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepPurple,
                          ),

                        ),

                      ],

                    ),

                    const SizedBox(height: 15),

                    Table(

                      border: TableBorder.all(
                        color: Colors.grey.shade400,
                      ),

                      columnWidths: const {

                        0: FlexColumnWidth(2),

                        1: FlexColumnWidth(1.4),

                        2: FlexColumnWidth(1.4),

                      },

                      children: [

                        TableRow(

                          decoration: const BoxDecoration(
                            color: Colors.deepPurple,
                          ),

                          children: [

                            tableHeading("Subject"),

                            tableHeading("Max Marks"),

                            tableHeading("Obtained"),

                          ],

                        ),

                        tableRow(
                          "Mathematics",
                          "100",
                          "95",
                        ),

                        tableRow(
                          "Science",
                          "100",
                          "90",
                        ),

                        tableRow(
                          "English",
                          "100",
                          "88",
                        ),

                        tableRow(
                          "Computer",
                          "100",
                          "98",
                        ),

                        tableRow(
                          "Hindi",
                          "100",
                          "85",
                        ),

                      ],

                    ),

                    const SizedBox(height: 20),

                    Row(

                      mainAxisAlignment:
                          MainAxisAlignment.spaceAround,

                      children: [

                        summaryCard(
                          Icons.assignment,
                          "Total Marks",
                          "456 / 500",
                        ),

                        summaryCard(
                          Icons.percent,
                          "Percentage",
                          "91.2%",
                        ),

                        summaryCard(
                          Icons.star,
                          "Grade",
                          "A+",
                        ),

                      ],

                    ),

                  ],

                ),

              ),

            ),

            const SizedBox(height: 20),
                        SizedBox(

              width: double.infinity,

              child: ElevatedButton.icon(

                style: ElevatedButton.styleFrom(

                  backgroundColor: Colors.deepPurple,

                  padding: const EdgeInsets.symmetric(
                    vertical: 15,
                  ),

                  shape: RoundedRectangleBorder(

                    borderRadius:
                        BorderRadius.circular(10),

                  ),

                ),

                icon: const Icon(
                  Icons.list,
                  color: Colors.white,
                ),

                label: const Text(

                  "Show Student Actions",

                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),

                ),

                onPressed: () {

                  showStudentActions(context);

                },

              ),

            ),

          ],

        ),

      ),

      bottomNavigationBar: BottomNavigationBar(

        currentIndex: 0,

        selectedItemColor: Colors.deepPurple,

        items: const [

          BottomNavigationBarItem(

            icon: Icon(Icons.home),

            label: "Home",

          ),

          BottomNavigationBarItem(

            icon: Icon(Icons.person),

            label: "Profile",

          ),

          BottomNavigationBarItem(

            icon: Icon(Icons.settings),

            label: "Settings",

          ),

        ],

      ),

    );

  }
}