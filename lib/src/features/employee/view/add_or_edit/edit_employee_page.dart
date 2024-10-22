import 'package:admin_car_sales_management/src/features/employee/view/add_or_edit/add_or_edit_employee_page.dart';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class EditEmployeePage extends HookConsumerWidget {
  const EditEmployeePage({super.key, this.employeeId});

  final String? employeeId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: AddOrEditEmployeePage(employeeId: employeeId),
    );
  }
}
