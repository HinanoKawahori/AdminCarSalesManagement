import 'package:admin_car_sales_management/src/common_widgets/blud_gradation_button.dart';
import 'package:admin_car_sales_management/src/common_widgets/loading_widget.dart';
import 'package:admin_car_sales_management/src/features/employee/controller/employee_controller.dart';
import 'package:admin_car_sales_management/src/features/employee/data_model/employee.dart';
import 'package:admin_car_sales_management/src/features/routing/router_utils.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../common_widgets/table/custom_data_table.dart';
import 'row_source_employee_data.dart';
import '../../../../config/utils/style/color_style.dart';
import '../../../../config/utils/style/custom_font_style.dart';
import '../../../../config/utils/style/height_margin.dart';
import 'employee_search_text_form_field.dart';

class EmployeeListView extends HookConsumerWidget {
  const EmployeeListView({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ValueNotifier<List<Employee>> searchEmployeeList = useState([]);
    final TextEditingController searchController = useTextEditingController();

    return ref.watch(watchAllEmployeeDataControllerProvider).when(
      error: (error, stackTrace) {
        return ErrorWidget('データがありません');
      },
      loading: () {
        return const LoadingWidget(color: ColorStyle.blue);
      },
      data: (List<Employee> employeeList) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  '従業員一覧',
                  style: TextStyle(
                    fontSize: CustomFontSize.largest,
                    color: ColorStyle.mainBlack,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                //🔍検索テキストフォームフィールド
                EmployeeSearchTextFormField(
                  employeeList: employeeList,
                  searchEmployeeList: searchEmployeeList,
                  searchController: searchController,
                ),

                //➕従業員新規登録ボタン
                BlueGradationButton(
                  onPressed: () {
                    context.goNamed(AppRoute.addEmployee.name);
                  },
                  title: '＋従業員新規追加',
                ),
              ],
            ),
            HeightMargin.normal,
            Expanded(
              child: CustomDataTable(
                columns: const [
                  DataColumn2(
                    label: Padding(
                      padding: EdgeInsets.only(left: 12),
                      child: Text(
                        '従業員名',
                      ),
                    ),
                    size: ColumnSize.S,
                  ),
                  DataColumn2(
                    fixedWidth: 150,
                    label: Text('日程調整中'),
                    size: ColumnSize.S,
                  ),
                  DataColumn2(
                    fixedWidth: 150,
                    label: Text('訪問日確定'),
                  ),
                  DataColumn2(
                    fixedWidth: 150,
                    label: Text(
                      '検討待ち',
                    ),
                    size: ColumnSize.S,
                  ),
                  DataColumn2(
                    fixedWidth: 150,
                    label: Text(
                      '成約',
                    ),
                    size: ColumnSize.S,
                  ),
                  DataColumn2(
                    fixedWidth: 150,
                    label: Text(
                      '失注',
                    ),
                    size: ColumnSize.S,
                  ),
                  DataColumn2(
                    fixedWidth: 150,
                    label: Text(
                      '成約率',
                    ),
                    size: ColumnSize.S,
                  ),
                ],
                onPageChanged: (value) {},
                //Rowのデータ
                //valueが更新されるタイミングで再描画されてRowDataも変わる。
                source: RowSourceEmployeeData(
                  context: context,
                  count: (searchController.text.trim().isNotEmpty)
                      ? searchEmployeeList.value.length
                      : employeeList.length,
                  employeeList: (searchController.text.trim().isNotEmpty)
                      ? searchEmployeeList.value
                      : employeeList,
                  ref: ref,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
