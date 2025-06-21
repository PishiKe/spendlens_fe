import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
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

class _HomeScreenBodyState extends State<HomeScreenBody>
    with SingleTickerProviderStateMixin {
  HomeViewModel? _homeViewModel;
  List<Expense>? expenses;

  DateTime now = DateTime.now();
  late List<String> last3Months;
  late TabController _tabController;
  int selectedTabIndex = 0;

  @override
  void initState() {
    super.initState();

    _homeViewModel = context.read<HomeViewModel>();

    last3Months = List.generate(3, (index) {
      DateTime month = DateTime(now.year, now.month - index, 1);
      return DateFormat('MMMM').format(month);
    });

    _tabController = TabController(length: 4, vsync: this);

    _tabController.addListener(() {
      if (!_tabController.indexIsChanging) {
        setState(() {
          selectedTabIndex = _tabController.index;
        });
        fetchExpensesForTab(selectedTabIndex);
      }
    });


    fetchExpensesForTab(0);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Future<void> fetchExpensesForTab(int index) async {
    if (index < 3) {
      DateTime selectedDate = DateTime(now.year, now.month - index, 1);

      String formattedDate = DateFormat('yyyy-MM').format(selectedDate);

      _homeViewModel!.getExpensesByMonth(formattedDate);
    } else {
      _homeViewModel!.getExpenses();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(builder: (context, viewmodel, child) {
      return Stack(
        children: <Widget>[
          // Header Container
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
                viewmodel.expenseTotal.toString(),
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

          // White background bottom
          Positioned(
            bottom: getProportionateScreenHeight(0),
            child: Container(
                width: DeviceConfig.screenWidth,
                height: getProportionateScreenHeight(500),
                color: Colors.white),
          ),

          // Chart section
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

          // Tabs + Expense List
          Positioned(
            bottom: 0,
            height: getProportionateScreenHeight(350),
            width: DeviceConfig.screenWidth,
            child: Column(
              children: [
                // Tabs
                TabBar(
                  controller: _tabController,
                  tabs: [
                    for (var month in last3Months) Tab(text: month),
                    const Tab(text: 'All'),
                  ],
                ),
                // Expense List views
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: const [
                      ExpenseList(),
                      ExpenseList(),
                      ExpenseList(),
                      ExpenseList(),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      );
    });
  }
}
