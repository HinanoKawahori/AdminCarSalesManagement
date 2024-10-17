import 'package:admin_car_sales_management/src/features/routing/router_utils.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common_widgets/custom_floating_action_button.dart';
import '../../../config/utils/style/color_style.dart';
import 'component/case_list_view.dart';

class CaseListPage extends HookConsumerWidget {
  const CaseListPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: ColorStyle.paleBlue,
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: CaseListView(),
      ),
      floatingActionButton: CustomFloatingActionButton(
        onPressed: () {
          context.goNamed(AppRoute.addOrEditCase.name);
        },
      ),
    );
  }
}
