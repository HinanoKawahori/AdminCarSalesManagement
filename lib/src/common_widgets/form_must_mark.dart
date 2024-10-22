import 'package:admin_car_sales_management/src/config/utils/style/custom_font_style.dart';
import 'package:flutter/material.dart';

import '../config/utils/style/color_style.dart';

class FormMustMark extends StatelessWidget {
  const FormMustMark({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      width: 40,
      decoration: BoxDecoration(
        color: ColorStyle.pink,
        borderRadius: BorderRadius.circular(5), // 縁の丸みを設定
      ),
      child: const Center(
        child: Text(
          '必須',
          style: TextStyle(
            color: ColorStyle.white,
            fontWeight: FontWeight.bold,
            fontSize: CustomFontSize.small,
          ),
        ),
      ),
    );
  }
}
