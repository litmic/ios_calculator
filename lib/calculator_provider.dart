import 'package:flutter/material.dart';

enum Operation {
  addition,
  substraction,
  division,
  multiplication,
}

class CalculatorProvider extends ChangeNotifier {
  String result = '0';
  double? firstNum;
  double? secNum;
  Operation? operation;

  void onNumPressed(int num) {
    if (operation != null) {
      if (secNum != null) {
        if (result.startsWith('0')) {
          result = num.toString();
        } else {
          result += num.toString();
        }
      } else {
        result = num.toString();
      }
      secNum = double.tryParse(result) ?? 0;
    } else {
      if (result.startsWith('0')) {
        result = num.toString();
      } else {
        result += num.toString();
      }
      firstNum = double.tryParse(result) ?? 0;
    }
    notifyListeners();
  }

  void onCommaPressed() {}

  void onChangeSignPressed() {
    if (secNum != null) {
      secNum = secNum! * -1;
      result = secNum.toString();
    } else {
      firstNum = firstNum! * -1;
      result = firstNum.toString();
    }
    result = removeTrailingZeros(result);
    notifyListeners();
  }

  void onOperationPressed(Operation operation) {
    if (firstNum != null && secNum != null) {
      onEqualsPressed();
    }
    this.operation = operation;
    notifyListeners();
  }

  void onACPressed() {
    result = '0';
    firstNum = null;
    secNum = null;
    operation = null;
    notifyListeners();
  }

  void onEqualsPressed() {
    if (operation == null) return;
    if (firstNum == null) return;
    secNum ??= firstNum;
    switch (operation!) {
      case Operation.addition:
        result = (firstNum! + secNum!).toString();
        break;
      case Operation.substraction:
        result = (firstNum! - secNum!).toString();
        break;
      case Operation.division:
        result = (firstNum! / secNum!).toString();
        break;
      case Operation.multiplication:
        result = (firstNum! * secNum!).toString();
        break;
    }
    result = removeTrailingZeros(result);
    operation = null;
    secNum = null;
    firstNum = double.tryParse(result) ?? 0;
    notifyListeners();
  }

  removeTrailingZeros(String n) {
    return n.replaceAll(RegExp(r"([.]*0+)(?!.*\d)"), "");
  }
}
