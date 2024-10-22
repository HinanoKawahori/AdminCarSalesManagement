import 'package:admin_car_sales_management/src/features/employee/view/add_or_edit/add_or_edit_employee_page.dart';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AddEmployeePage extends HookConsumerWidget {
  const AddEmployeePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      body: AddOrEditEmployeePage(),
    );
  }
}
