import 'dart:developer';

import 'package:flutter/material.dart';

enum Operation {
  addition,
  substraction,
  division,
  multiplication,
}

class CalculatorProvider extends ChangeNotifier {
  String result = '0'; //visible value on the user's calculator screen
  double firstNum = 0; //the first entered number with default value of 0
  double? secNum; //the second entered number
  Operation? operation; //the operation enum

  void onNumPressed(int num) {
    //enter secNum if operation is set, otherwise enter the firstNum
    if (operation != null) {
      //if secNum is null set new number as result
      if (secNum != null) {
        //change the secNum if there is set value of 0, otherwise add new numbers
        if (result.startsWith('0') && !result.contains(',')) {
          result = num.toString();
        } else if (result.startsWith('-0') && !result.contains(',')) {
          result = '-$num';
        } else {
          result += num.toString();
        }
      } else {
        result = num.toString();
      }
      secNum = parseStringToDouble(result); //parse new result to double
    } else {
      //change the firstNum if there is set value of 0, otherwise add new numbers
      if (result.startsWith('0') && !result.contains(',')) {
        result = num.toString();
      } else if (result.startsWith('-0') && !result.contains(',')) {
        result = '-$num';
      } else {
        result += num.toString();
      }
      firstNum = parseStringToDouble(result); //parse new result to double
    }
    showLogs('onNumPressed');
    notifyListeners();
  }

  void onCommaPressed() {
    if (result.contains(',')) return; //return if there is already a comma
    //if secNum is not null it means that it's entered, put comma to secNum, otherwise use firstNum
    if (secNum != null) {
      result = '$secNum,';
    } else {
      result = '$firstNum,';
    }
    result = removeTrailingZeros(
        result); //remove trailing zeros from the visible value
    showLogs('onCommaPressed');
    notifyListeners();
  }

  void onChangeSignPressed() {
    if (secNum != null && secNum != 0) {
      //change the sign of the number if secNum is entered and it's not 0
      secNum = secNum! * -1;
      result = secNum.toString();
    } else if (secNum == 0) {
      //change the 0 sign of the secNum
      if (result.startsWith('-')) {
        secNum = 0;
      } else {
        secNum = -0;
      }
      result = secNum.toString();
    } else if (operation != null) {
      //if the operation is set and secNum is not null or 0 it means user would like to set secNum as firstNum with opposite sign
      secNum = firstNum * -1;
      result = secNum.toString();
    } else if (firstNum == 0) {
      //change the 0 sign of the firstNum
      if (result.startsWith('-')) {
        firstNum = 0;
      } else {
        firstNum = -0;
      }
      result = firstNum.toString();
    } else {
      //change the sign of the number if secNum is not entered
      firstNum = firstNum * -1;
      result = firstNum.toString();
    }
    result = removeTrailingZeros(
        result); //remove trailing zeros from the visible value
    showLogs('onChangeSignPressed');
    notifyListeners();
  }

  void onOperationPressed(Operation operation) {
    //if secNum and operation is set calculate the result
    if (secNum != null && this.operation != null) {
      onEqualsPressed();
    }
    this.operation = operation;
    showLogs('onOperationPressed');
    notifyListeners();
  }

  void onACPressed() {
    //reset all to default values
    result = '0';
    firstNum = 0;
    secNum = null;
    operation = null;
    showLogs('onACPressed');
    notifyListeners();
  }

  void onEqualsPressed() {
    if (operation == null) return;
    secNum ??= firstNum; //if there is no secNum entered use it as firstNum

    switch (operation!) {
      case Operation.addition:
        result = (firstNum + secNum!).toString();
        break;
      case Operation.substraction:
        result = (firstNum - secNum!).toString();
        break;
      case Operation.division:
        result = (firstNum / secNum!).toString();
        break;
      case Operation.multiplication:
        result = (firstNum * secNum!).toString();
        break;
    }
    result = removeTrailingZeros(
        result); //remove trailing zeros from the visible value
    result = result.replaceAll('.', ','); //show as x,x instead of x.x
    //reset values of operation and secNum
    operation = null;
    secNum = null;
    firstNum = parseStringToDouble(result); //replace firstNum as new result
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
