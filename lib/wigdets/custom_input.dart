import 'package:firebase_auth_app/constants/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomInputField extends StatefulWidget {
  CustomInputField({
    super.key,
    required this.controller,
    required this.assets,
    required this.helperText,
    this.postFixIcon,
    this.showText = false,
    this.postFixIcon2,
  });
  final TextEditingController controller;
  final String assets;
  final String helperText;
  final String? postFixIcon;
  bool showText;
  final String? postFixIcon2;

  @override
  State<CustomInputField> createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: widget.showText,
      obscuringCharacter: '*',
      controller: widget.controller,
      decoration: InputDecoration(
        hintText: widget.helperText,
        hintStyle: const TextStyle(
          color: Color(
            0XFF7E8CA0,
          ),
          fontFamily: 'Urbanist',
          fontSize: 14,
        ),
        prefixIcon: SvgPicture.asset(
          widget.assets,
          fit: BoxFit.contain,
          color: const Color(0XFF808D9E),
        ),
        prefixIconConstraints: const BoxConstraints(
          minWidth: 48,
          minHeight: 28,
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0XFFE9ECF2), width: 1.0),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0XFF257CFF), width: 1.0),
        ),
        suffixIcon: widget.postFixIcon != null
            ? GestureDetector(
                onTap: () {
                  setState(() {
                    widget.showText = !widget.showText;
                  });
                },
                child: widget.showText
                    ? SvgPicture.asset(
                        widget.postFixIcon!,
                        fit: BoxFit.contain,
                      )
                    : SvgPicture.asset(
                        AppStrings.postFixIcon2,
                        color: const Color(0XFF7E8CA0),
                        fit: BoxFit.contain,
                      ),
              )
            : null,
        suffixIconConstraints: const BoxConstraints(
          minWidth: 48,
          minHeight: 24,
        ),
      ),
    );
  }
}
