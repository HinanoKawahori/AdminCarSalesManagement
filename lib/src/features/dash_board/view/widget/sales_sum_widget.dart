import 'package:admin_car_sales_management/src/config/utils/style/custom_font_style.dart';
import 'package:admin_car_sales_management/src/config/utils/style/width_margin.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SalesSumWidget extends ConsumerWidget {
  const SalesSumWidget({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      body: Row(
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
    );
  }
}
