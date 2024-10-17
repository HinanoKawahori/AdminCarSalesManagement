import 'package:flutter/material.dart';

import '../../../../config/utils/style/color_style.dart';

class SalesDataText extends StatelessWidget {
  const SalesDataText({
    super.key,
    required this.title,
    this.textColor = ColorStyle.white,
  });

  final String title;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            color: textColor,
          ),
        ),
      ),
    );
  }
}
