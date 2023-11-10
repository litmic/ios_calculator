import 'dart:developer';

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
      secNum = parseStringToDouble(result);
    } else {
      if (result.startsWith('0')) {
        result = num.toString();
      } else {
        result += num.toString();
      }
      firstNum = parseStringToDouble(result);
    }
    showLogs('onNumPressed');
    notifyListeners();
  }

  void onCommaPressed() {
    if (result.contains(',')) return;
    if (secNum != null) {
      result = '$secNum,';
    } else {
      result = '$firstNum,';
    }
    result = removeTrailingZeros(result);
    showLogs('onCommaPressed');
    notifyListeners();
  }

  void onChangeSignPressed() {
    if (secNum != null) {
      secNum = secNum! * -1;
      result = secNum.toString();
    } else {
      firstNum = firstNum! * -1;
      result = firstNum.toString();
    }
    result = removeTrailingZeros(result);
    showLogs('onChangeSignPressed');
    notifyListeners();
  }

  void onOperationPressed(Operation operation) {
    if (firstNum != null && secNum != null) {
      onEqualsPressed();
    }
    this.operation = operation;
    showLogs('onOperationPressed');
    notifyListeners();
  }

  void onACPressed() {
    result = '0';
    firstNum = null;
    secNum = null;
    operation = null;
    showLogs('onACPressed');
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
    result = result.replaceAll('.', ',');
    operation = null;
    secNum = null;
    firstNum = parseStringToDouble(result);
    showLogs('onEqualsPressed');
    notifyListeners();
  }

  String removeTrailingZeros(String n) {
    return n.replaceAll(RegExp(r"([.]*0+)(?!.*\d)"), "");
  }

  double parseStringToDouble(String n) {
    return double.tryParse(n.replaceAll(',', '.')) ?? 0;
  }

  String parseDoubleToString(double n) {
    return n.toString().replaceAll('.', ',');
  }

  showLogs(String title) {
    log(title);
    log('firstNum: $firstNum');
    log('secNum: $secNum');
    log('result: $result');
  }
}
