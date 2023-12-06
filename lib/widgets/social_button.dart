import 'package:flutter/material.dart';

import 'package:firebase_auth_learning/utils/app_colors.dart';

class SocialButton extends StatelessWidget {
  final String imagePath;
  final Function() onTap;
  const SocialButton({
    Key? key,
    required this.imagePath,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.white),
          borderRadius: BorderRadius.circular(16),
          color: AppColors.textfieldFill,
        ),
        child: Image.asset(
          imagePath,
          height: 45,
        ),
      ),
    );
  }
}
