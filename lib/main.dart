import 'package:flutter/material.dart';

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

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(20),
      elevation: 4.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundColor: Colors.tealAccent,
              child: Icon(Icons.person_2_rounded, size: 50, color: Colors.teal),
              //using `backgroundImage: AssetImage(...)` later.
            ),
            SizedBox(height: 10),
            const Text(
              'Nguyen Phan',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
            SizedBox(height: 10),
            const Text(
              'Product Owner | Mobile App Developer',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 10),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.mark_email_read_outlined,
                  size: 30,
                  color: Colors.teal,
                ),
                SizedBox(width: 20),
                Icon(Icons.call, color: Colors.teal),
                SizedBox(width: 20),
                Icon(Icons.add_home_work_sharp, color: Colors.teal),
              ],
            ),
            SizedBox(height: 10),
            const Text(
              'Contact me:',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  } // build function
} // class ProfileCard

class FollowButton extends StatefulWidget {
  const FollowButton({super.key});

  @override
  State<FollowButton> createState() => _FollowButtonState();
}

class _FollowButtonState extends State<FollowButton> {
  // State variable and build method needed here
  bool isFollowing = false;

  // Function to toggle the follow state
  void _toggleFollowStatus() {
    setState(() {
      isFollowing = !isFollowing; // Toggle the state
    });
  }

  @override
  Widget build(BuildContext context) {
    // Return the button widget based on state
    return Container();
  }
}
