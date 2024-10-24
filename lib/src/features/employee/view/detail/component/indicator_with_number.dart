import 'package:flutter/material.dart';

import '../../../../../config/utils/style/width_margin.dart';

class IndicatorWithNumber extends StatelessWidget {
  const IndicatorWithNumber({
    super.key,
    required this.color,
    required this.label,
    required this.count,
  });
  final Color color;
  final String label;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: color,
          ),
        ),
        WidthMargin.small,
        Text('$label $count件'),
      ],
    );
  }
}
