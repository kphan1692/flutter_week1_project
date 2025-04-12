import 'package:flutter/material.dart';
import 'ProfileCard.dart'; // Importing the ProfileCard widget from another file.

// The main entry point of the Flutter application.
void main() {
  // runApp() inflates the given widget and attaches it to the screen.
  // We use 'const' here because MainApp has a const constructor and no changing state.
  runApp(const MainApp());
}

// MainApp is the root widget of the application.
// It's a StatelessWidget because its properties don't change over time.
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('My Profile Card'),
          backgroundColor: Colors.teal,
          foregroundColor: Colors.white,
        ),
        body: const Center(child: ProfileCard()),
      ),
    );
  }
}
