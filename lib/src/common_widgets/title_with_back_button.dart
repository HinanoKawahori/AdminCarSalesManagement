import 'package:flutter/material.dart';

import '../config/utils/style/color_style.dart';
import '../config/utils/style/custom_font_style.dart';
import '../config/utils/style/width_margin.dart';

class TitleWithBackButton extends StatelessWidget {
  const TitleWithBackButton({
    super.key,
    required this.onPressed,
    required this.title,
  });
  final VoidCallback onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: onPressed,
          icon: const Icon(Icons.arrow_back_ios),
        ),
        WidthMargin.small,
        Text(
          title,
          style: const TextStyle(
            fontSize: CustomFontSize.largest,
            color: ColorStyle.mainBlack,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
