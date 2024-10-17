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
import 'detail_screen/search_text_form_field.dart';

class EmployeeListView extends HookConsumerWidget {
  const EmployeeListView({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ValueNotifier<List<Employee>> userList = useState([]);
    final ValueNotifier<List<Employee>> searchUserList = useState([]);
    final TextEditingController searchController = useTextEditingController();
    final ValueNotifier<bool> isLoading = useState(false);

    useEffect(() {
      Future(() async {
        isLoading.value = true;
        //全従業員の取得
        userList.value = await ref
            .read(employeeControllerProvider.notifier)
            .getAllEmployeeList();
        //検索結果のemployeeListを更新
        searchUserList.value = userList.value;

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
              '従業員一覧',
              style: TextStyle(
                fontSize: CustomFontSize.large,
                color: ColorStyle.mainBlack,
                fontWeight: FontWeight.bold,
              ),
            ),
            WidthMargin.large,
            //🔍検索テキストフォームフィールド
            SearchTextFormField(
              employeeList: userList.value,
              searchEmployeeList: searchUserList,
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
                  count: searchUserList.value.length,
                  employeeList: searchUserList.value,
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
