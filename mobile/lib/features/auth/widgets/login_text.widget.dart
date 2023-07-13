import 'package:flutter/material.dart';

class LoginCustomText extends StatelessWidget {
  const LoginCustomText({
    super.key,
    required this.text,
    this.fontSize = 17,
    this.fontWeight = FontWeight.bold,
    this.color = Colors.black,
  });

  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 45, right: 45),
        child: Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: color,
          ),
        ),
      ),
    );
  }
}
