import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:splendlens_fe/view/view.dart';
import 'package:splendlens_fe/core/utilities/utilities.dart';

class BottomNavbar extends StatelessWidget {
  const BottomNavbar({super.key});

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
                  height: 20,
                  icon: 'assets/icons/home.svg',
                  onTap: () => context.go('/home')),
              const Text('Home')
            ],
          ),
          Container(
            margin: const EdgeInsets.only(right: 16.0),
            child: Column(
              children: [
                CustomIconButton(
                  height: 20,
                  icon: 'assets/icons/goals.svg',
                  onTap: () => context.go('/goals'),
                ),
                const Text('Goals')
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 16.0),
            child: Column(
              children: [
                CustomIconButton(
                    height: 18,
                    icon: 'assets/icons/round_arrow.svg',
                    onTap: () => context.go('/recurring')),
                const Text('Recurring')
              ],
            ),
          ),
          Column(
            children: [
              CustomIconButton(
                  height: 20,
                  icon: 'assets/icons/burger.svg',
                  onTap: () => context.go('/profile')),
              const Text('More')
            ],
          )
        ],
      ),
    );
  }
}
