import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 220, 121, 240), 
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            Row(
              children: [
                CircleAvatar(
                  radius: 30, 
                  backgroundImage: AssetImage('assets/profile_placeholder.png'), 
                ),
                const SizedBox(width: 16),
                const Text(
                  'User', 
                  style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold), 
                ),
              ],
            ),
            const SizedBox(height: 20), 

            // Feature List
            Expanded(
              child: ListView(
                children: [
                  _buildFeatureTile(Icons.check_circle, 'Habit Preferences'),
                  const SizedBox(height: 10), 
                  _buildFeatureTile(Icons.star, 'Achievements and Badges'),
                  const SizedBox(height: 10), 
                  _buildFeatureTile(Icons.settings, 'Account Settings'),
                  const SizedBox(height: 10), 
                  _buildFeatureTile(Icons.feedback, 'Feedback and Support'),
                  const SizedBox(height: 10), 
                  _buildFeatureTile(Icons.logout, 'Log Out'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureTile(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, size: 25), 
      title: Text(title, style: const TextStyle(fontSize: 16)), 
      onTap: () {
        
      },
    );
  }
}
