import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../config/utils/style/color_style.dart';
import '../../../../config/utils/style/custom_font_style.dart';
import '../../../../function/get_last_twelve_months.dart';

class SalesBarChart extends HookConsumerWidget {
  const SalesBarChart({
    super.key,
    required this.salesSumList,
  });
  final List<double?> salesSumList;

  final Color barBackgroundColor = ColorStyle.mainGrey;
  final Color barColor = ColorStyle.blue;

  // salesSumList の中の要素の最大値を取得する
  double getMaxSum(List<double?> salesSumList) {
    if (salesSumList.isEmpty) return 0;
    final maxSum = salesSumList
        .where((e) => e != null)
        .map((e) => e!)
        .reduce((current, next) => current > next ? current : next);
    return maxSum;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final maxSum = getMaxSum(salesSumList); // 最大値を取得

    final adjustedMaxY = maxSum == 0 ? 2000000 : maxSum; // 0 の場合 2000000 にする

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: BarChart(
              specificData(
                salesSumList: salesSumList,
                maxY: adjustedMaxY.toDouble(),
              ), // maxY を渡す
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 4),
            child: Text(
              '(月)',
              style: TextStyle(
                color: ColorStyle.mainGrey,
                fontWeight: FontWeight.bold,
                fontSize: 10,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // グラフのデザイン
  BarChartGroupData makeGroupData(int x, double y) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y,
          gradient: const LinearGradient(
            colors: ColorStyle.blueGradation,
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
          ),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(3),
            topRight: Radius.circular(3),
          ),
          width: 13,
        ),
      ],
    );
  }

  // 下サイドバーの単位
  Widget getBottomTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: ColorStyle.mainGrey,
      fontWeight: FontWeight.bold,
      fontSize: 10,
    );
    List<String> months = getLastTwelveMonths().reversed.toList();
    Widget text = Text(
      months[value.toInt()],
      style: style,
    );
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 16,
      child: text,
    );
  }

// 左サイドバー
  Widget getLeftTitles(double value, TitleMeta meta, double maxY) {
    const style = TextStyle(
      color: ColorStyle.mainGrey,
      fontWeight: FontWeight.bold,
      fontSize: 8,
    );

    //数字にカンマを入れるフォーマッターを作成
    final formatter = NumberFormat('#,##0');

    final halfMaxY = maxY / 2;

    Widget text;
    if (value == 0) {
      text = Text(formatter.format(0), style: style); // 0にカンマは必要ないですがフォーマット
    } else if ((value - maxY).abs() < 1) {
      // maxY とほぼ等しい
      text = Text(formatter.format(maxY), style: style);
    } else if ((value - halfMaxY).abs() < 1) {
      // halfMaxY とほぼ等しい
      text = Text(formatter.format(halfMaxY), style: style);
    } else {
      return Container();
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 8,
      child: text,
    );
  }

  // グラフのデータ
  BarChartData specificData({
    required List<double?> salesSumList,
    required double maxY, // maxY を追加
  }) {
    List<double?> data = salesSumList.reversed.toList();
    List<String> months = getLastTwelveMonths();
    const successRate = 20;
    // 月のリストを適切な順序に並び替える
    months = months.reversed.toList();
    final formatter = NumberFormat('#,###');

    return BarChartData(
      maxY: maxY, // maxY を設定

      barTouchData: BarTouchData(
        enabled: true,
        //ツールチップのデザイン
        touchTooltipData: BarTouchTooltipData(
          tooltipPadding: const EdgeInsets.only(
            top: 4.0,
            right: 8.0,
            left: 4.0,
          ),
          getTooltipColor: (group) {
            return ColorStyle.mainBlack.withOpacity(0.8);
          },
          getTooltipItem: (group, groupIndex, rod, rodIndex) {
            final value = data[group.x.toInt()];
            final month = months[groupIndex];
            return BarTooltipItem(
              value != null
                  ? '$month月：${formatter.format(value.round())}円\n成約率：$successRate%'
                  : '$month月：0円\n成約率：0%',
              const TextStyle(
                color: ColorStyle.white,
                fontSize: CustomFontSize.small,
              ),
            );
          },
        ),
      ),

      titlesData: FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: getBottomTitles,
            reservedSize: 30,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            getTitlesWidget: (value, meta) =>
                getLeftTitles(value, meta, maxY), // maxY を渡す
            reservedSize: 50,
            showTitles: true,
            interval: maxY / 2, // この行を追加
          ),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      barGroups: List.generate(
        data.length,
        (i) {
          if (data.isEmpty) {
            return makeGroupData(0, 0);
          }
          return makeGroupData(i, data[i]!);
        },
      ),
      gridData: const FlGridData(show: false),
    );
  }
}
