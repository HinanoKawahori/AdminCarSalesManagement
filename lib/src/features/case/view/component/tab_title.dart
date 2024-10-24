import 'package:admin_car_sales_management/src/config/utils/style/padding_style.dart';
import 'package:admin_car_sales_management/src/config/utils/style/width_margin.dart';
import 'package:admin_car_sales_management/src/features/case/controller/case_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../common_widgets/error_text_widget.dart';
import '../../../../config/utils/style/color_style.dart';
import '../../../../config/utils/style/custom_font_style.dart';
import '../../../../function/switch_data.dart';
import '../../data_model/case.dart';

class TabTitle extends ConsumerWidget {
  const TabTitle({
    super.key,
    required this.caseStatus,
  });
  final int caseStatus;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //条件分岐で、個人と全体どちらか分ける
    final caseProvider = (caseStatus != 1)
        ? ref.watch(
            watchCaseListOfThisStatusControllerProvider(caseStatus: caseStatus))
        : ref.watch(watchCaseListOfActiveStatusProvider);

    //ステータス別の案件を取得
    return caseProvider.when(
      error: (error, stackTrace) {
        return const ErrorTextWidget(text: '!');
      },
      loading: () {
        return const SizedBox();
      },
      data: (List<Case?> caseList) {
        return Tab(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //ステータス表示
              Text(
                (caseStatus == 1) ? 'すべて' : getStatusText(caseStatus),
                style: const TextStyle(
                  fontSize: CustomFontSize.small,
                  fontWeight: FontWeight.bold,
                  color: ColorStyle.mainBlack,
                ),
              ),
              WidthMargin.small,
              Padding(
                padding: PaddingStyle.tabNumber,
                child: Center(
                  child: Text(
                    caseList.length.toString(),
                    style: const TextStyle(
                      fontSize: CustomFontSize.small,
                      fontWeight: FontWeight.bold,
                      color: ColorStyle.mainBlack,
                    ),
                  ),
                ),
              ),
              //件数表示
            ],
          ),
        );
      },
    );
  }
}
