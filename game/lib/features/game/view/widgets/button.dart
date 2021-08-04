import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Button extends StatelessWidget {
  final String text;
  final Color? textColor;
  final VoidCallback onPressed;
  const Button(
      {Key? key,
      required this.onPressed,
      required this.textColor,
      required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        key: key,
        style: ButtonStyle(
            side: MaterialStateBorderSide.resolveWith(
                (states) => const BorderSide(color: Colors.grey))),
        onPressed: onPressed,
        child: Align(
            alignment: Alignment.center,
            child: Text(
              text,
              style: TextStyle(color: textColor, fontSize: 30),
            )));
  }
}
