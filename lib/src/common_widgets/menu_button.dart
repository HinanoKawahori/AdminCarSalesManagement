import 'package:flutter/material.dart';

import '../config/utils/style/color_style.dart';

class MenuButton extends StatelessWidget {
  final VoidCallback onPressed;

  const MenuButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: ColorStyle.blueGradation,
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
        borderRadius: BorderRadius.circular(100), // 縁の丸みを設定
      ),
      child: TextButton(
        onPressed: onPressed, // 渡された関数を実行
        child: const Icon(
          Icons.menu,
          color: ColorStyle.mainWhite,
        ),
      ),
    );
  }
}
