// Importing important packages require to connect
// Flutter and Dart
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage(String s, {Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      // Sets the content to the
      // center of the application page
      body: const Center(
          // Sets the content of the Application
          child: Text(
        'Welcome to GeeksForGeeks!',
      )),
    );
  }
}
