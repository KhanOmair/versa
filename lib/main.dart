import 'package:flutter/material.dart';
import 'screens/home_page.dart';
import 'package:versa_web/utils/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Versa',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.themeData,
      home: const HomePage(),
    );
  }
}
