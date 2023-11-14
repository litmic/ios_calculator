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
                      onPressed: () => calculatorProvider.isAcAvaible
                          ? calculatorProvider.onACPressed()
                          : calculatorProvider.onCPressed(),
                      backgroundColor: Style.lightGrey,
                      iconPadding: 18,
                      icon: Text(
                        calculatorProvider.isAcAvaible ? 'AC' : 'C',
                        style: Style.testStyleActionButton,
                      ),
                    ),
                    CalculatorButton(
                      onPressed: () => calculatorProvider.onChangeSignPressed(),
                      backgroundColor: Style.lightGrey,
                      iconPadding: 25,
                      icon: Text(
                        String.fromCharCode(
                            CupertinoIcons.plus_slash_minus.codePoint),
                        style: TextStyle(
                          inherit: false,
                          color: Colors.black,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w800,
                          fontFamily:
                              CupertinoIcons.plus_slash_minus.fontFamily,
                          package: CupertinoIcons.plus_slash_minus.fontPackage,
                        ),
                      ),
                    ),
                    CalculatorButton(
                      onPressed: () => calculatorProvider.onPercentPressed(),
                      backgroundColor: Style.lightGrey,
                      iconPadding: 25,
                      icon: Text(
                        String.fromCharCode(CupertinoIcons.percent.codePoint),
                        style: TextStyle(
                          inherit: false,
                          color: Colors.black,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w800,
                          fontFamily: CupertinoIcons.percent.fontFamily,
                          package: CupertinoIcons.percent.fontPackage,
                        ),
                      ),
                    ),
                    CalculatorButton(
                      onPressed: () => calculatorProvider
                          .onOperationPressed(Operation.division),
                      backgroundColor:
                          calculatorProvider.operation == Operation.division &&
                                  calculatorProvider.secNum == null
                              ? Colors.white
                              : Style.orange,
                      iconPadding: 25,
                      icon: Text(
                        String.fromCharCode(CupertinoIcons.divide.codePoint),
                        style: TextStyle(
                          inherit: false,
                          color: calculatorProvider.operation ==
                                      Operation.division &&
                                  calculatorProvider.secNum == null
                              ? Style.orange
                              : Colors.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w800,
                          fontFamily: CupertinoIcons.divide.fontFamily,
                          package: CupertinoIcons.divide.fontPackage,
                        ),
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
                      iconPadding: 25,
                      icon: Text(
                        String.fromCharCode(CupertinoIcons.multiply.codePoint),
                        style: TextStyle(
                          inherit: false,
                          color: calculatorProvider.operation ==
                                      Operation.multiplication &&
                                  calculatorProvider.secNum == null
                              ? Style.orange
                              : Colors.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w800,
                          fontFamily: CupertinoIcons.multiply.fontFamily,
                          package: CupertinoIcons.multiply.fontPackage,
                        ),
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
                      iconPadding: 25,
                      icon: Text(
                        String.fromCharCode(CupertinoIcons.minus.codePoint),
                        style: TextStyle(
                          inherit: false,
                          color: calculatorProvider.operation ==
                                      Operation.substraction &&
                                  calculatorProvider.secNum == null
                              ? Style.orange
                              : Colors.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w800,
                          fontFamily: CupertinoIcons.minus.fontFamily,
                          package: CupertinoIcons.minus.fontPackage,
                        ),
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
                      iconPadding: 25,
                      icon: Text(
                        String.fromCharCode(CupertinoIcons.add.codePoint),
                        style: TextStyle(
                          inherit: false,
                          color: calculatorProvider.operation ==
                                      Operation.addition &&
                                  calculatorProvider.secNum == null
                              ? Style.orange
                              : Colors.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w800,
                          fontFamily: CupertinoIcons.add.fontFamily,
                          package: CupertinoIcons.add.fontPackage,
                        ),
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
                      iconPadding: 25,
                      icon: Text(
                        String.fromCharCode(CupertinoIcons.equal.codePoint),
                        style: TextStyle(
                          inherit: false,
                          color: Colors.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w800,
                          fontFamily: CupertinoIcons.equal.fontFamily,
                          package: CupertinoIcons.equal.fontPackage,
                        ),
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
