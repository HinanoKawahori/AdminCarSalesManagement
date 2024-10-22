import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../config/utils/style/color_style.dart';
import 'component/employee_list_view.dart';

class EmployeeListPage extends HookConsumerWidget {
  const EmployeeListPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      backgroundColor: ColorStyle.paleBlue,
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: EmployeeListView(),
      ),
    );
  }
}
