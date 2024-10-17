import 'package:flutter/material.dart';

import '../config/utils/style/color_style.dart';

class BlueGradationButton extends StatelessWidget {
  const BlueGradationButton({
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
      width: 200,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: ColorStyle.blueGradation,
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
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
