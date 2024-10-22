import 'package:admin_car_sales_management/src/features/dash_board/view/component/pie_chart/manufacturer_pie_chart.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ManufacturerPieChartWidget extends HookConsumerWidget {
  const ManufacturerPieChartWidget({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      body: ManufacturerPieChart(),
    );
  }
}
