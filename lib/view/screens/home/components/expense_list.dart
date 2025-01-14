import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:splendlens_fe/core/utilities/utilities.dart';
import 'package:splendlens_fe/viewmodel/viewmodel.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final expenses = context.watch<HomeViewModel>().expenses;

    return Container(
      color: AppTheme().lightGrey,
      child: Padding(
        padding: EdgeInsets.only(
          left: getProportionateScreenWidth(12),
          right: getProportionateScreenWidth(12),
          top: getProportionateScreenWidth(24),
        ),
        child: ListView.builder(
          itemCount: expenses.length,
          itemBuilder: (context, index) => Card(
            color: AppTheme().white,
            elevation: 0,
            child: ListTile(
              leading: const Icon(Icons.sell_rounded),
              title: Text('${expenses[index].name}'),
              subtitle: Text('${expenses[index].description}'),
              trailing: Text('${expenses[index].amount}'),
            ),
          ),
        ),
      ),
    );
  }
}
