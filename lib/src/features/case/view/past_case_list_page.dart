import 'package:admin_car_sales_management/src/config/utils/style/padding_style.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../config/utils/style/color_style.dart';
import 'component/case_list_view.dart';

class PastCaseListPage extends HookConsumerWidget {
  const PastCaseListPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      backgroundColor: ColorStyle.paleBlue,
      body: Padding(
        padding: PaddingStyle.normal,
        child: CaseListView(isPast: true),
      ),
    );
  }
}
