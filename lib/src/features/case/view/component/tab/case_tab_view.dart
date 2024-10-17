import 'package:admin_car_sales_management/src/config/enum/sales_status.dart';
import 'package:admin_car_sales_management/src/features/case/controller/case_controller.dart';
import 'package:admin_car_sales_management/src/features/case/view/component/row_source_case_data.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../common_widgets/loading_widget.dart';
import '../../../../../common_widgets/table/custom_data_table.dart';
import '../../../../../config/utils/style/color_style.dart';
import '../../../data_model/case.dart';

class CaseTabView extends ConsumerWidget {
  const CaseTabView({
    super.key,
    required this.caseStatus,
  });
  final CaseStatus caseStatus;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref
        .watch(watchCaseListOfThisStatusControllerProvider(
            caseStatus: caseStatus.value))
        .when(
      data: (List<Case> caseList) {
        return CustomDataTable(
          columns: const [
            DataColumn2(
              label: Text(
                '顧客名',
              ),
              size: ColumnSize.S,
            ),
            DataColumn2(
              fixedWidth: 150,
              label: Text('ステータス'),
              size: ColumnSize.S,
            ),
            DataColumn2(
              fixedWidth: 150,
              label: Text('担当者'),
            ),
            DataColumn2(
              fixedWidth: 150,
              label: Text(
                '買取金額',
              ),
              size: ColumnSize.S,
            ),
            DataColumn2(
              fixedWidth: 150,
              label: Text(
                '顧客電話番号',
              ),
              size: ColumnSize.S,
            ),
            DataColumn2(
              fixedWidth: 150,
              label: Text(
                '作成日時',
              ),
              size: ColumnSize.S,
            ),
            DataColumn2(
              fixedWidth: 150,
              label: Text(
                '最終更新日時',
              ),
              size: ColumnSize.S,
            ),
          ],
          onPageChanged: (value) {},
          //Rowのデータ
          source: RowSourceCaseData(
            context: context,
            // count: (searchController.text.trim().isNotEmpty)
            //     ? caseList.length
            //     : caseList.length,
            count: caseList.length,
            caseList: caseList,
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
