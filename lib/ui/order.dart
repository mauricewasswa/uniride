import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(const MaterialApp(home: OrderRidePage()));
}

class OrderRidePage extends StatefulWidget {
  const OrderRidePage({Key? key}) : super(key: key);

  @override
  _OrderRidePageState createState() => _OrderRidePageState();
}

class _OrderRidePageState extends State<OrderRidePage> {
  // Sample list of pickup locations
  final List<Map<String, String>> _pickupLocations = [
    {'name': 'Home', 'image': 'https://i.ibb.co/cJqsPSB/scooter.png'},
    {'name': 'University', 'image': 'https://i.ibb.co/LvmZypG/storefront-illustration-2.png'},
    {'name': 'Downtown', 'image': 'https://i.ibb.co/420D7VP/building.png'},
  ];

  // Sample list of destinations
  final List<Map<String, String>> _destinations = [
    {'name': 'Airport', 'image': 'https://i.ibb.co/cJqsPSB/scooter.png', 'price': '20.00'},
    {'name': 'City Mall', 'image': 'https://i.ibb.co/LvmZypG/storefront-illustration-2.png', 'price': '15.00'},
    {'name': 'Central Park', 'image': 'https://i.ibb.co/420D7VP/building.png', 'price': '8.00'},
    // Add more destinations as needed
  ];

  // Function to navigate to the destination selection page
  void _selectPickupLocation(Map<String, String> pickupLocation) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DestinationSelectionPage(
          pickupLocation: pickupLocation,
          destinations: _destinations,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order a Ride'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Select Pickup Location',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: _pickupLocations.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: const Icon(Icons.location_on),
                    title: Text(_pickupLocations[index]['name']!),
                    onTap: () => _selectPickupLocation(_pickupLocations[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DestinationSelectionPage extends StatelessWidget {
  final Map<String, String> pickupLocation;
  final List<Map<String, String>> destinations;

  const DestinationSelectionPage({Key? key, required this.pickupLocation, required this.destinations}) : super(key: key);

  // Function to navigate to the details page of the selected destination
  void _selectDestination(BuildContext context, Map<String, String> destination) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DestinationDetailsPage(pickupLocation: pickupLocation, destination: destination),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Destination'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: destinations.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: const Icon(Icons.location_on),
              title: Text(destinations[index]['name']!),
              onTap: () => _selectDestination(context, destinations[index]),
            );
          },
        ),
      ),
    );
  }
}

class DestinationDetailsPage extends StatelessWidget {
  final Map<String, String> pickupLocation;
  final Map<String, String> destination;

  const DestinationDetailsPage({Key? key, required this.pickupLocation, required this.destination}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(destination['name']!), // Title set to the name of the destination
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(destination['image']!),
            const SizedBox(height: 20),
            Text(
              'Pickup Location: ${pickupLocation['name']}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            Text(
              'Price: \$${destination['price']}',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to the loading page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoadingPage()),
                );
              },
              child: const Text('Confirm Ride'),
            ),
          ],
        ),
      ),
    );
  }
}

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Simulate a delay of 5 seconds
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => RideConfirmationPage()),
      );
    });

    return Scaffold(
      appBar: AppBar(title: const Text('Searching for Rides')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            const SizedBox(height: 20),
            const Text(
              'Looking for nearby rides...',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}

class RideConfirmationPage extends StatelessWidget {
  const RideConfirmationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ride Confirmation')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Your ride is on the way!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Confirm that the ride has been received
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Ride confirmed!')),
                );
                Navigator.popUntil(context, (route) => route.isFirst); // Navigate back to the OrderRidePage
              },
              child: const Text('Confirm Ride Received'),
            ),
          ],
        ),
      ),
    );
  }
}
