import 'package:admin_car_sales_management/src/features/dash_board/view/component/pie_chart/case_pie_chart.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CasePieChartWidget extends HookConsumerWidget {
  const CasePieChartWidget({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //TODO データをここから渡すようにする
    return const Scaffold(
      body: CasePieChart(),
    );
  }
}
