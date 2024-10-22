import 'package:admin_car_sales_management/src/features/case/controller/case_controller.dart';
import 'package:admin_car_sales_management/src/features/case/view/component/row_source_data/row_source_case_data.dart';
import 'package:admin_car_sales_management/src/features/case/view/component/tab/all_case_tab_view.dart';
import 'package:admin_car_sales_management/src/features/employee/controller/employee_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../../common_widgets/table/custom_data_table.dart';
import '../../../../employee/data_model/employee.dart';
import '../../../data_model/case.dart';

class AllCaseTabViewSearchTypeEmployeeName extends HookConsumerWidget {
  const AllCaseTabViewSearchTypeEmployeeName({
    super.key,
    required this.searchWord,
  });
  final ValueNotifier<String> searchWord;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ValueNotifier<List<Employee>> allEmployeeList = useState([]);
    final ValueNotifier<List<Employee>> searchEmployeeList = useState([]);
    final ValueNotifier<List<Case>> searchedCaseList = useState([]);
    final ValueNotifier<bool> isLoading = useState(false);

    useEffect(
      () {
        Future(() async {
          isLoading.value = true;

          //0️⃣まず全ての案件（担当者未定含む）を取得
          final allCases = await ref
              .read(caseControllerProvider.notifier)
              .getCaseListOfFourStatus();

          if (searchWord.value.isEmpty) {
            // 検索ワードが空の場合は、担当者未定含む全ての案件を表示する。
            searchedCaseList.value = allCases;
            isLoading.value = false;
            return;
          }
          //1️⃣従業員名に当てはまる従業員リストを取得する
          allEmployeeList.value = await ref
              .read(employeeControllerProvider.notifier)
              .getAllEmployeeList();

          searchEmployeeList.value = ref
              .read(employeeControllerProvider.notifier)
              .searchEmployeeBySearchWord(
                employeeList: allEmployeeList.value,
                searchWord: searchWord.value,
              );

          //2️⃣従業員リストから、一人ずつの案件リストを取得する。
          allCases.clear();

          for (Employee employee in searchEmployeeList.value) {
            final employeeCaseList = await ref
                .read(caseControllerProvider.notifier)
                .getEmployeeCaseListOfActiveStatus(
                  employeeId: employee.employeeId,
                );
            allCases.addAll(employeeCaseList);
          }
          // 一人ずつの案件リストを、全ての案件リストに追加
          searchedCaseList.value = allCases;
          isLoading.value = false;
        });
        return null;
      },
      [
        searchWord.value,
      ],
    );

    return CustomDataTable(
      columns: dataColumns,
      onPageChanged: (value) {},
      //Rowのデータ
      source: RowSourceCaseData(
        context: context,
        //カウント
        count: searchedCaseList.value.length,
        caseList: searchedCaseList.value,
        ref: ref,
      ),
    );
  }
}




// import 'package:admin_car_sales_management/src/features/case/controller/case_controller.dart';
// import 'package:admin_car_sales_management/src/features/case/view/component/row_source_data/row_source_case_data.dart';
// import 'package:admin_car_sales_management/src/features/case/view/component/tab/all_case_tab_view.dart';
// import 'package:admin_car_sales_management/src/features/employee/controller/employee_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import '../../../../../common_widgets/table/custom_data_table.dart';
// import '../../../../employee/data_model/employee.dart';
// import '../../../data_model/case.dart';

// class AllCaseTabViewSearchTypeEmployeeName extends HookConsumerWidget {
//   const AllCaseTabViewSearchTypeEmployeeName({
//     super.key,
//     required this.searchWord,
//   });
//   final ValueNotifier<String> searchWord;

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final ValueNotifier<List<Employee>> allEmployeeList = useState([]);
//     final ValueNotifier<List<Employee>> searchEmployeeList = useState([]);
//     final ValueNotifier<List<Case>> searchedCaseList = useState([]);
//     final ValueNotifier<bool> isLoading = useState(false);

//     useEffect(
//       () {
//         Future(() async {
//           isLoading.value = true;
          
//           // 1️⃣ まず全ての案件を取得
//           final allCases = await ref
//               .read(caseControllerProvider.notifier)
//               .getCaseListOfFourStatus();
              
//           if (searchWord.value.isEmpty) {
//             // 検索ワードが空の場合は全ての案件を表示
//             searchedCaseList.value = allCases;
//             isLoading.value = false;
//             return;
//           }

//           // 2️⃣ 検索ワードがある場合は従業員名での検索を実行
//           allEmployeeList.value = await ref
//               .read(employeeControllerProvider.notifier)
//               .getAllEmployeeList();

//           searchEmployeeList.value = ref
//               .read(employeeControllerProvider.notifier)
//               .searchEmployeeBySearchWord(
//                 employeeList: allEmployeeList.value,
//                 searchWord: searchWord.value,
//               );

//           // 3️⃣ 検索された従業員に関連する案件をフィルタリング
//           final employeeIds = searchEmployeeList.value.map((e) => e.employeeId).toSet();
//           searchedCaseList.value = allCases.where((caseItem) {
//             // 担当者IDがnullの場合はfalseを返し、フィルタリングから除外
//             if (caseItem.employeeId == null) return false;
//             return employeeIds.contains(caseItem.employeeId);
//           }).toList();
          
//           isLoading.value = false;
//         });
//         return null;
//       },
//       [searchWord.value],
//     );

//     return isLoading.value
//         ? const Center(child: CircularProgressIndicator())
//         : CustomDataTable(
//             columns: dataColumns,
//             onPageChanged: (value) {},
//             source: RowSourceCaseData(
//               context: context,
//               count: searchedCaseList.value.length,
//               caseList: searchedCaseList.value,
//               ref: ref,
//             ),
//           );
//   }
// }