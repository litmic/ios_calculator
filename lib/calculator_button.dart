import 'package:flutter/material.dart';

class CalculatorButton extends StatefulWidget {
  final void Function()? onPressed;
  final Color? backgroundColor;
  final Widget icon;
  final double? scaleWidth;
  const CalculatorButton(
      {super.key,
      required this.onPressed,
      this.backgroundColor,
      required this.icon,
      this.scaleWidth});

  @override
  State<CalculatorButton> createState() => _CalculatorButtonState();
}

class _CalculatorButtonState extends State<CalculatorButton> {
  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: const BorderRadius.all(Radius.circular(45)),
      color: widget.backgroundColor,
      child: InkWell(
        onTap: widget.onPressed,
        splashColor: Colors.white.withOpacity(0.5),
        borderRadius: const BorderRadius.all(Radius.circular(45)),
        child: Container(
          height: MediaQuery.of(context).size.width * 0.2,
          width: MediaQuery.of(context).size.width *
              0.2 *
              (widget.scaleWidth ?? 1),
          color: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: FittedBox(child: widget.icon),
          ),
        ),
      ),
    );
  }
}
