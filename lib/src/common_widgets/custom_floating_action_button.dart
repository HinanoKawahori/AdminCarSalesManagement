import 'package:flutter/material.dart';

import '../config/utils/style/box_decoration.dart';
import '../config/utils/style/color_style.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      shape: const CircleBorder(),
      child: Container(
        width: 100,
        height: 100,
        decoration: floatingActionButtonDecoration,
        child: const Icon(
          Icons.add,
          color: ColorStyle.white,
        ),
      ),
    );
  }
}
