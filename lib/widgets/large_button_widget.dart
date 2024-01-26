import 'package:compulsilina/styles/styles.dart';
import 'package:flutter/material.dart';

class LargeButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const LargeButtonWidget({
    super.key,
    required this.text, required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: AppStyles.largeButtonSize,
      ),
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
