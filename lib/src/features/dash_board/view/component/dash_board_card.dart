import 'package:admin_car_sales_management/src/config/utils/style/color_style.dart';
import 'package:admin_car_sales_management/src/config/utils/style/custom_font_style.dart';
import 'package:admin_car_sales_management/src/config/utils/style/padding_style.dart';
import 'package:flutter/material.dart';

class DashBoardCard extends StatelessWidget {
  const DashBoardCard({
    super.key,
    required this.contentWidget,
    required this.title,
  });
  final Widget contentWidget;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: PaddingStyle.normal,
        child: Column(
          children: [
            //タイトル
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: ColorStyle.mainBlack,
                    fontWeight: FontWeight.bold,
                    fontSize: CustomFontSize.large,
                  ),
                ),
              ],
            ),
            //メインウィジェット
            contentWidget,
          ],
        ),
      ),
    );
  }
}
