import 'package:admin_car_sales_management/src/config/enum/sales_status.dart';
import 'package:admin_car_sales_management/src/features/case/controller/case_controller.dart';
import 'package:admin_car_sales_management/src/features/case/view/component/row_source_data/row_source_case_data.dart';
import 'package:admin_car_sales_management/src/features/case/view/component/tab/all_case_tab_view.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../common_widgets/loading_widget.dart';
import '../../../../../common_widgets/table/custom_data_table.dart';
import '../../../../../config/utils/style/color_style.dart';
import '../../../data_model/case.dart';

class CaseTabView extends HookConsumerWidget {
  const CaseTabView({
    super.key,
    required this.caseStatus,
    required this.searchWord,
  });
  final CaseStatus caseStatus;
  final ValueNotifier<String> searchWord;

  //TODO searchWordがあれば、searchWordProviderでsearchListを返す。

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref
        .watch(watchCaseListOfThisStatusControllerProvider(
            caseStatus: caseStatus.value))
        .when(
      data: (List<Case> caseList) {
        return CustomDataTable(
          columns: dataColumns,
          onPageChanged: (value) {},
          //Rowのデータ
          source: RowSourceCaseData(
            context: context,
            count: (searchWord.value.isNotEmpty)
                ? ref
                    .read(caseControllerProvider.notifier)
                    .searchCase(
                      caseList: caseList,
                      searchWord: searchWord.value,
                    )
                    .length
                : caseList.length,
            //名前
            caseList: (searchWord.value.isNotEmpty)
                ? ref.read(caseControllerProvider.notifier).searchCase(
                      caseList: caseList,
                      searchWord: searchWord.value,
                    )
                : caseList,

            ref: ref,
          ),
        );
      },
      error: (error, stackTrace) {
        return ErrorWidget('データがありません');
      },
      loading: () {
        return const LoadingWidget(color: ColorStyle.blue);
      },
    );
  }
}
