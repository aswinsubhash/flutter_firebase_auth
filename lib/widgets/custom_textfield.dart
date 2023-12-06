import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool isObscured;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.isObscured,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: isObscured,
      decoration: InputDecoration(
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.white),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.lightGrey),
        ),
        fillColor: AppColors.textfieldFill,
        filled: true,
        hintText: hintText,
        hintStyle: const TextStyle(
          color: AppColors.black50percent
        )
      ),
    );
  }
}
