import 'package:flutter/material.dart';
import 'package:ios_calculator/calculator_provider.dart';
import 'package:ios_calculator/calculator_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Calculator App!!',
      theme: ThemeData(
        colorSchemeSeed: Colors.indigo,
        useMaterial3: true,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        colorSchemeSeed: Colors.blue,
        useMaterial3: true,
        brightness: Brightness.dark,
      ),
      home: ChangeNotifierProvider<CalculatorProvider>(
        create: (_) => CalculatorProvider(),
        child: const CalculatorScreen(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
