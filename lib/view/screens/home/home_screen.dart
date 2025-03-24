import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:splendlens_fe/view/view.dart';
import 'package:splendlens_fe/viewmodel/viewmodel.dart';
import 'package:splendlens_fe/core/utilities/utilities.dart';
import 'dart:io' show Platform;

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
  final expenseDateController = TextEditingController();
  DateTime? expenseDate = DateTime.now();
  final _formKey = GlobalKey<FormState>();

  void handleAddExpense() {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    final Map<String, dynamic> formData = {
      "amount": int.parse(amountController.text),
      "date": expenseDate.toString(),
      "description": descriptionController.text,
      "name": expenseNameController.text,
      "user": _homeViewModel.user?.id
    };

    _homeViewModel.addExpense(formData).then((value) {
      if (mounted) context.pop();
    });
  }

  Future<void> _selectExpenseDate() async{
    final DateTime? picked = await showDatePicker(
      context: context,
      firstDate: DateTime.now().subtract(const Duration(days: 365)),
      lastDate: DateTime.now().add( const Duration(days: 365)
    ));

    if (picked != null && picked != expenseDate){
      setState(() {
        expenseDate = picked;
        expenseDateController.text = '${picked.toLocal()}';
      });
    }
  }

  @override
  void initState() {
    _homeViewModel = context.read<HomeViewModel>();
    _homeViewModel.getUser(context);
    super.initState();

    _homeViewModel.getExpenses();
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
            showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return SizedBox.expand(
                    child: bottomSheet(),
                  );
                });
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      );
    });
  }

  Padding bottomSheet() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Add new expense',
              style: AppTheme().blackBoldNormalStyle.copyWith(fontSize: 20.0),
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
                    validator: (value) => Validators.notEmpty(value, 'amount'),
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  TextFormField(
                    controller: expenseNameController,
                    decoration:
                        const InputDecoration(label: Text('Expense name')),
                    validator: (value) =>
                        Validators.notEmpty(value, 'an expense name'),
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  TextFormField(
                    controller: descriptionController,
                    decoration:
                        const InputDecoration(label: Text('Description')),
                  ),
                  const SizedBox(
                    height: 24.0,
                  ),
                  Platform.isIOS
                      ? SizedBox(
                          height: 100,
                          child: CupertinoDatePicker(
                            initialDateTime: expenseDate,
                            onDateTimeChanged: (DateTime newDate) {
                              setState(() {
                                expenseDate = newDate;
                              });
                            },
                          ),
                        )
                      : TextFormField(
                          controller: expenseDateController,
                          decoration: InputDecoration(
                            label:const Text('Date'),
                            suffixIcon: Icon(
                              Icons.calendar_month,
                              color: AppTheme().black,
                            ),
                          ),
                        onTap: _selectExpenseDate,
                      ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  SizedBox(
                      width: double.infinity,
                      height: 50.0,
                      child: CustomButton(
                          onPressed: handleAddExpense, text: 'Add'))
                ],
              ))
        ],
      ),
    );
  }
}
