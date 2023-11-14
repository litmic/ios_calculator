import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ios_calculator/calculator_button.dart';
import 'package:ios_calculator/calculator_provider.dart';
import 'package:ios_calculator/style.dart';
import 'package:provider/provider.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  late final CalculatorProvider _calculatorProvider;

  @override
  void initState() {
    super.initState();
    _calculatorProvider =
        Provider.of<CalculatorProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Consumer<CalculatorProvider>(
          builder: (context, calculatorProvider, child) => Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.15,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: FittedBox(
                    child: Text(
                      calculatorProvider.result,
                      maxLines: 1,
                      style:
                          const TextStyle(color: Colors.white, fontSize: 100),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CalculatorButton(
                      onPressed: () => calculatorProvider.onACPressed(),
                      backgroundColor: Style.lightGrey,
                      icon: const Text(
                        'AC',
                        style: Style.testStyleActionButton,
                      ),
                    ),
                    CalculatorButton(
                      onPressed: () => calculatorProvider.onChangeSignPressed(),
                      backgroundColor: Style.lightGrey,
                      icon: const Icon(CupertinoIcons.plus_slash_minus),
                    ),
                    CalculatorButton(
                      onPressed: () => calculatorProvider.onPercentPressed(),
                      backgroundColor: Style.lightGrey,
                      icon: const Icon(CupertinoIcons.percent),
                    ),
                    CalculatorButton(
                      onPressed: () => calculatorProvider
                          .onOperationPressed(Operation.division),
                      backgroundColor:
                          calculatorProvider.operation == Operation.division &&
                                  calculatorProvider.secNum == null
                              ? Colors.white
                              : Style.orange,
                      icon: Icon(
                        CupertinoIcons.divide,
                        color: calculatorProvider.operation ==
                                    Operation.division &&
                                calculatorProvider.secNum == null
                            ? Style.orange
                            : Colors.white,
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
                      onPressed: () => calculatorProvider.onNumPressed(7),
                      backgroundColor: Style.darkGrey,
                      icon: const Text(
                        '7',
                        style: Style.testStyleNumButton,
                      ),
                    ),
                    CalculatorButton(
                      onPressed: () => calculatorProvider.onNumPressed(8),
                      backgroundColor: Style.darkGrey,
                      icon: const Text(
                        '8',
                        style: Style.testStyleNumButton,
                      ),
                    ),
                    CalculatorButton(
                      onPressed: () => calculatorProvider.onNumPressed(9),
                      backgroundColor: Style.darkGrey,
                      icon: const Text(
                        '9',
                        style: Style.testStyleNumButton,
                      ),
                    ),
                    CalculatorButton(
                      onPressed: () => calculatorProvider
                          .onOperationPressed(Operation.multiplication),
                      backgroundColor: calculatorProvider.operation ==
                                  Operation.multiplication &&
                              calculatorProvider.secNum == null
                          ? Colors.white
                          : Style.orange,
                      icon: Icon(
                        CupertinoIcons.multiply,
                        color: calculatorProvider.operation ==
                                    Operation.multiplication &&
                                calculatorProvider.secNum == null
                            ? Style.orange
                            : Colors.white,
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
                      onPressed: () => calculatorProvider.onNumPressed(4),
                      backgroundColor: Style.darkGrey,
                      icon: const Text(
                        '4',
                        style: Style.testStyleNumButton,
                      ),
                    ),
                    CalculatorButton(
                      onPressed: () => calculatorProvider.onNumPressed(5),
                      backgroundColor: Style.darkGrey,
                      icon: const Text(
                        '5',
                        style: Style.testStyleNumButton,
                      ),
                    ),
                    CalculatorButton(
                      onPressed: () => calculatorProvider.onNumPressed(6),
                      backgroundColor: Style.darkGrey,
                      icon: const Text(
                        '6',
                        style: Style.testStyleNumButton,
                      ),
                    ),
                    CalculatorButton(
                      onPressed: () => calculatorProvider
                          .onOperationPressed(Operation.substraction),
                      backgroundColor: calculatorProvider.operation ==
                                  Operation.substraction &&
                              calculatorProvider.secNum == null
                          ? Colors.white
                          : Style.orange,
                      icon: Icon(
                        CupertinoIcons.minus,
                        color: calculatorProvider.operation ==
                                    Operation.substraction &&
                                calculatorProvider.secNum == null
                            ? Style.orange
                            : Colors.white,
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
                      onPressed: () => calculatorProvider.onNumPressed(1),
                      backgroundColor: Style.darkGrey,
                      icon: const Text(
                        '1',
                        style: Style.testStyleNumButton,
                      ),
                    ),
                    CalculatorButton(
                      onPressed: () => calculatorProvider.onNumPressed(2),
                      backgroundColor: Style.darkGrey,
                      icon: const Text(
                        '2',
                        style: Style.testStyleNumButton,
                      ),
                    ),
                    CalculatorButton(
                      onPressed: () => calculatorProvider.onNumPressed(3),
                      backgroundColor: Style.darkGrey,
                      icon: const Text(
                        '3',
                        style: Style.testStyleNumButton,
                      ),
                    ),
                    CalculatorButton(
                      onPressed: () => calculatorProvider
                          .onOperationPressed(Operation.addition),
                      backgroundColor:
                          calculatorProvider.operation == Operation.addition &&
                                  calculatorProvider.secNum == null
                              ? Colors.white
                              : Style.orange,
                      icon: Icon(
                        CupertinoIcons.plus,
                        color: calculatorProvider.operation ==
                                    Operation.addition &&
                                calculatorProvider.secNum == null
                            ? Style.orange
                            : Colors.white,
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
                      onPressed: () => calculatorProvider.onNumPressed(0),
                      backgroundColor: Style.darkGrey,
                      scaleWidth: 2.3,
                      icon: const Text(
                        '0',
                        style: Style.testStyleNumButton,
                      ),
                    ),
                    CalculatorButton(
                      onPressed: () => calculatorProvider.onCommaPressed(),
                      backgroundColor: Style.darkGrey,
                      icon: const Text(
                        ',',
                        style: Style.testStyleNumButton,
                      ),
                    ),
                    CalculatorButton(
                      onPressed: () => calculatorProvider.onEqualsPressed(),
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
      ),
    );
  }
}
