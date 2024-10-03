import 'package:flutter/material.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(
            icon: Icon(Icons.arrow_drop_down_circle), label: 'Goals'),
        BottomNavigationBarItem(
            icon: Icon(Icons.recycling_rounded), label: 'Recurring'),
        // BottomNavigationBarItem(icon: Icon(Icons.home), label: 'More')
      ],
      currentIndex: _selectedIndex,
      onTap: (value) => _onItemTapped(value),
    );
  }
}
