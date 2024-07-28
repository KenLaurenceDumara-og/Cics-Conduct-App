import 'package:flutter/material.dart';

class CustomTab extends StatelessWidget {
  final IconData icon;
  final String text;

  const CustomTab({Key? key, required this.icon, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tab(
      icon: Icon(icon),
      text: text,
    );
  }
}

