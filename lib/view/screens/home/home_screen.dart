import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:splendlens_fe/view/view.dart';
import 'package:splendlens_fe/viewmodel/viewmodel.dart';
import 'package:splendlens_fe/core/utilities/utilities.dart';

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

      );
    });
  }
}
