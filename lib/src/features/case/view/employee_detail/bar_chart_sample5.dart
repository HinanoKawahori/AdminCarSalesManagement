import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BarChartSample5 extends StatefulWidget {
  const BarChartSample5({super.key});

  @override
  State<StatefulWidget> createState() => BarChartSample5State();
}

class BarChartSample5State extends State<BarChartSample5> {
  static const double barWidth = 22;
  static const mainItem = [2.0, 3.0, 2.5, 8.0]; // 月曜のデータのみ
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.5,
      child: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: BarChart(
          BarChartData(
            alignment: BarChartAlignment.center,
            maxY: 10,
            minY: 0,
            groupsSpace: 12,
            barTouchData: BarTouchData(
              handleBuiltInTouches: false,
              touchCallback: (FlTouchEvent event, barTouchResponse) {
                if (!event.isInterestedForInteractions ||
                    barTouchResponse == null ||
                    barTouchResponse.spot == null) {
                  setState(() {
                    touchedIndex = -1;
                  });
                  return;
                }
                setState(() {
                  touchedIndex = barTouchResponse.spot!.touchedBarGroupIndex;
                });
              },
            ),
            titlesData: const FlTitlesData(
              show: true,
              topTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: false, // 上のタイトル非表示
                ),
              ),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: false, // 下のタイトル非表示
                ),
              ),
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: false, // 左のタイトル非表示
                ),
              ),
              rightTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: false, // 右のタイトル非表示
                ),
              ),
            ),
            gridData: FlGridData(
              show: false,
              checkToShowHorizontalLine: (value) => value % 2 == 0,
              getDrawingHorizontalLine: (value) {
                return FlLine(
                  color: Colors.grey.withOpacity(0.3),
                  strokeWidth: 1,
                );
              },
            ),
            borderData: FlBorderData(
              show: false,
            ),
            barGroups: [
              BarChartGroupData(
                x: 0, // 月曜のみのグラフ
                barRods: [
                  BarChartRodData(
                    toY: mainItem[0],
                    width: barWidth,
                    borderRadius: const BorderRadius.all(Radius.circular(6)),
                    color: Colors.blue,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
