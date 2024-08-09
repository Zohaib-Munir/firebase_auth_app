import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.width,
    required this.height,
    required this.buttonLabel,
    this.backgroundColor = Colors.blueAccent,
    required this.onPress,
  });

  final VoidCallback onPress;
  final double width;
  final double height;
  final String buttonLabel;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: const Color(0XFF257CFF),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Center(
          child: Text(
            buttonLabel,
            style: const TextStyle(
              fontFamily: 'Urbanist',
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
