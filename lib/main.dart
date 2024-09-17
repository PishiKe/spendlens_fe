import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'ui/ui.dart';

void main() {
  runApp(MultiProvider(
    providers: [
    ChangeNotifierProvider(create: (_) => AuthenticationViewModel()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SpendLens',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Login(),
    );
  }
}
