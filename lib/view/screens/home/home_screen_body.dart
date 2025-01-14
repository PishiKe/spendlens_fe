import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:splendlens_fe/core/models/models.dart';
import 'package:splendlens_fe/view/screens/home/components/expense_list.dart';
import 'package:splendlens_fe/view/screens/home/home.dart';
import 'package:splendlens_fe/core/utilities/utilities.dart';
import 'package:splendlens_fe/viewmodel/viewmodel.dart';

class HomeScreenBody extends StatefulWidget {
  const HomeScreenBody({super.key});

  @override
  State<HomeScreenBody> createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody> {
  HomeViewModel? _homeViewModel;
  List<Expense>? expenses;

  @override
  void initState() {
    super.initState();

    _homeViewModel = context.read<HomeViewModel>();
    expenses = _homeViewModel!.expenses;
    debugPrint(expenses.toString());
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Stack(
        children: <Widget>[
          Container(
            width: DeviceConfig.screenWidth,
            height: DeviceConfig.screenHeight,
            alignment: Alignment.topCenter,
            decoration: BoxDecoration(color: AppTheme().darkBlue),
            child: ListTile(
              leading: SvgPicture.asset(AppConstants().walletIcon),
              title: Text(
                'Total Amount',
                style: AppTheme().whiteNormallineStyle,
              ),
              subtitle: Text(
                '1233',
                style: AppTheme().whiteBoldHeadlineStyle,
              ),
              trailing: SizedBox(
                height: 40.0,
                child: MaterialButton(
                  elevation: 0,
                  color: AppTheme().blue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24.0)),
                  onPressed: () {},
                  child: Text(
                    'View Detail',
                    style: AppTheme().whiteNormallineStyle,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: getProportionateScreenHeight(0),
            child: Container(
                width: DeviceConfig.screenWidth,
                height: getProportionateScreenHeight(500),
                color: Colors.white),
          ),
          Positioned(
            top: getProportionateScreenHeight(90),
            width: DeviceConfig.screenWidth,
            child: Container(
                padding: const EdgeInsets.only(top: 30),
                margin: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(24),
                ),
                height: 190,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: const HomeBarChart()),
          ),
          Positioned(
              bottom: 0,
              height: getProportionateScreenHeight(350),
              width: DeviceConfig.screenWidth,
              child: const Column(
                children: [
                  TabBar(
                    tabs: [
                      Tab(
                        text: 'January',
                      ),
                      Tab(
                        text: 'February',
                      ),
                      Tab(
                        text: 'March',
                      )
                    ],
                  ),
                  Expanded(
                      child: TabBarView(children: [
                    ExpenseList(),
                    ExpenseList(),
                    ExpenseList(),
                  ]))
                ],
              ))
        ],
      ),
    );
  }
}
