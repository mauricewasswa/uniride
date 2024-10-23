import 'package:flutter/material.dart';

import 'order.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('UniRide',textAlign: TextAlign.center,style: TextStyle(
          color: Colors.blue,
          fontWeight: FontWeight.bold,
          fontSize: 30
        ),),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.blue,
              ),
              accountName: const Text(
                'John Doe', // Replace with actual username
                style: TextStyle(fontSize: 18),
              ),
              accountEmail: const Text('johndoe@example.com'), // Replace with actual email
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                backgroundImage: NetworkImage(
                    'https://via.placeholder.com/150'), // Replace with actual image URL or asset
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                // Handle the tap
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.directions_car),
              title: const Text('My Rides'),
              onTap: () {
                // Handle the tap
              },
            ),
            ListTile(
              leading: const Icon(Icons.history),
              title: const Text('Ride History'),
              onTap: () {
                // Handle the tap
              },
            ),
            ListTile(
              leading: const Icon(Icons.notifications),
              title: const Text('Notifications'),
              onTap: () {
                // Handle the tap
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                // Handle the tap
              },
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profile'),
              onTap: () {
                // Handle the tap
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('Help'),
              onTap: () {
                // Handle the tap
              },
            ),
            ListTile(
              leading: const Icon(Icons.contact_mail),
              title: const Text('Contact Us'),
              onTap: () {
                // Handle the tap
              },
            ),
            const Spacer(), // Pushes the logout button to the bottom
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                // Handle the logout
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OrderRidePage(), // Replace with your actual widget
                  ),
                );
              },
              child: const Text('Order a Ride'),
            ),
            const SizedBox(height: 20), // Space between buttons
            ElevatedButton(
              onPressed: () {
                // Handle button 2 press
              },
              child: const Text('Order for 2'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Handle add button press
        },
        child: const Icon(Icons.warning_outlined, color: Colors.red,),
      ),
    );
  }
}
