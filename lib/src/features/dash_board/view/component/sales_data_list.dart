import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../config/utils/style/color_style.dart';
import '../../../../config/utils/style/padding_style.dart';
import '../../../../function/get_last_twelve_months.dart';
import 'sales_data_text.dart';
import 'sales_header_tile.dart';

class SalesDataList extends ConsumerWidget {
  const SalesDataList({
    super.key,
    required this.successSalesCountList,
    required this.lostSalesCountList,
  });

  final List<double?> successSalesCountList;
  final List<double?> lostSalesCountList;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<String> monthList = getLastTwelveMonths();
    int maxLength = [successSalesCountList.length, lostSalesCountList.length]
        .reduce((a, b) => a < b ? a : b);

    return Column(
      children: [
        const SalesHeaderTile(),
        Expanded(
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(), //スクロールなし
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
            ),
            itemCount: maxLength, // 最短のリストの長さを設定
            itemBuilder: (context, index) {
              // successとlostの要素を取得
              final successCount = successSalesCountList[index] ?? 0;
              final lostCount = lostSalesCountList[index] ?? 0;
              final month = monthList[index];

              // 成約率の計算
              final totalCount = successCount + lostCount;
              final conversionRate =
                  totalCount > 0 ? (successCount / totalCount) * 100 : 0;

              return Padding(
                padding: PaddingStyle.minimum,
                child: Container(
                  decoration: BoxDecoration(
                    color: ColorStyle.paleBlue,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 4.0,
                    ),
                    child: Row(
                      children: [
                        // その月を表示
                        SalesDataText(
                          title: month,
                          textColor: ColorStyle.mainBlack,
                        ),
                        // successCountを表示
                        SalesDataText(
                          title: successCount.toStringAsFixed(0),
                          textColor: ColorStyle.mainBlack,
                        ),
                        // lostCountを表示
                        SalesDataText(
                          title: lostCount.toStringAsFixed(0),
                          textColor: ColorStyle.mainBlack,
                        ),
                        // 成約率を表示
                        SalesDataText(
                          title: '${conversionRate.toStringAsFixed(0)}%',
                          textColor: ColorStyle.mainBlack,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
