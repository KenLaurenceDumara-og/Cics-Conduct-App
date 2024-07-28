import 'package:flutter/material.dart';
import 'package:my_profile/screens/login_page.dart';

void main() {
  runApp(const MyProfileApp());
}

class MyProfileApp extends StatelessWidget {
  const MyProfileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color.fromARGB(255, 3, 6, 167), // Customize primary color
        appBarTheme: const AppBarTheme(
          color: Color.fromRGBO(5, 35, 207, 1), // Customize app bar color
        ),
        tabBarTheme: const TabBarTheme(
          labelColor: Colors.white, // Selected tab label color
          unselectedLabelColor: Colors.white, // Unselected tab label color
          indicator: BoxDecoration(
            // Tab indicator decoration
            color: Color.fromARGB(209, 9, 6, 224), // Indicator color
          ),
        ),
      ),
      home: const LoginPage(),
    );
  }
}
