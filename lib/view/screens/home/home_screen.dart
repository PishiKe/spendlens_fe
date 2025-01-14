import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:splendlens_fe/core/models/models.dart';
import 'package:splendlens_fe/view/view.dart';
import 'package:splendlens_fe/core/utilities/utilities.dart';
import 'package:splendlens_fe/viewmodel/viewmodel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeViewModel _homeViewModel = HomeViewModel();
  final amountController = TextEditingController();
  final descriptionController = TextEditingController();
  final expenseNameController = TextEditingController();
  DateTime expenseDate = DateTime.now();
  final _formKey = GlobalKey<FormState>();

  void handleAddExpense() async {
    final Map<String, dynamic> body = {
      "amount": int.parse(amountController.text),
      "date": expenseDate.toString(),
      "description": descriptionController.text,
      "name": expenseNameController.text,
      "user": 1
    };

    await _homeViewModel.addExpense(body);
  }

  @override
  void initState() {
    _homeViewModel = context.read<HomeViewModel>();
    _homeViewModel.getUser(context);
    _homeViewModel.getExpenses();
    super.initState();
  }

  @override
  void dispose() {
    amountController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(builder: (context, homeViewModel, child) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: AppTheme().darkBlue,
          centerTitle: false,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                homeViewModel.username ?? '',
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
          onPressed: () {
            DateTime now = DateTime.now();
            DateTime date = DateTime(now.year, now.month, now.day);
            showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return SizedBox.expand(
                    child: bottomSheet(date),
                  );
                });
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      );
    });
  }

  Padding bottomSheet(DateTime date) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Add new expense',
              style: AppTheme().blackBoldNormalStyle.copyWith(fontSize: 16),
            ),
          ),
          Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    keyboardType: TextInputType.number,
                    controller: amountController,
                    decoration: const InputDecoration(label: Text('Amount')),
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  TextFormField(
                    controller: expenseNameController,
                    decoration:
                        const InputDecoration(label: Text('Expense name')),
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  TextFormField(
                    controller: descriptionController,
                    decoration:
                        const InputDecoration(label: Text('Description')),
                  ),
                  // InputDatePickerFormField(firstDate: date, lastDate: date),
                  // SizedBox(
                  //   height: 250,
                  //   child: CupertinoDatePicker(
                  //     backgroundColor: Colors.white,
                  //     initialDateTime: date,
                  //     onDateTimeChanged: (DateTime newDate) {
                  //       setState(() {
                  //         date = newDate;
                  //       });
                  //     },
                  //   ),
                  // ),
                  CustomButton(onPressed: handleAddExpense, text: 'Add')
                ],
              ))
        ],
      ),
    );
  }
}
