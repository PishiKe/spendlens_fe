import 'package:flutter/material.dart';
import 'package:splendlens_fe/core/utilities/utilities.dart';

class CustomButton extends StatelessWidget {
  final Function onPressed;
  final String text;

  const CustomButton({super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        color: AppTheme().lightBlue,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(24.0))),
        onPressed: onPressed as void Function(),
        child: Text(
          text,
          style: TextStyle(color: AppTheme().white),
        ));
  }
}
