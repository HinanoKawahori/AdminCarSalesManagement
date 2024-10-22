import 'package:admin_car_sales_management/src/config/utils/style/custom_font_style.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../config/utils/style/color_style.dart';
import '../../../../config/utils/style/padding_style.dart';
import '../../../../config/utils/style/width_margin.dart';

class SalesSumWidget extends ConsumerWidget {
  const SalesSumWidget({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Card(
      child: Padding(
        padding: PaddingStyle.normal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '8月の買取総額',
              style: TextStyle(
                color: ColorStyle.mainBlack,
                fontWeight: FontWeight.bold,
                fontSize: CustomFontSize.large,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  '31,300,000',
                  style: TextStyle(
                    fontSize: CustomFontSize.largest,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                WidthMargin.small,
                Text('円'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
