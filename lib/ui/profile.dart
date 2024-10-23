import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Profile Picture
              Center(
                child: CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.grey[300],
                  backgroundImage: NetworkImage(
                      'https://via.placeholder.com/150'), // Replace with actual image URL or asset
                ),
              ),
              const SizedBox(height: 20),

              // Username
              const Text(
                'John Doe', // Replace with actual username
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),

              // Email
              const Text(
                'johndoe@example.com', // Replace with actual email
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 40),

              // Edit Profile Button
              // ElevatedButton.icon(
              //   onPressed: () {
              //     // Handle edit profile action
              //   },
              //   icon: const Icon(Icons.edit),
              //   label: const Text('Edit Profile'),
              //   style: ElevatedButton.styleFrom(
              //     minimumSize: const Size.fromHeight(50),
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(8),
              //     ),
              //   ),
              // ),
              // const SizedBox(height: 20),

              // Account Settings Button
              ElevatedButton.icon(
                onPressed: () {
                  // Handle account settings action
                },
                icon: const Icon(Icons.settings),
                label: const Text('Account Settings'),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Logout Button
              OutlinedButton.icon(
                onPressed: () {
                  // Handle logout action
                },
                icon: const Icon(Icons.logout),
                label: const Text('Logout'),
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                  side: BorderSide(color: Theme.of(context).primaryColor),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
