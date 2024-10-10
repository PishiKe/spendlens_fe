import 'package:flutter/material.dart';
import 'package:splendlens_fe/ui/global/global.dart';
import 'package:splendlens_fe/ui/screens/home/home.dart';
import 'package:splendlens_fe/utilities/utilities.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme().darkBlue,
        centerTitle: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hi Oz,',
              style: AppTheme().whiteBoldHeadlineStyle,
            ),
            Text(
              'Good morning',
              style: AppTheme().whiteSubheadlineStyle,
            )
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: CustomIconButton(
              onTap: () {},
              icon: AppConstants().notificationIcon,
              width: 50,
              height: 50,
            ),
          )
        ],
      ),
      body: const HomeScreenBody(),
      bottomNavigationBar: const BottomNavbar(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppTheme().lightBlue,
        shape: const CircleBorder(),
        elevation: 0,
        child: Icon(
          Icons.add,
          color: AppTheme().white,
        ),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
