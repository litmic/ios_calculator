import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ios_calculator/calculator_button.dart';
import 'package:ios_calculator/style.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final String _result = "0";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Text(
                _result,
                style: const TextStyle(color: Colors.white, fontSize: 100),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CalculatorButton(
                    onPressed: () {},
                    backgroundColor: Style.lightGrey,
                    icon: const Text(
                      'AC',
                      style: Style.testStyleActionButton,
                    ),
                  ),
                  CalculatorButton(
                    onPressed: () {},
                    backgroundColor: Style.lightGrey,
                    icon: const Icon(CupertinoIcons.plus_slash_minus),
                  ),
                  CalculatorButton(
                    onPressed: () {},
                    backgroundColor: Style.lightGrey,
                    icon: const Icon(CupertinoIcons.percent),
                  ),
                  CalculatorButton(
                    onPressed: () {},
                    backgroundColor: Style.orange,
                    icon: const Icon(
                      CupertinoIcons.divide,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CalculatorButton(
                    onPressed: () {},
                    backgroundColor: Style.darkGrey,
                    icon: const Text(
                      '7',
                      style: Style.testStyleNumButton,
                    ),
                  ),
                  CalculatorButton(
                    onPressed: () {},
                    backgroundColor: Style.darkGrey,
                    icon: const Text(
                      '8',
                      style: Style.testStyleNumButton,
                    ),
                  ),
                  CalculatorButton(
                    onPressed: () {},
                    backgroundColor: Style.darkGrey,
                    icon: const Text(
                      '9',
                      style: Style.testStyleNumButton,
                    ),
                  ),
                  CalculatorButton(
                    onPressed: () {},
                    backgroundColor: Style.orange,
                    icon: const Icon(
                      CupertinoIcons.multiply,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CalculatorButton(
                    onPressed: () {},
                    backgroundColor: Style.darkGrey,
                    icon: const Text(
                      '4',
                      style: Style.testStyleNumButton,
                    ),
                  ),
                  CalculatorButton(
                    onPressed: () {},
                    backgroundColor: Style.darkGrey,
                    icon: const Text(
                      '5',
                      style: Style.testStyleNumButton,
                    ),
                  ),
                  CalculatorButton(
                    onPressed: () {},
                    backgroundColor: Style.darkGrey,
                    icon: const Text(
                      '6',
                      style: Style.testStyleNumButton,
                    ),
                  ),
                  CalculatorButton(
                    onPressed: () {},
                    backgroundColor: Style.orange,
                    icon: const Icon(
                      CupertinoIcons.minus,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CalculatorButton(
                    onPressed: () {},
                    backgroundColor: Style.darkGrey,
                    icon: const Text(
                      '1',
                      style: Style.testStyleNumButton,
                    ),
                  ),
                  CalculatorButton(
                    onPressed: () {},
                    backgroundColor: Style.darkGrey,
                    icon: const Text(
                      '2',
                      style: Style.testStyleNumButton,
                    ),
                  ),
                  CalculatorButton(
                    onPressed: () {},
                    backgroundColor: Style.darkGrey,
                    icon: const Text(
                      '3',
                      style: Style.testStyleNumButton,
                    ),
                  ),
                  CalculatorButton(
                    onPressed: () {},
                    backgroundColor: Style.orange,
                    icon: const Icon(
                      CupertinoIcons.plus,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CalculatorButton(
                    onPressed: () {},
                    backgroundColor: Style.darkGrey,
                    scaleWidth: 2.3,
                    icon: const Text(
                      '0',
                      style: Style.testStyleNumButton,
                    ),
                  ),
                  CalculatorButton(
                    onPressed: () {},
                    backgroundColor: Style.darkGrey,
                    icon: const Text(
                      ',',
                      style: Style.testStyleNumButton,
                    ),
                  ),
                  CalculatorButton(
                    onPressed: () {},
                    backgroundColor: Style.orange,
                    icon: const Icon(
                      CupertinoIcons.equal,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
