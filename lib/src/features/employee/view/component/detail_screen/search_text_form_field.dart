import 'package:admin_car_sales_management/src/features/employee/controller/employee_controller.dart';
import 'package:admin_car_sales_management/src/features/employee/data_model/employee.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../../config/utils/style/color_style.dart';
import '../../../../../config/utils/style/custom_font_style.dart';

class SearchTextFormField extends HookConsumerWidget {
  final List<Employee> employeeList;
  final ValueNotifier<List<Employee>> searchEmployeeList;
  final TextEditingController searchController;

  const SearchTextFormField({
    super.key,
    required this.employeeList,
    required this.searchEmployeeList,
    required this.searchController,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: 350,
      child: TextFormField(
        controller: searchController,
        cursorColor: ColorStyle.mainBlack,
        cursorHeight: 17,
        onFieldSubmitted: (value) async {
          //employeeListの内容を更新する
          searchEmployeeList.value =
              ref.read(employeeControllerProvider.notifier).searchEmployee(
                    employeeList: employeeList,
                    searchController: searchController,
                  );
        },
        decoration: InputDecoration(
          fillColor: ColorStyle.white,
          filled: true,
          hoverColor: ColorStyle.white,
          contentPadding: const EdgeInsets.only(left: 20),
          suffixIcon: SizedBox(
            width: 80,
            child: Row(
              children: [
                //
                IconButton(
                  icon: const Icon(
                    Icons.search,
                    size: 20,
                    color: ColorStyle.mainBlack,
                  ),
                  onPressed: () {
                    searchEmployeeList.value = ref
                        .read(employeeControllerProvider.notifier)
                        .searchEmployee(
                          employeeList: employeeList,
                          searchController: searchController,
                        );
                  },
                ),
                IconButton(
                  icon: const Icon(
                    Icons.clear,
                    size: 20,
                    color: ColorStyle.mainBlack,
                  ),
                  onPressed: () {
                    searchController.clear();
                    searchEmployeeList.value = employeeList;
                  },
                ),
              ],
            ),
          ),
          // 選択されたときの枠線の色
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: ColorStyle.mainWhite,
            ),
            borderRadius: BorderRadius.circular(10),
          ),

          // 選択されていないときの枠線の色
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: ColorStyle.mainWhite,
            ),
            borderRadius: BorderRadius.circular(10),
          ),

          //エラー時の枠線の色
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: ColorStyle.validationRed,
            ),
            borderRadius: BorderRadius.circular(10),
          ),

          //エラー時にフォーカスされたときの枠線の色
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: ColorStyle.validationRed,
            ),
            borderRadius: BorderRadius.circular(10),
          ),

          hintText: '従業員名で探す',
          hintStyle: const TextStyle(
            color: ColorStyle.mainGrey,
            fontSize: CustomFontSize.small,
          ),
        ),
      ),
    );
  }
}
