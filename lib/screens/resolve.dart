import 'package:flutter/material.dart';

void main() {
  runApp(const ResolveScreen());
}

class ResolveScreen extends StatelessWidget {
  const ResolveScreen({super.key});

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
  String selectedFilter = 'All';

  List<Map<String, String>> violations = [
    {
      'srn': '21-34567',
      'name': 'Juan Delacruz',
      'section': 'BA-2108',
      'violation': 'Cheating',
      'status': 'Solved'
    },
    {
      'srn': '21-34567',
      'name': 'Juan Delacruz',
      'section': 'BA-2108',
      'violation': 'Wear Earrings',
      'status': 'Solved'
    },
  ];

  List<Map<String, String>> get filteredViolations {
    if (selectedFilter == 'All') {
      return violations;
    }
    return violations
        .where((violation) => violation['violation'] == selectedFilter)
        .toList();
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 150,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: DropdownButton<String>(
                    isExpanded: true,
                    underline: const SizedBox(),
                    value: selectedFilter,
                    items: <String>['All', 'Cheating', 'Wear Earrings']
                        .map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        selectedFilter = newValue!;
                      });
                    },
                  ),
                ),
                Container(
                  width: 150,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: DropdownButton<String>(
                    isExpanded: true,
                    underline: const SizedBox(),
                    value: selectedDate,
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
                    onChanged: (newValue) {
                      setState(() {
                        selectedDate = newValue!;
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
                    'Resolve issues:',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    color: Colors.blue[800],
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(
                              child: Text('SRN',
                                  style: TextStyle(color: Colors.white))),
                          Expanded(
                              child: Text('Name',
                                  style: TextStyle(color: Colors.white))),
                          Expanded(
                              child: Text('Section',
                                  style: TextStyle(color: Colors.white))),
                          Expanded(
                              child: Text('Violations',
                                  style: TextStyle(color: Colors.white))),
                          Expanded(
                              child: Text('Status',
                                  style: TextStyle(color: Colors.white))),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  ...filteredViolations.map((violation) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: ViolationRow(
                          srn: violation['srn']!,
                          name: violation['name']!,
                          section: violation['section']!,
                          violation: violation['violation']!,
                          status: violation['status']!,
                        ),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ViolationRow extends StatelessWidget {
  final String srn;
  final String name;
  final String section;
  final String violation;
  final String status;

  const ViolationRow({super.key, 
    required this.srn,
    required this.name,
    required this.section,
    required this.violation,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      decoration: BoxDecoration(
        color: Colors.blue[500],
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        children: [
          Expanded(child: Text(srn, style: const TextStyle(color: Colors.white))),
          Expanded(child: Text(name, style: const TextStyle(color: Colors.white))),
          Expanded(child: Text(section, style: const TextStyle(color: Colors.white))),
          Expanded(
              child: Text(violation, style: const TextStyle(color: Colors.white))),
          Expanded(child: Text(status, style: const TextStyle(color: Colors.white))),
        ],
      ),
    );
  }
}
