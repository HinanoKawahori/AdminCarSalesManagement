import 'package:admin_car_sales_management/src/config/utils/style/custom_font_style.dart';
import 'package:admin_car_sales_management/src/config/utils/style/width_margin.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../config/utils/style/color_style.dart';
import '../../../../config/utils/style/height_margin.dart';
import '../../../../config/utils/style/padding_style.dart';
import '../widget/sales_ranking_widget.dart';

void showRankingDialog({
  required BuildContext context,
}) {
  showDialog(
    context: context,
    barrierDismissible: true, // Allows dismissal by tapping outside the dialog
    builder: (context) {
      return const RankingDialog();
    },
  );
}

class RankingDialog extends HookConsumerWidget {
  const RankingDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Dialog(
      backgroundColor: ColorStyle.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: SizedBox(
        width: 400,
        height: 600,
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            //クローズボタン
            IconButton(
              onPressed: () {
                context.pop();
              },
              icon: const Icon(
                Icons.close,
                color: ColorStyle.mainGrey,
              ),
            ),
            Column(
              children: [
                HeightMargin.large,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/ranking_icon.png',
                      width: 20,
                      height: 20,
                    ),
                    WidthMargin.small,
                    const Text(
                      '8月の買取総額ランキング',
                      style: TextStyle(
                        fontSize: CustomFontSize.large,
                        fontWeight: FontWeight.bold,
                        color: ColorStyle.mainBlack,
                      ),
                    ),
                    WidthMargin.small,
                    Image.asset(
                      'assets/images/ranking_icon.png',
                      width: 20,
                      height: 20,
                    ),
                  ],
                ),
                HeightMargin.normal,
                Expanded(
                  child: SalesRankingWidget(isDialog: true),
                ),
                HeightMargin.large,
              ],
            ),
          ],
        ),
      ),
    );
  }
}
