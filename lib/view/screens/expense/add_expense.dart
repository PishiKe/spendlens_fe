import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:splendlens_fe/viewmodel/viewmodel.dart';
import 'package:splendlens_fe/core/utilities/utilities.dart';
import 'package:splendlens_fe/view/global/widgets/widgets.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class ExpenseForm extends StatefulWidget {
  const ExpenseForm({super.key});

  @override
  State<ExpenseForm> createState() => _ExpenseFormState();
}

class _ExpenseFormState extends State<ExpenseForm> {
  HomeViewModel _homeViewModel = HomeViewModel();
  final amountController = TextEditingController();
  final descriptionController = TextEditingController();
  final expenseNameController = TextEditingController();
  final expenseDateController = TextEditingController();
  DateTime? expenseDate = DateTime.now();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  void handleAddExpense() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() => loading = true);
    final Map<String, dynamic> formData = {
      "amount": int.parse(amountController.text),
      "date": expenseDate.toString(),
      "description": descriptionController.text,
      "name": expenseNameController.text,
      "user": _homeViewModel.user?.id
    };

    _homeViewModel.addExpense(formData).then((value) {
      debugPrint(value.description);
      if (mounted) context.pop();
      setState(() => loading = false);
    });
  }

  Future<void> _selectExpenseDate() async {
    final DateTime? picked = await showDatePicker(
        context: context,
        firstDate: DateTime.now().subtract(const Duration(days: 365)),
        lastDate: DateTime.now().add(const Duration(days: 365)));

    if (picked != null && picked != expenseDate) {
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
  }

  @override
  void dispose() {
    amountController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add new expense',
          style: AppTheme().blackBoldNormalStyle.copyWith(fontSize: 20.0),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
          child: Column(
            children: [
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        keyboardType: TextInputType.number,
                        controller: amountController,
                        decoration:
                            const InputDecoration(label: Text('Amount')),
                        validator: (value) =>
                            Validators.notEmpty(value, 'amount'),
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
                                label: const Text('Date'),
                                suffixIcon: Icon(
                                  Icons.calendar_month,
                                  color: AppTheme().black,
                                ),
                              ),
                              validator: (value) =>
                                  Validators.notEmpty(value, 'Expense Date'),
                              onTap: _selectExpenseDate,
                            ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      SizedBox(
                          width: double.infinity,
                          height: 50.0,
                          child: loading
                              ? SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: LoadingAnimationWidget.inkDrop(
                                      color: AppTheme().lightBlue, size: 20))
                              : CustomButton(
                                  onPressed: handleAddExpense, text: 'Add'))
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
