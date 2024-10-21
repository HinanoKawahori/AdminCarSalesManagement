import 'package:admin_car_sales_management/src/config/utils/style/color_style.dart';
import 'package:admin_car_sales_management/src/config/utils/style/custom_font_style.dart';
import 'package:admin_car_sales_management/src/config/utils/style/height_margin.dart';
import 'package:admin_car_sales_management/src/config/utils/style/padding_style.dart';
import 'package:admin_car_sales_management/src/features/dash_board/view/component/year_drop_button.dart';
import 'package:flutter/material.dart';

import 'year_and_month_drop_button.dart';

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
                (title == '買取総額の推移') ? YearDropButton() : Container(),
              ],
            ),
            HeightMargin.normal,
            //メインウィジェット
            contentWidget,
          ],
        ),
      ),
    );
  }
}
