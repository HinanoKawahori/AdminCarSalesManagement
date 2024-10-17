import 'package:admin_car_sales_management/src/config/enum/sales_status.dart';
import 'package:admin_car_sales_management/src/features/case/controller/case_controller.dart';
import 'package:admin_car_sales_management/src/features/employee/data_model/employee.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../config/utils/style/color_style.dart';
import '../../features/case/data_model/case.dart';
import '../../features/routing/router_utils.dart';
import '../../function/switch_data.dart';
import '../show_toast.dart';

class RowSourceEmployeeData extends DataTableSource {
  final BuildContext context;
  final List<Employee> employeeList;
  final int count;
  final WidgetRef ref;
  RowSourceEmployeeData({
    required this.context,
    required this.employeeList,
    required this.count,
    required this.ref,
  });

  @override
  DataRow? getRow(int index) {
    if (index < rowCount) {
      return recentFileDataRow(
        employeeList[index],
        context,
        ref,
      );
    } else {
      return null;
    }
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => count;

  @override
  int get selectedRowCount => 0;
}

DataRow recentFileDataRow(
  Employee employee,
  BuildContext context,
  WidgetRef ref,
) {
  return DataRow(
    cells: [
      //TODO 12個のデータ項目
      //従業員ID
      DataCell(
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                context.goNamed(
                  AppRoute.addEmployee.name,
                  queryParameters: {'employeeId': employee.employeeId},
                );
              },
              child: SizedBox(
                width: 80,
                child: Text(
                  employee.employeeId,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: ColorStyle.link,
                    decoration: TextDecoration.underline,
                    decorationColor: ColorStyle.link,
                  ),
                ),
              ),
            ),
            Tooltip(
              message: 'コピー',
              child: IconButton(
                onPressed: () {
                  Clipboard.setData(ClipboardData(text: employee.employeeId));
                  showToast(toastMessage: '従業員IDをコピーしました');
                },
                icon: const Icon(
                  Icons.copy,
                  color: ColorStyle.link,
                  size: 16,
                ),
              ),
            )
          ],
        ),
      ),
      //従業員名
      DataCell(
        Row(
          children: [
            SizedBox(
              width: 80,
              child: Text(
                employee.employeeName,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Tooltip(
              message: 'コピー',
              child: IconButton(
                onPressed: () {
                  Clipboard.setData(ClipboardData(text: employee.employeeName));
                  showToast(toastMessage: '従業員の名前をコピーしました！');
                },
                icon: const Icon(
                  Icons.copy,
                  color: ColorStyle.mainBlack,
                  size: 16,
                ),
              ),
            )
          ],
        ),
      ),
      //役割
      DataCell(Text(switchRoleToString(employee.role))),
      //メールアドレス
      DataCell(
        Row(
          children: [
            SizedBox(
              width: 80,
              child: Text(
                employee.email,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Tooltip(
              message: 'コピー',
              child: IconButton(
                onPressed: () {
                  Clipboard.setData(ClipboardData(text: employee.email));
                  showToast(toastMessage: 'メールアドレスをコピーしました！');
                },
                icon: const Icon(
                  Icons.copy,
                  size: 16,
                ),
                color: ColorStyle.mainBlack,
              ),
            )
          ],
        ),
      ),
      //すべて
      ref
          .watch(
        watchEmployeeCaseListOfActiveStatusControllerProvider(
          employeeId: employee.employeeId,
        ),
      )
          .when(
        error: (error, stackTrace) {
          return const DataCell(Text('⚠️'));
        },
        loading: () {
          return const DataCell(Text('🌀'));
        },
        data: (List<Case> activeCaseList) {
          if (activeCaseList.isEmpty) {
            return const DataCell(Text('0'));
          }
          return DataCell(Text(activeCaseList.length.toString()));
        },
      ),
      //日程調整中
      ref
          .watch(
        watchEmployeeCaseListByStatusControllerProvider(
          caseStatus: CaseStatus.scheduling.value,
          employeeId: employee.employeeId,
        ),
      )
          .when(
        error: (error, stackTrace) {
          return const DataCell(Text('⚠️'));
        },
        loading: () {
          return const DataCell(Text('🌀'));
        },
        data: (List schedulingCaseList) {
          if (schedulingCaseList.isEmpty) {
            return const DataCell(Text('error'));
          }
          return DataCell(Text(schedulingCaseList.length.toString()));
        },
      ),
      //訪問待ち
      ref
          .watch(
        watchEmployeeCaseListByStatusControllerProvider(
          caseStatus: CaseStatus.confirmedVisit.value,
          employeeId: employee.employeeId,
        ),
      )
          .when(
        error: (error, stackTrace) {
          return const DataCell(Text('⚠️'));
        },
        loading: () {
          return const DataCell(Text('🌀'));
        },
        data: (List confirmedVisitCaseList) {
          if (confirmedVisitCaseList.isEmpty) {
            return const DataCell(Text('0'));
          }
          return DataCell(Text(confirmedVisitCaseList.length.toString()));
        },
      ),
      //検討中
      ref
          .watch(
        watchEmployeeCaseListByStatusControllerProvider(
          caseStatus: CaseStatus.pending.value,
          employeeId: employee.employeeId,
        ),
      )
          .when(
        error: (error, stackTrace) {
          return const DataCell(Text('⚠️'));
        },
        loading: () {
          return const DataCell(Text('🌀'));
        },
        data: (List pending) {
          if (pending.isEmpty) {
            return const DataCell(Text('0'));
          }
          return DataCell(Text(pending.length.toString()));
        },
      ),

      //TODO 相談　成約率
      const DataCell(Text('0%')),
      //作成日時
      DataCell(Text(switchDateText(employee.createdAt))),
      //更新日時
      DataCell(Text(switchDateText(employee.updatedAt))),
      //TODO　相談　買取合計金額(１年間での合計金額にする？)
      DataCell(Text(switchDateText(employee.createdAt))),
    ],
  );
}
