import 'package:flutter/material.dart';
import 'package:splendlens_fe/ui/ui.dart';
import 'package:splendlens_fe/utilities/utilities.dart';

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
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      color: AppTheme().white,
      notchMargin: 8.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              CustomIconButton(
                  height: 30, icon: 'assets/icons/home.svg', onTap: () {}),
              Text('Home')
            ],
          ),
          Container(
            margin: EdgeInsets.only(right: 16.0),
            child: Column(
              children: [
                CustomIconButton(
                  height: 30,
                  icon: 'assets/icons/goals.svg',
                  onTap: () {},
                ),
                Text('Goals')
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 16.0),
            child: Column(
              children: [
                CustomIconButton(
                    height: 25,
                    icon: 'assets/icons/round_arrow.svg',
                    onTap: () {}),
                Text('Recurring')
              ],
            ),
          ),
          Column(
            children: [
              CustomIconButton(
                  height: 30, icon: 'assets/icons/burger.svg', onTap: () {}),
              Text('More')
            ],
          )
        ],
      ),
    );
  }
}
