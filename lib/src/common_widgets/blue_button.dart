import 'package:flutter/material.dart';

import '../config/utils/style/color_style.dart';

class BlueButton extends StatelessWidget {
  const BlueButton({
    super.key,
    required this.onPressed,
    required this.title,
  });
  final VoidCallback onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 100,
      decoration: BoxDecoration(
        color: ColorStyle.blue,
        borderRadius: BorderRadius.circular(10), // 縁の丸みを設定
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          title,
          style: const TextStyle(
            color: ColorStyle.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
