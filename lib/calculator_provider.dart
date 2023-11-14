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
  bool isFirstNumEnter = true;
  bool isSecNumEnter = false;
  bool isEqualsPressed = false;
  Operation? operation;

  void onNumPressed(int num) {
    if (isFirstNumEnter) {
      if (firstNum == null) {
        result = num.toString();
      } else if (result.startsWith('0') && !result.contains(',')) {
        result = num.toString();
      } else if (result.startsWith('-0') && !result.contains(',')) {
        result = '-$num';
      } else {
        result += num.toString();
      }
      firstNum = parseStringToDouble(result);
    }
    if (isSecNumEnter) {
      if (secNum == null) {
        result = num.toString();
      } else if (result.startsWith('0') && !result.contains(',')) {
        result = num.toString();
      } else if (result.startsWith('-0') && !result.contains(',')) {
        result = '-$num';
      } else {
        result += num.toString();
      }
      secNum = parseStringToDouble(result);
    }
    showLogs('onNumPressed');
    notifyListeners();
  }

  void onCommaPressed() {
    if (result.contains(',')) return;
    if (isFirstNumEnter) {
      result = '$firstNum,';
    }
    if (isSecNumEnter) {
      result = '$secNum,';
    }
    result = removeTrailingZeros(result);
    showLogs('onCommaPressed');
    notifyListeners();
  }

  void onChangeSignPressed() {
    if (isFirstNumEnter) {
      if (firstNum == 0 || firstNum == null) {
        if (result.startsWith('-')) {
          firstNum = 0;
        } else {
          firstNum = -0;
        }
      } else {
        firstNum = firstNum! * -1;
      }
      result = firstNum.toString();
    }
    if (isSecNumEnter) {
      if (secNum == 0 || secNum == null) {
        if (result.startsWith('-')) {
          secNum = 0;
        } else {
          secNum = -0;
        }
      } else {
        secNum = secNum! * -1;
      }
      result = secNum.toString();
    }
    result = removeTrailingZeros(result);
    showLogs('onChangeSignPressed');
    notifyListeners();
  }

  void onOperationPressed(Operation operation) {
    if (firstNum != null && secNum != null && !isEqualsPressed) {
      onEqualsPressed(updateFirstNum: true);
    } else if (isFirstNumEnter && firstNum == null && secNum == null) {
      firstNum = 0;
    } else if (isFirstNumEnter && secNum != null) {
      firstNum = parseStringToDouble(result);
      secNum = null;
    }
    isSecNumEnter = true;
    isFirstNumEnter = false;
    isEqualsPressed = false;
    this.operation = operation;
    showLogs('onOperationPressed');
    notifyListeners();
  }

  void onEqualsPressed({bool updateFirstNum = false}) {
    if (operation == null) return;
    if (firstNum != null) {
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
      if (updateFirstNum) {
        isFirstNumEnter = false;
        isSecNumEnter = true;
        secNum = null;
        firstNum = parseStringToDouble(result);
      } else {
        isFirstNumEnter = true;
        isSecNumEnter = false;
        firstNum = null;
        isEqualsPressed = true;
      }
      showLogs('onEqualsPressed');
      notifyListeners();
    }
  }

  void onACPressed() {
    result = '0';
    firstNum = null;
    secNum = null;
    isFirstNumEnter = true;
    isSecNumEnter = false;
    isEqualsPressed = false;
    operation = null;
    showLogs('onACPressed');
    notifyListeners();
  }

  String removeTrailingZeros(String n) {
    return n.replaceAll(RegExp(r"([.]*0+)(?!.*\d)"), "");
  }

  double? parseStringToDouble(String n) {
    return double.tryParse(n.replaceAll(',', '.'));
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
