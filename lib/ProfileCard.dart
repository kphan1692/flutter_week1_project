import 'package:flutter/material.dart';

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
            const FollowButton(),
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
    return ElevatedButton.icon(
      onPressed: _toggleFollowStatus,
      icon: Icon(
        isFollowing ? Icons.check_circle_outline : Icons.person_add_alt_1,
        color: Colors.white,
      ),
      label: Text(
        isFollowing ? 'Following' : 'Follow',
        style: const TextStyle(color: Colors.white),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: isFollowing ? Colors.grey : Colors.teal,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        minimumSize: const Size(120, 40),
      ),
    );
  }
}
