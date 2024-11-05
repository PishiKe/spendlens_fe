import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:splendlens_fe/view/view.dart';
import 'package:splendlens_fe/utilities/utilities.dart';
import 'package:splendlens_fe/viewmodel/viewmodel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  AuthenticationViewModel? _authenticationViewModel;
  String? key;

  Column title() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          key ?? '',
          // 'Hello _authenticationViewModel?.key}',
          style: AppTheme().whiteBoldHeadlineStyle,
        ),
        Text(
          'Good morning',
          style: AppTheme().whiteSubheadlineStyle,
        )
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    _authenticationViewModel = context.read<AuthenticationViewModel>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme().darkBlue,
        centerTitle: false,
        title: title(),
        // title: Text(
        //   'Hello ${_homeViewModel?.firstName}',
        //   style: AppTheme().whiteBoldHeadlineStyle,
        // ),
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
        onPressed: () {
          DateTime now = DateTime.now();
          DateTime date = DateTime(now.year, now.month, now.day);
          showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return SizedBox.expand(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        const Text('Add new expense'),
                        const Text('Choose Category'),
                        Form(
                            child: Column(
                          children: [
                            TextFormField(
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                  label: Text('TOTAL AMOUNT'),
                                  border: InputBorder.none),
                            ),
                            InputDatePickerFormField(
                                firstDate: date, lastDate: date),
                            CustomButton(onPressed: () {}, text: 'Add')
                          ],
                        ))
                      ],
                    ),
                  ),
                );
              });
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
