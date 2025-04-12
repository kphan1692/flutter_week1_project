import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// --- App Entry Point ---
void main() {
  runApp(const MyApp());
}

// --- Main Application Widget ---
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile Card',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // Background color for the area outside the card
        backgroundColor: Colors.blueGrey[50], // A slightly different background
        appBar: AppBar(
          title: const Text('Profile Card Example'),
          backgroundColor: kDarkGrey, // Use defined constant
          elevation: 0, // Remove app bar shadow
        ),
        body: const Center(
          // Center the card on the screen
          child: ProfileCard(),
        ),
      ),
    );
  }
}

// --- Constants ---
const Color kDarkGrey = Color(0xFF4A4A4A);
const Color kTeal = Color(0xFF4ECDC4);
const Color kLightGreyText = Color(0xFF6E6E6E); // For values
const Color kWhite = Colors.white;

// --- Profile Card Widget ---
class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // Optional: Add constraints or specific width
      constraints: const BoxConstraints(
        maxWidth: 350,
      ), // Max width for the card
      margin: const EdgeInsets.all(20.0), // Margin around the card
      decoration: BoxDecoration(
        color: kWhite, // Base background color for the card container
        borderRadius: BorderRadius.circular(
          10.0,
        ), // Rounded corners for the card
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 8.0,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      // Clip prevents children (like the overlapping avatar) from drawing outside bounds
      clipBehavior: Clip.antiAlias,
      child: Column(
        mainAxisSize: MainAxisSize.min, // Make column height fit content
        crossAxisAlignment:
            CrossAxisAlignment.stretch, // Stretch children horizontally
        children: [
          _buildTopBar(),
          _buildImageAndTealBar(), // Combines teal bar and image handling
          _buildInfoSection(),
          _buildBottomBar(),
        ],
      ),
    );
  }

  // --- Top Bar Section ---
  Widget _buildTopBar() {
    return Container(
      color: kDarkGrey,
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: const Text(
        'NextWave Monitoring',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: kWhite,
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.2,
        ),
      ),
    );
  }

  // --- Teal Bar and Overlapping Avatar Section ---
  Widget _buildImageAndTealBar() {
    const double avatarRadius = 55.0; // Slightly smaller radius
    const double overlap = 30.0; // How much the avatar overlaps the white area

    return Stack(
      alignment: Alignment.bottomCenter,
      clipBehavior:
          Clip.none, // Allow avatar to overflow outside the Stack bounds
      children: [
        // Teal Bar - Sized to allow space for the overlapping avatar
        Container(
          height:
              avatarRadius +
              overlap, // Height = radius + desired space below avatar center
          color: kTeal,
        ),
        // Positioned Avatar with White Border
        Positioned(
          // Positioned adjusts the child relative to the Stack.
          // Since alignment is bottomCenter, it aligns the center of the child
          // with the bottom-center of the Stack. We let the InfoSection's padding
          // handle the spacing below the avatar.
          child: CircleAvatar(
            radius: avatarRadius + 4, // Avatar radius + border thickness
            backgroundColor: kWhite, // Border color
            child: const CircleAvatar(
              radius: avatarRadius,
              // *** IMPORTANT: Replace with your actual image path ***
              backgroundImage: AssetImage('assets/profile.jpg'),
              backgroundColor: kLightGreyText, // Fallback color if image fails
            ),
          ),
        ),
      ],
    );
  }

  // --- Main Information Section ---
  Widget _buildInfoSection() {
    // Constants defined within _buildImageAndTealBar need to be accessible or redefined
    const double avatarRadius = 55.0;
    const double overlap = 30.0;

    return Container(
      color: kWhite,
      padding: EdgeInsets.fromLTRB(
        25.0, // Left padding
        avatarRadius +
            overlap +
            15.0, // Top padding = space needed for avatar + extra gap
        25.0, // Right padding
        20.0, // Bottom padding
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min, // Fit content vertically
        children: [
          const Text(
            'Laura Anderson',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: kDarkGrey,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4.0),
          const Text(
            'Web Design & Developer',
            style: TextStyle(
              fontSize: 14.0,
              color: kTeal,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 25.0), // Space before info rows
          // --- Info Rows ---
          _buildInfoRow('ID', '9876543210'),
          _buildInfoRow('DOB', '00-00-00'),
          _buildInfoRow('Phone', '(211) 531 4262'),
          _buildInfoRow('E-mail', 'Your mail goes here'),
          _buildInfoRow('Join', '12-09-2018'),
          _buildInfoRow('Expire', '13-09-2023'),

          const SizedBox(
            height: 10.0,
          ), // Optional space at the end of the info section
        ],
      ),
    );
  }

  // --- Helper Widget for Information Rows ---
  Widget _buildInfoRow(String label, String value) {
    const labelStyle = TextStyle(
      color: kTeal,
      fontSize: 14.0,
      fontWeight: FontWeight.w600,
    );
    const valueStyle = TextStyle(color: kLightGreyText, fontSize: 14.0);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        children: [
          // Label Column
          SizedBox(
            width: 70, // Fixed width for labels to ensure alignment
            child: Text(label, style: labelStyle, textAlign: TextAlign.left),
          ),
          const SizedBox(width: 10),
          // Colon Separator
          const Text(':', style: valueStyle),
          const SizedBox(width: 15),
          // Value Column (Expanded to take remaining space and wrap if needed)
          Expanded(
            child: Text(value, style: valueStyle, textAlign: TextAlign.left),
          ),
        ],
      ),
    );
  }

  // --- Bottom Bar Section ---
  Widget _buildBottomBar() {
    return Container(
      color: kDarkGrey,
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 12.0,
      ), // Adjusted padding
      child: Row(
        children: [
          // Social Icons Group
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildSocialIcon(FontAwesomeIcons.twitter),
              const SizedBox(width: 10),
              _buildSocialIcon(
                FontAwesomeIcons.facebookF,
              ), // Use facebookF for just 'f'
              const SizedBox(width: 10),
              _buildSocialIcon(FontAwesomeIcons.instagram),
            ],
          ),
          const Spacer(), // Pushes the brand name to the far right
          // Brand Name
          const Text(
            '/ brandname',
            style: TextStyle(color: kWhite, fontSize: 14.0),
          ),
        ],
      ),
    );
  }

  // --- Helper Widget for Social Media Icons ---
  Widget _buildSocialIcon(IconData icon) {
    return CircleAvatar(
      radius: 16, // Size of the icon background circle
      backgroundColor: kTeal,
      child: Icon(
        icon,
        size: 16, // Size of the icon itself
        color: kWhite,
      ),
    );
  }
}
