import 'package:flutter/material.dart';

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
      home: const CalculatorApp(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class CalculatorApp extends StatefulWidget {
  const CalculatorApp({super.key});

  @override
  State<CalculatorApp> createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  final String _result = "0";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
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
            child: Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CalculatorButton(
                    onPressed: () {},
                    backgroundColor: const Color.fromARGB(255, 165, 165, 165),
                    icon: const Text(
                      'AC',
                    ),
                  ),
                  CalculatorButton(
                    onPressed: () {},
                    backgroundColor: const Color.fromARGB(255, 165, 165, 165),
                    icon: const Text(
                      'AC',
                    ),
                  ),
                  CalculatorButton(
                    onPressed: () {},
                    backgroundColor: const Color.fromARGB(255, 165, 165, 165),
                    icon: const Text(
                      'AC',
                    ),
                  ),
                  CalculatorButton(
                    onPressed: () {},
                    backgroundColor: const Color.fromARGB(255, 165, 165, 165),
                    icon: const Text(
                      'AC',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CalculatorButton extends StatefulWidget {
  final void Function()? onPressed;
  final Color? backgroundColor;
  final Widget icon;
  const CalculatorButton(
      {super.key,
      required this.onPressed,
      this.backgroundColor,
      required this.icon});

  @override
  State<CalculatorButton> createState() => _CalculatorButtonState();
}

class _CalculatorButtonState extends State<CalculatorButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      child: CircleAvatar(
        backgroundColor: widget.backgroundColor,
        radius: MediaQuery.of(context).size.width * 0.1,
        child: widget.icon,
      ),
    );
  }
}
