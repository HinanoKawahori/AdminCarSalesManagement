import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../component/sales_bar_chart.dart';

class CaseResultBarChartWidget extends HookConsumerWidget {
  const CaseResultBarChartWidget({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final saleSumList = [
      16000000.0,
      20000000.0,
      20000000.0,
      10000000.0,
      20000000.0,
      7000000.0,
      20000000.0,
      20000000.0,
      8000000.0,
      9000000.0,
      12000000.0,
      11000000.0,
    ];
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SalesBarChart(
          salesSumList: saleSumList,
        ),
      ),
    );
  }
}
