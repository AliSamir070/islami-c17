import 'package:flutter/material.dart';
import 'package:islami_c17/core/resources/ColorsManager.dart';

class AppTextButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const AppTextButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        textStyle: const TextStyle(fontSize: 16),
      ),
      child: Text(text,style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        fontFamily: "Janna LT",
        color: ColorsManager.primaryColor,
      ),),
    );
  }
}
