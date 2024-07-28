import 'package:flutter/material.dart';

void main() {
  runApp(const NotificationScreen());
}

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CICS Student Conduct',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const StudentConductPage(),
    );
  }
}

class StudentConductPage extends StatefulWidget {
  const StudentConductPage({super.key});

  @override
  _StudentConductPageState createState() => _StudentConductPageState();
}

class _StudentConductPageState extends State<StudentConductPage> {
  String selectedDate = 'August 1, 2024';

  List<Map<String, dynamic>> violations = [
    {
      'author': 'WEAR EARRINGS',
      'professor': 'August 30, 2024',
    },
    {
      'author': 'CHEATING',
      'professor': 'August 1, 2024',
    },
    {
      'author': 'WEAR EARRINGS',
      'professor': 'September 1, 2024',
    },
    {
      'author': 'MISBEHAVIOR',
      'professor': 'August 1, 2024',
    },
  ];

  List<Map<String, dynamic>> get filteredViolations {
    return violations.where((violation) {
      return violation['professor'] == selectedDate;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[100],
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leadingWidth: 40,
        title: const Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/images/logo.jpg'),
              radius: 20, // Increase the radius to make the image bigger
            ),
            SizedBox(width: 10), // Adjust spacing as needed
            Text('CICS Student Conduct'),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 16.0, vertical: 24.0), // Increased vertical padding
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.admin_panel_settings,
                    color: Colors.blue[700], size: 40), // Increase the size
                const SizedBox(width: 10),
                Text('ADMIN',
                    style: TextStyle(
                        color: Colors.blue[700],
                        fontWeight: FontWeight.bold,
                        fontSize: 20)), // Increase font size
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: 200, // Adjust the width as needed
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: DropdownButton<String>(
                    isExpanded: true,
                    underline: const SizedBox(),
                    value: selectedDate,
                    hint: const Text('SELECT DATE:'),
                    items: <String>[
                      'August 1, 2024',
                      'September 1, 2024',
                      'December 1, 2024'
                    ].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedDate = value!;
                      });
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20), // Increased vertical spacing
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.blue[700],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  ...filteredViolations.map((violation) {
                    return ViolationItem(
                      author: violation['author'],
                      professor: violation['professor'],
                      viewmessages: 'view',
                      onViewButtonPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ViolationDetailPage(
                              author: violation['author'],
                              professor: violation['professor'],
                            ),
                          ),
                        );
                      },
                    );
                  }).toList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ViolationItem extends StatelessWidget {
  final String author;
  final String professor;
  final String viewmessages;
  final VoidCallback onViewButtonPressed;

  const ViolationItem({super.key, 
    required this.author,
    required this.professor,
    required this.viewmessages,
    required this.onViewButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              '$author    DATE: $professor',
              style: TextStyle(color: Colors.blue[700]),
            ),
          ),
          InkWell(
            onTap: onViewButtonPressed,
            child: Text(
              viewmessages,
              style: const TextStyle(
                color: Colors.black,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ViolationDetailPage extends StatelessWidget {
  final String author;
  final String professor;

  const ViolationDetailPage({super.key, 
    required this.author,
    required this.professor,
  });

  @override
  Widget build(BuildContext context) {
    String reportMessage;
    switch (author) {
      case 'WEAR EARRINGS':
        reportMessage =
            'The student was found wearing earrings, which is against the dress code policy.';
        break;
      case 'CHEATING':
        reportMessage =
            'The student was caught cheating on an exam or assignment.';
        break;
      case 'MISBEHAVIOR':
        reportMessage =
            'The student exhibited inappropriate behavior in class.';
        break;
      default:
        reportMessage = 'No details available.';
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Violation Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Violation Report',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue[700],
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Violation Type: $author',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            Text(
              'Date: $professor',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            Text(
              reportMessage,
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
