import 'core/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:splendlens_fe/core/utilities/utilities.dart';
import 'package:splendlens_fe/viewmodel/viewmodel.dart';

void main() {
  final List<SingleChildWidget> providers = [
    ChangeNotifierProvider(create: (_) => AuthenticationViewModel()),
    ChangeNotifierProvider(create: (_) => HomeViewModel())
  ];

  runApp(MultiProvider(
    providers: providers,
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    // Initialize Dynamic Sizing
    DeviceConfig().init(context);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: AppTheme().appTheme,
      routerConfig: AppRoutes.router,
    );
  }
}
