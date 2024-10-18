import 'package:admin_car_sales_management/src/common_widgets/table/small_custom_data_table.dart';
import 'package:admin_car_sales_management/src/config/enum/sales_status.dart';
import 'package:admin_car_sales_management/src/features/case/controller/case_controller.dart';
import 'package:admin_car_sales_management/src/features/case/view/component/row_source_data/small_row_source_data.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../../common_widgets/loading_widget.dart';
import '../../../../../config/utils/style/color_style.dart';

class PersonalCaseTabView extends ConsumerWidget {
  const PersonalCaseTabView({
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
      data: (caseList) {
        return SmallCustomDataTable(
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
              label: Text(
                '作成日時',
              ),
              size: ColumnSize.S,
            ),
          ],
          onPageChanged: (value) {},
          //Rowのデータ
          source: SmallRowSourceCaseData(
            context: context,
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
