import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.text,
    required this.fontWeight,
    required this.fontSize,
    this.textColor = Colors.black,
  });
  final String text;
  final FontWeight fontWeight;
  final double fontSize;
  final String fontFamily = 'Urbanist';
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: fontWeight,
        fontSize: fontSize,
        fontFamily: fontFamily,
        color: textColor,
      ),
    );
  }
}
