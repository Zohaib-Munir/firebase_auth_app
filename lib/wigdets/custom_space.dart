import 'package:flutter/material.dart';

class Spacing {
  static Widget commonSpace({double width = 0, double height = 0}) {
    return SizedBox(
      width: width,
      height: height,
    );
  }
}

class CustomDivider {
  static Widget divider(
      {double width = 0, double height = 0, Color color = Colors.black}) {
    return Container(
      height: height,
      width: width,
      color: color,
    );
  }
}
