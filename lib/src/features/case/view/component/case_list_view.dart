import 'package:admin_car_sales_management/src/features/case/controller/case_controller.dart';
import 'package:admin_car_sales_management/src/features/employee/controller/employee_controller.dart';
import 'package:admin_car_sales_management/src/features/employee/data_model/employee.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../common_widgets/table/custom_data_table.dart';
import '../../../../common_widgets/table/row_source_employee_data.dart';
import '../../../../config/utils/style/color_style.dart';
import '../../../../config/utils/style/custom_font_style.dart';
import '../../../../config/utils/style/height_margin.dart';
import '../../../../config/utils/style/width_margin.dart';
import '../../../employee/view/component/detail_screen/search_text_form_field.dart';

class CaseListView extends HookConsumerWidget {
  const CaseListView({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ValueNotifier<List<Employee>> caseList = useState([]);
    final ValueNotifier<List<Employee>> searchCaseList = useState([]);
    final TextEditingController searchController = useTextEditingController();
    final ValueNotifier<bool> isLoading = useState(false);

    useEffect(() {
      Future(() async {
        isLoading.value = true;
        //TODO 全caseの取得
        // userList.value = await ref
        // .read(caseControllerProvider.notifier)
        // .getallcase();
        //検索結果のemployeeListを更新
        searchCaseList.value = caseList.value;

        isLoading.value = false;
      });
      return null;
    }, []);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              '案件一覧',
              style: TextStyle(
                fontSize: CustomFontSize.large,
                color: ColorStyle.mainBlack,
                fontWeight: FontWeight.bold,
              ),
            ),
            WidthMargin.large,
            //TODO
            SearchTextFormField(
              employeeList: caseList.value,
              searchEmployeeList: searchCaseList,
              searchController: searchController,
            ),
          ],
        ),
        HeightMargin.normal,
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SizedBox(
              width: 2000,
              child: CustomDataTable(
                columns: const [
                  DataColumn2(
                    label: Text(
                      '従業員ID',
                    ),
                    size: ColumnSize.S,
                  ),
                  DataColumn2(
                    label: Text(
                      '従業員名',
                    ),
                    size: ColumnSize.S,
                  ),
                  DataColumn2(
                    label: Text(
                      '役割',
                    ),
                    size: ColumnSize.S,
                  ),
                  DataColumn2(
                    label: Text(
                      'メールアドレス',
                    ),
                    size: ColumnSize.S,
                  ),
                  DataColumn2(
                    label: Text(
                      'すべて',
                    ),
                    size: ColumnSize.S,
                  ),
                  DataColumn2(
                    label: Text('日程調整中'),
                    size: ColumnSize.S,
                  ),
                  DataColumn2(
                    label: Text('訪問日確定'),
                  ),
                  DataColumn2(
                    label: Text(
                      '検討待ち',
                    ),
                    size: ColumnSize.S,
                  ),
                  DataColumn2(
                    label: Text(
                      '成約率',
                    ),
                    size: ColumnSize.S,
                  ),
                  DataColumn2(
                    label: Text(
                      '作成日時',
                    ),
                    size: ColumnSize.S,
                  ),
                  DataColumn2(
                    label: Text(
                      '更新日時',
                    ),
                    size: ColumnSize.S,
                  ),
                  DataColumn2(
                    label: Text(
                      '買取合計金額',
                    ),
                    size: ColumnSize.S,
                  ),
                ],
                onPageChanged: (value) {},
                source: RowSourceEmployeeData(
                  context: context,
                  count: caseList.value.length,
                  employeeList: caseList.value,
                  ref: ref,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
