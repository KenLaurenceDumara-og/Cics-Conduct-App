import 'package:flutter/material.dart';

void main() {
  runApp(const ViolationsScreen());
}

class ViolationsScreen extends StatelessWidget {
  const ViolationsScreen({super.key});

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
      'srn': '21-34567',
      'name': 'Juan Delacruz',
      'section': 'BA-2108',
      'violation': 'Cheating',
      'status': 'Solved',
      'date': 'August 1, 2024',
      'checked': false,
    },
    {
      'srn': '21-34567',
      'name': 'Juan Delacruz',
      'section': 'BA-2108',
      'violation': 'Wear Earrings',
      'status': 'Solved',
      'date': 'September 1, 2024',
      'checked': true,
    },
    // New row of data
    {
      'srn': '21-67890',
      'name': 'Maria Lopez',
      'section': 'BA-2108',
      'violation': 'Misbehavior',
      'status': 'Pending',
      'date': 'August 1, 2024',
      'checked': false,
    },
  ];

  List<Map<String, dynamic>> get filteredViolations {
    return violations.where((violation) {
      return violation['date'] == selectedDate;
    }).toList();
  }

  void _toggleCheckbox(bool? value, int index) {
    setState(() {
      filteredViolations[index]['checked'] = value ?? false;
    });
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
              radius: 20,
            ),
            SizedBox(width: 10),
            Text('CICS Student Conduct'),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.admin_panel_settings,
                    color: Colors.blue[700], size: 40),
                const SizedBox(width: 10),
                Text('ADMIN',
                    style: TextStyle(
                        color: Colors.blue[700],
                        fontWeight: FontWeight.bold,
                        fontSize: 20)),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: 200,
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
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.blue[700],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'List of students with violations:',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  ...filteredViolations.map((violation) {
                    int index = filteredViolations.indexOf(violation);
                    return ViolationItem(
                      violation: violation['violation'],
                      date: violation['date'],
                      checked: violation['checked'],
                      onChanged: (value) => _toggleCheckbox(value, index),
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
  final String violation;
  final String date;
  final bool checked;
  final ValueChanged<bool?> onChanged;

  const ViolationItem({super.key, 
    required this.violation,
    required this.date,
    required this.checked,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 13),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              '$violation    DATE: $date',
              style: TextStyle(color: Colors.blue[700]),
            ),
          ),
          Checkbox(
            value: checked,
            onChanged: onChanged,
            activeColor: Colors.blue,
          ),
        ],
      ),
    );
  }
}
