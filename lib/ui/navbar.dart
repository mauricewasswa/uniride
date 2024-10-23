import 'package:flutter/material.dart';
import 'package:uniride/ui/settings.dart';


import 'history.dart';
import 'home.dart';

class Material3BottomNav extends StatefulWidget {
  const Material3BottomNav({Key? key}) : super(key: key);

  @override
  State<Material3BottomNav> createState() => _Material3BottomNavState();
}

class _Material3BottomNavState extends State<Material3BottomNav> {
  int _selectedIndex = 0;

  // List of pages to show for each bottom navigation item
  static final List<Widget> _pages = <Widget>[
    const HomePage(),
    const HistoryPage(),
    const SettingsPage2(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],  // Show the selected page
      bottomNavigationBar: NavigationBar(
        animationDuration: const Duration(seconds: 1),
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        destinations: _navBarItems,
      ),
    );
  }
}

const _navBarItems = [
  NavigationDestination(
    icon: Icon(Icons.home_outlined),
    selectedIcon: Icon(Icons.home_rounded),
    label: 'Home',
  ),
  NavigationDestination(
    icon: Icon(Icons.bookmark_border_outlined),
    selectedIcon: Icon(Icons.bookmark_rounded),
    label: 'History',
  ),
  NavigationDestination(
    icon: Icon(Icons.settings),
    selectedIcon: Icon(Icons.settings),
    label: 'Settings',
  ),
];

// Dummy Home Page


// Dummy History Page


// Dummy Profile Page

