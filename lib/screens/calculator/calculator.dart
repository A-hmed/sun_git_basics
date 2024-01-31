import 'package:flutter/material.dart';
import 'package:sun_basics_flutter/screens/calculator/calculator_button.dart';

class CalculatorScreen extends StatefulWidget {
  static String routeName = "calculator";

  CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String result = "";
  String lhs = "";
  String savedOperator = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculator"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: Text(
                    result,
                    style: TextStyle(fontSize: 32),
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
              ],
            ),
          )),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CalculatorButton(
                  digit: "7",
                  onClick: onDigitClick,
                ),
                CalculatorButton(
                  digit: "8",
                  onClick: onDigitClick,
                ),
                CalculatorButton(
                  digit: "9",
                  onClick: onDigitClick,
                ),
                CalculatorButton(
                  digit: "+",
                  onClick: onOperatorClick,
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CalculatorButton(
                  digit: "4",
                  onClick: onDigitClick,
                ),
                CalculatorButton(
                  digit: "5",
                  onClick: onDigitClick,
                ),
                CalculatorButton(
                  digit: "6",
                  onClick: onDigitClick,
                ),
                CalculatorButton(
                  digit: "-",
                  onClick: onOperatorClick,
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CalculatorButton(
                  digit: "1",
                  onClick: onDigitClick,
                ),
                CalculatorButton(
                  digit: "2",
                  onClick: onDigitClick,
                ),
                CalculatorButton(
                  digit: "3",
                  onClick: onDigitClick,
                ),
                CalculatorButton(
                  digit: "x",
                  onClick: onOperatorClick,
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CalculatorButton(
                  digit: ".",
                  onClick: onDigitClick,
                ),
                CalculatorButton(
                  digit: "0",
                  onClick: onDigitClick,
                ),
                CalculatorButton(
                  digit: "=",
                  onClick: onEqualClick,
                ),
                CalculatorButton(
                  digit: "/",
                  onClick: onOperatorClick,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void onDigitClick(String digit) {
    if(result.contains('.')) return;
    result += digit;
    setState(() {});
  }

  void onOperatorClick(String operator) {
    if (savedOperator.isEmpty) {
      lhs = result;
      savedOperator = operator;
    } else {
      lhs = calculate(lhs, savedOperator, result);
      savedOperator = operator;
    }
    result = "";
    setState(() {});
    print("onOperatorClick: lhs = $lhs, savedOperator = $savedOperator");
  }

  void onEqualClick(_) {
    result = calculate(lhs, savedOperator, result);
    lhs = "";
    savedOperator = "";
    setState(() {});
  }

  String calculate(String lhs, String operator, String rhs) {
    double number1 = double.parse(lhs);
    double number2 = double.parse(rhs);
    if (operator == "+") {
      return "${number1 + number2}";
    } else if (operator == "-") {
      return "${number1 - number2}";
    } else if (operator == "x") {
      return "${number1 * number2}";
    } else {
      return "${number1 / number2}";
    }
  }
}

/// 7 + 3 -
