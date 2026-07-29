import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:webview_flutter/webview_flutter.dart';
void main() {
  runApp(const StudentAssignmentApp());
}

class StudentAssignmentApp extends StatelessWidget {
  const StudentAssignmentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Student Assignment Portal",
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const AssignmentHomePage(),
    );
  }
}

class AssignmentHomePage extends StatelessWidget {
  const AssignmentHomePage({super.key});

  Widget infoRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          SizedBox(
            width: 95,
            child: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text(
          "Student Assignment Portal",
          style: TextStyle(color: Colors.white),
        ),
        leading: const Icon(Icons.menu, color: Colors.white),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 12),
            child: Icon(Icons.notifications, color: Colors.white),
          )
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          children: [

            Image.network(
              "https://cdn-icons-png.flaticon.com/512/3135/3135755.png",
              height: 120,
            ),

            const SizedBox(height: 15),

            Card(
              elevation: 4,

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),

              child: Padding(
                padding: const EdgeInsets.all(16),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [

                    const Text(
                      "Assignment Details",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 15),

                    infoRow(
                        "Assignment",
                        "Flutter UI Widgets"),

                    infoRow(
                        "Subject",
                        "Mobile Application Dev."),

                    infoRow(
                        "Faculty",
                        "Mr. Pankaj Kapoor"),

                    infoRow(
                        "Last Date",
                        "30 July 2026"),

                    infoRow(
                        "Total Marks",
                        "100"),

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
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),

                icon: const Icon(
                  Icons.upload_file,
                  color: Colors.white,
                ),

                label: const Text(
                  "Submit Assignment",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),

                onPressed: () {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (_) => const SubmitAssignmentPage(),
    ),
  );
},
              ),
            ),

            const SizedBox(height: 12),

            SizedBox(
              width: double.infinity,

              child: OutlinedButton.icon(

                icon: const Icon(Icons.description),

                label: const Text(
                  "View Assignment Guidelines",
                  style: TextStyle(color: Colors.deepPurple),
                ),

                onPressed: () {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (_) => const GuidelinesPage(),
    ),
  );
},

              ),
            ),
          SizedBox(
  width: double.infinity,
  child: OutlinedButton.icon(
    icon: const Icon(Icons.description),
    label: const Text(
      "View Assignment Guidelines",
      style: TextStyle(color: Colors.deepPurple),
    ),
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => const GuidelinesPage(),
        ),
      );
    },
  ),
),

const SizedBox(height: 12),

SizedBox(
  width: double.infinity,
  child: OutlinedButton.icon(
    icon: const Icon(Icons.language),
    label: const Text(
      "Flutter Documentation",
      style: TextStyle(color: Colors.deepPurple),
    ),
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => const FlutterDocsPage(),
        ),
      );
    },
  ),
),const SizedBox(height: 12),

SizedBox(
  width: double.infinity,
  child: OutlinedButton.icon(
    icon: const Icon(Icons.info_outline),
    label: const Text(
      "Tooltip Demo",
      style: TextStyle(color: Colors.deepPurple),
    ),
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => const TooltipPage(),
        ),
      );
    },
  ),
),],
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
            icon: Icon(Icons.assignment),
            label: "My Submissions",
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
class SubmitAssignmentPage extends StatefulWidget {
  const SubmitAssignmentPage({super.key});

  @override
  State<SubmitAssignmentPage> createState() =>
      _SubmitAssignmentPageState();
}

class _SubmitAssignmentPageState
    extends State<SubmitAssignmentPage> {

  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  String? fileName;

  Future<void> pickDate() async {

    final date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2025),
      lastDate: DateTime(2030),
    );

    if (date != null) {
      setState(() {
        selectedDate = date;
      });
    }
  }

  Future<void> pickTime() async {

    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (time != null) {
      setState(() {
        selectedTime = time;
      });
    }
  }

  Future<void> pickFile() async {

    FilePickerResult? result =
        await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {
        fileName = result.files.single.name;
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text(
          "Submit Assignment",
          style: TextStyle(color: Colors.white),
        ),
      ),

      body: Padding(

        padding: const EdgeInsets.all(16),

        child: Column(

          children: [

            ListTile(

              leading: const Icon(
                Icons.calendar_today,
                color: Colors.deepPurple,
              ),

              title: const Text("Select Submission Date"),

              subtitle: Text(

                selectedDate == null
                    ? "Choose Date"
                    : "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}",

              ),

              trailing: const Icon(Icons.edit_calendar),

              onTap: pickDate,

            ),

            const Divider(),

            ListTile(

              leading: const Icon(
                Icons.access_time,
                color: Colors.deepPurple,
              ),

              title: const Text("Select Submission Time"),

              subtitle: Text(

                selectedTime == null
                    ? "Choose Time"
                    : selectedTime!.format(context),

              ),

              trailing: const Icon(Icons.schedule),

              onTap: pickTime,

            ),

            const Divider(),

            ListTile(

              leading: const Icon(
                Icons.picture_as_pdf,
                color: Colors.red,
              ),

              title: const Text("Upload Assignment File"),

              subtitle: Text(
                fileName ?? "No file selected",
              ),

              trailing: const Icon(Icons.upload_file),

              onTap: pickFile,

            ),

            const SizedBox(height: 30),

            SizedBox(

              width: double.infinity,

              child: ElevatedButton(

                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  padding: const EdgeInsets.symmetric(
                    vertical: 15,
                  ),
                ),

                onPressed: () {

                  if (selectedDate == null ||
                      selectedTime == null ||
                      fileName == null) {

                    ScaffoldMessenger.of(context)
                        .showSnackBar(

                      const SnackBar(

                        content: Text(
                          "Please complete all fields",
                        ),

                      ),

                    );

                    return;

                  }

                  // Upload Screen will be added in Part 3
 Navigator.push(
  context,
  MaterialPageRoute(
    builder: (_) => const UploadingPage(),
  ),
);
                },

                child: const Text(

                  "Submit Assignment",

                  style: TextStyle(
                    color: Colors.white,
                  ),

                ),

              ),

            ),

          ],

        ),

      ),

    );

  }

}
class UploadingPage extends StatefulWidget {
  const UploadingPage({super.key});

  @override
  State<UploadingPage> createState() => _UploadingPageState();
}

class _UploadingPageState extends State<UploadingPage> {

  double progress = 0;

  @override
  void initState() {
    super.initState();
    startUpload();
  }

  void startUpload() {

    Future.doWhile(() async {

      await Future.delayed(
        const Duration(milliseconds: 80),
      );

      if (!mounted) return false;

      setState(() {
        progress += 0.02;
      });

      if (progress >= 1) {

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => const SubmissionSuccessPage(),
          ),
        );

        return false;
      }

      return true;

    });

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text(
          "Uploading Assignment",
          style: TextStyle(color: Colors.white),
        ),
      ),

      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,

          children: [

            const Icon(
              Icons.cloud_upload,
              size: 110,
              color: Colors.deepPurple,
            ),

            const SizedBox(height: 20),

            const Text(
              "Uploading Assignment...",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 35),

            SizedBox(

              height: 130,
              width: 130,

              child: Stack(

                alignment: Alignment.center,

                children: [

                  CircularProgressIndicator(

                    value: progress,
                    strokeWidth: 8,

                    backgroundColor: Colors.grey.shade300,

                    color: Colors.deepPurple,

                  ),

                  Text(

                    "${(progress * 100).toInt()}%",

                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),

                  ),

                ],

              ),

            ),

          ],

        ),

      ),

    );

  }

}
class SubmissionSuccessPage extends StatelessWidget {
  const SubmissionSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Submission Successful",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green,
      ),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [

              const CircleAvatar(
                radius: 60,
                backgroundColor: Colors.green,
                child: Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 70,
                ),
              ),

              const SizedBox(height: 25),

              const Text(
                "Assignment Submitted Successfully!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                "Your assignment has been uploaded successfully.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),

              const SizedBox(height: 40),

              SizedBox(
                width: double.infinity,

                child: ElevatedButton.icon(
                  icon: const Icon(
                    Icons.star,
                    color: Colors.white,
                  ),

                  label: const Text(
                    "Rate Experience",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),

                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    padding: const EdgeInsets.symmetric(
                      vertical: 15,
                    ),
                  ),

                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const RatingPage(),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 15),

              SizedBox(
                width: double.infinity,

                child: OutlinedButton(
                  child: const Text("Back to Home"),

                  onPressed: () {
                    Navigator.popUntil(
                      context,
                      (route) => route.isFirst,
                    );
                  },
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
class RatingPage extends StatefulWidget {
  const RatingPage({super.key});

  @override
  State<RatingPage> createState() => _RatingPageState();
}

class _RatingPageState extends State<RatingPage> {

  int rating = 0;

  final TextEditingController feedbackController =
      TextEditingController();

  Widget buildStar(int index) {

    return IconButton(

      icon: Icon(

        index <= rating
            ? Icons.star
            : Icons.star_border,

        color: Colors.amber,

        size: 40,

      ),

      onPressed: () {

        setState(() {

          rating = index;

        });

      },

    );

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(

        backgroundColor: Colors.deepPurple,

        title: const Text(
          "Rate Experience",
          style: TextStyle(color: Colors.white),
        ),

      ),

      body: Padding(

        padding: const EdgeInsets.all(20),

        child: Column(

          children: [

            const SizedBox(height: 20),

            const Icon(
              Icons.emoji_events,
              size: 90,
              color: Colors.orange,
            ),

            const SizedBox(height: 20),

            const Text(

              "How was your submission experience?",

              textAlign: TextAlign.center,

              style: TextStyle(

                fontSize: 22,

                fontWeight: FontWeight.bold,

              ),

            ),

            const SizedBox(height: 25),

            Row(

              mainAxisAlignment:
                  MainAxisAlignment.center,

              children: [

                buildStar(1),

                buildStar(2),

                buildStar(3),

                buildStar(4),

                buildStar(5),

              ],

            ),

            const SizedBox(height: 25),

            TextField(

              controller: feedbackController,

              maxLines: 4,

              decoration: const InputDecoration(

                labelText: "Feedback",

                hintText:
                    "Write your feedback here...",

                border: OutlineInputBorder(),

              ),

            ),

            const SizedBox(height: 25),

            SizedBox(

              width: double.infinity,

              child: ElevatedButton(

                style: ElevatedButton.styleFrom(

                  backgroundColor:
                      Colors.deepPurple,

                  padding:
                      const EdgeInsets.symmetric(
                    vertical: 15,
                  ),

                ),

                onPressed: () {

                  showDialog(

                    context: context,

                    builder: (_) {

                      return AlertDialog(

                        title: const Text(
                          "Thank You!",
                        ),

                        content: Text(

                          "You rated this app $rating ⭐\n\nFeedback Submitted Successfully.",

                        ),

                        actions: [

                          ElevatedButton(

                            onPressed: () {

                              Navigator.pop(context);

                              Navigator.pop(context);

                            },

                            child: const Text("OK"),

                          ),

                        ],

                      );

                    },

                  );

                },

                child: const Text(

                  "Submit Feedback",

                  style: TextStyle(
                    color: Colors.white,
                  ),

                ),

              ),

            ),

          ],

        ),

      ),

    );

  }

}
class GuidelinesPage extends StatelessWidget {
  const GuidelinesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text(
          "Assignment Guidelines",
          style: TextStyle(color: Colors.white),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            const Center(
              child: Icon(
                Icons.assignment,
                color: Colors.deepPurple,
                size: 80,
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              "Guidelines",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),

            const SizedBox(height: 20),

            guideline(
              Icons.check_circle,
              "Submit the assignment before the deadline.",
            ),

            guideline(
              Icons.check_circle,
              "Upload the assignment in PDF format.",
            ),

            guideline(
              Icons.check_circle,
              "Maximum file size: 10 MB.",
            ),

            guideline(
              Icons.check_circle,
              "Ensure your name and roll number are mentioned.",
            ),

            guideline(
              Icons.check_circle,
              "Late submissions may receive reduced marks.",
            ),

            guideline(
              Icons.check_circle,
              "Verify your file before submitting.",
            ),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  padding: const EdgeInsets.symmetric(
                    vertical: 15,
                  ),
                ),

                onPressed: () {
                  Navigator.pop(context);
                },

                child: const Text(
                  "Back",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }

  Widget guideline(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),

      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [

          Icon(
            icon,
            color: Colors.green,
          ),

          const SizedBox(width: 10),

          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 16),
            ),
          ),

        ],
      ),
    );
  }
}class FlutterDocsPage extends StatefulWidget {
  const FlutterDocsPage({super.key});

  @override
  State<FlutterDocsPage> createState() =>
      _FlutterDocsPageState();
}

class _FlutterDocsPageState
    extends State<FlutterDocsPage> {

  late final WebViewController controller;

  @override
  void initState() {
    super.initState();

    controller = WebViewController()

      ..setJavaScriptMode(JavaScriptMode.unrestricted)

      ..loadRequest(
        Uri.parse("https://flutter.dev/docs"),
      );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(

        backgroundColor: Colors.deepPurple,

        title: const Text(
          "Flutter Documentation",
          style: TextStyle(color: Colors.white),
        ),

      ),

      body: WebViewWidget(
        controller: controller,
      ),

    );

  }

}
class TooltipPage extends StatelessWidget {
  const TooltipPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text(
          "Tooltip Demo",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            const Text(
              "Long press the icons below",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 40),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                Tooltip(
                  message: "Upload Assignment",
                  child: Icon(
                    Icons.upload_file,
                    color: Colors.deepPurple,
                    size: 50,
                  ),
                ),

                Tooltip(
                  message: "View Guidelines",
                  child: Icon(
                    Icons.description,
                    color: Colors.orange,
                    size: 50,
                  ),
                ),

                Tooltip(
                  message: "Flutter Documentation",
                  child: Icon(
                    Icons.language,
                    color: Colors.green,
                    size: 50,
                  ),
                ),

                Tooltip(
                  message: "Student Profile",
                  child: Icon(
                    Icons.person,
                    color: Colors.red,
                    size: 50,
                  ),
                ),

              ],
            ),

            const SizedBox(height: 50),

            const Text(
              "Long press any icon to view its tooltip.",
              textAlign: TextAlign.center,
            ),

          ],
        ),
      ),
    );
  }
}