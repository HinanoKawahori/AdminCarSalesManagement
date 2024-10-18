import 'package:admin_car_sales_management/src/config/utils/style/height_margin.dart';
import 'package:admin_car_sales_management/src/config/utils/style/width_margin.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../config/utils/style/color_style.dart';

class CasePieChart extends HookConsumerWidget {
  const CasePieChart({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final touchedIndex = useState(-1);

    List<PieChartSectionData> showingSections() {
      return List.generate(4, (i) {
        final isTouched = i == touchedIndex.value;
        final fontSize = isTouched ? 20.0 : 16.0;
        final radius = isTouched ? 60.0 : 54.0;
        const shadows = [Shadow(color: Colors.black, blurRadius: 2)];
        switch (i) {
          case 0:
            return PieChartSectionData(
              color: ColorStyle.pieChartDarkBlue,
              value: 40,
              title: '40%',
              radius: radius,
              titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: ColorStyle.white,
                shadows: shadows,
              ),
            );
          case 1:
            return PieChartSectionData(
              color: ColorStyle.pieChartMediumBlue,
              value: 30,
              title: '30%',
              radius: radius,
              titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: ColorStyle.white,
                shadows: shadows,
              ),
            );
          case 2:
            return PieChartSectionData(
              color: ColorStyle.pieChartLightBlue,
              value: 15,
              title: '15%',
              radius: radius,
              titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: ColorStyle.white,
                shadows: shadows,
              ),
            );
          case 3:
            return PieChartSectionData(
              color: ColorStyle.pieChartPowderBlue,
              value: 15,
              title: '15%',
              radius: radius,
              titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: ColorStyle.white,
                shadows: shadows,
              ),
            );
          default:
            throw Error();
        }
      });
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          //単位のタイトル//////////////////////////////////////////
          AspectRatio(
            aspectRatio: 1,
            child: PieChart(
              PieChartData(
                pieTouchData: PieTouchData(
                  touchCallback: (FlTouchEvent event, pieTouchResponse) {
                    if (!event.isInterestedForInteractions ||
                        pieTouchResponse == null ||
                        pieTouchResponse.touchedSection == null) {
                      touchedIndex.value = -1;
                      return;
                    }
                    touchedIndex.value =
                        pieTouchResponse.touchedSection!.touchedSectionIndex;
                  },
                ),
                borderData: FlBorderData(
                  show: false,
                ),
                sectionsSpace: 0,
                centerSpaceRadius: 40,
                sections: showingSections(),
              ),
            ),
          ),

          WidthMargin.large,

          //単位のタイトル//////////////////////////////////////////
          const Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Indicator(
                color: ColorStyle.pieChartDarkBlue,
                text: '担当者未定',
                isSquare: true,
              ),
              HeightMargin.small,
              Indicator(
                color: ColorStyle.pieChartMediumBlue,
                text: '日程調整中',
                isSquare: true,
              ),
              HeightMargin.small,
              Indicator(
                color: ColorStyle.pieChartLightBlue,
                text: '訪問日確定',
                isSquare: true,
              ),
              HeightMargin.small,
              Indicator(
                color: ColorStyle.pieChartPowderBlue,
                text: '検討待ち',
                isSquare: true,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Indicator extends StatelessWidget {
  final Color color;
  final String text;
  final bool isSquare;
  final double size;
  final Color textColor;

  const Indicator({
    Key? key,
    required this.color,
    required this.text,
    required this.isSquare,
    this.size = 16,
    this.textColor = const Color(0xff505050),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: isSquare ? BoxShape.rectangle : BoxShape.circle,
            color: color,
          ),
        ),
        const SizedBox(
          width: 4,
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        )
      ],
    );
  }
}
