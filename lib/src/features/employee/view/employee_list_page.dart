import 'package:admin_car_sales_management/src/common_widgets/custom_floating_action_button.dart';
import 'package:admin_car_sales_management/src/features/routing/router_utils.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../config/utils/style/color_style.dart';
import 'component/employee_list_view.dart';

class EmployeeListPage extends HookConsumerWidget {
  const EmployeeListPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: ColorStyle.paleBlue,
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: EmployeeListView(),
      ),
      floatingActionButton: CustomFloatingActionButton(
        onPressed: () {
          context.goNamed(AppRoute.addEmployee.name);
        },
      ),
    );
  }
}
