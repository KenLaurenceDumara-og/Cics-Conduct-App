import 'package:flutter/material.dart';
import 'package:my_profile/screens/dashboard.dart';
import 'package:my_profile/screens/notification.dart';
import 'package:my_profile/screens/resolve.dart';
import 'package:my_profile/screens/violations.dart';
import 'package:my_profile/widgets/custom_tab.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String _userRole = 'Admin'; // Default user role

  void _login() {
    if (_formKey.currentState?.validate() ?? false) {
      // After successful login, navigate based on role

      if (_userRole == 'Admin') {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ProfileScreen()),
        );
      } else if (_userRole == 'Professor') {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const StudentConductApp()),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome to CICS Student Conduct'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _usernameController,
                decoration: const InputDecoration(labelText: 'Username'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your username';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              DropdownButtonFormField<String>(
                value: _userRole,
                onChanged: (String? newValue) {
                  setState(() {
                    _userRole = newValue!;
                  });
                },
                items: <String>['Admin', 'Professor']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                decoration: const InputDecoration(labelText: 'Role'),
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: _login,
                child: const Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyProfileApp extends StatelessWidget {
  const MyProfileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color.fromRGBO(3, 5, 107, 1), // Customize primary color
        appBarTheme: const AppBarTheme(
          color: Color.fromRGBO(3, 22, 129, 1), // Customize app bar color
        ),
        tabBarTheme: const TabBarTheme(
          labelColor: Colors.white, // Selected tab label color
          unselectedLabelColor: Colors.white, // Unselected tab label color
          indicator: BoxDecoration(
            // Tab indicator decoration
            color: Color.fromARGB(209, 5, 4, 114), // Indicator color
          ),
        ),
      ),
      home: const LoginPage(),
    );
  }
}

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          DashboardScreen(),
          NotificationScreen(),
          ViolationsScreen(),
          ResolveScreen(),
        ],
      ),
      bottomNavigationBar: Container(
        color: Theme.of(context)
            .primaryColor, // Use primary color for tab bar background
        child: TabBar(
          controller: _tabController,
          tabs: const [
            CustomTab(icon: Icons.home, text: 'Dashboard'),
            CustomTab(icon: Icons.notification_add, text: 'Notifications'),
            CustomTab(icon: Icons.dangerous, text: 'Violations'),
            CustomTab(icon: Icons.check, text: 'Resolved'),
          ],
        ),
      ),
    );
  }
}

class StudentConductApp extends StatelessWidget {
  const StudentConductApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StudentConductForm(),
    );
  }
}

class StudentConductForm extends StatefulWidget {
  const StudentConductForm({super.key});

  @override
  _StudentConductFormState createState() => _StudentConductFormState();
}

class _StudentConductFormState extends State<StudentConductForm> {
  String selectedYear = 'Second';
  String selectedSection = 'BA-2121';
  List<String> names = [
    'Tanagil Dimagiba',
    'Mabtas De Jesus',
    'Leta Chanunt',
    'Roda Chanunt'
  ];
  List<bool> selectedNames = [false, false, false, false];
  String violations = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CICS Student Conduct'),
        backgroundColor: Colors.blue[800],
      ),
      body: Container(
        color: Colors.lightBlue[100],
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'PROFESSOR',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: 'YEAR:',
                filled: true,
                fillColor: Colors.blue[100],
              ),
              value: selectedYear,
              onChanged: (String? newValue) {
                setState(() {
                  selectedYear = newValue!;
                });
              },
              items: <String>['First', 'Second', 'Third', 'Fourth']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: 'SECTION:',
                filled: true,
                fillColor: Colors.blue[100],
              ),
              value: selectedSection,
              onChanged: (String? newValue) {
                setState(() {
                  selectedSection = newValue!;
                });
              },
              items: <String>['BA-2121', 'BA-2122', 'BA-2123']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(height: 16),
            const Text(
              'LIST OF NAMES:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: names.length,
                itemBuilder: (BuildContext context, int index) {
                  return CheckboxListTile(
                    title: Text(names[index]),
                    value: selectedNames[index],
                    onChanged: (bool? value) {
                      setState(() {
                        selectedNames[index] = value!;
                      });
                    },
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'VIOLATIONS:',
                filled: true,
                fillColor: Colors.blue[100],
              ),
              maxLines: 3,
              onChanged: (String value) {
                setState(() {
                  violations = value;
                });
              },
            ),
            const SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Handle form submission
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[800],
                ),
                child: const Text(
                  'SEND',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
