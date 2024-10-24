import 'package:admin_car_sales_management/src/config/enum/sales_status.dart';
import 'package:admin_car_sales_management/src/config/utils/key/firebase_key.dart';
import 'package:admin_car_sales_management/src/config/utils/style/width_margin.dart';
import 'package:admin_car_sales_management/src/features/case/controller/case_controller.dart';
import 'package:admin_car_sales_management/src/features/employee/data_model/employee.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../config/utils/style/color_style.dart';
import '../../../../common_widgets/show_toast.dart';
import '../../../routing/router_utils.dart';

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
      DataCell(
        Row(
          children: [
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: ColorStyle.blue,
                overlayColor: Colors.transparent,
              ),
              onPressed: () {
                context.goNamed(
                  AppRoute.employeeDetail.name,
                  queryParameters: {
                    FirebaseEmployeesKey.employeeId: employee.employeeId,
                  },
                );
              },
              child: Text(
                employee.employeeName,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  decoration: TextDecoration.underline,
                  color: ColorStyle.blue,
                  fontWeight: FontWeight.bold,
                  decorationThickness: 2.0,
                  decorationColor: ColorStyle.blue,
                ),
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
          return const DataCell(Text(''));
        },
        data: (List schedulingCaseList) {
          return DataCell(
            SizedBox(
              width: 150,
              child: Row(
                children: [
                  WidthMargin.minimum,
                  Text(
                    schedulingCaseList.length.toString(),
                  ),
                ],
              ),
            ),
          );
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
          return const DataCell(Text(''));
        },
        data: (List confirmedVisitCaseList) {
          return DataCell(
            SizedBox(
              width: 150,
              child: Row(
                children: [
                  WidthMargin.minimum,
                  Text(
                    confirmedVisitCaseList.length.toString(),
                  ),
                ],
              ),
            ),
          );
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
          return const DataCell(Text(''));
        },
        data: (List pending) {
          return DataCell(
            SizedBox(
              width: 150,
              child: Row(
                children: [
                  WidthMargin.minimum,
                  Text(
                    pending.length.toString(),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      //成約
      ref
          .watch(
        watchEmployeeCaseListByStatusControllerProvider(
          caseStatus: CaseStatus.success.value,
          employeeId: employee.employeeId,
        ),
      )
          .when(
        error: (error, stackTrace) {
          return const DataCell(Text('⚠️'));
        },
        loading: () {
          return const DataCell(Text(''));
        },
        data: (List successCaseList) {
          return DataCell(
            SizedBox(
              width: 150,
              child: Row(
                children: [
                  WidthMargin.minimum,
                  Text(
                    successCaseList.length.toString(),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      //失注
      ref
          .watch(
        watchEmployeeCaseListByStatusControllerProvider(
          caseStatus: CaseStatus.lost.value,
          employeeId: employee.employeeId,
        ),
      )
          .when(
        error: (error, stackTrace) {
          return const DataCell(Text('⚠️'));
        },
        loading: () {
          return const DataCell(Text(''));
        },
        data: (List lostCaseList) {
          return DataCell(
            SizedBox(
              width: 150,
              child: Row(
                children: [
                  WidthMargin.minimum,
                  Text(
                    lostCaseList.length.toString(),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      //成約率
      ref
          .watch(
        watchEmployeeCaseListByStatusControllerProvider(
          caseStatus: CaseStatus.success.value,
          employeeId: employee.employeeId,
        ),
      )
          .when(
        error: (error, stackTrace) {
          return const DataCell(Text('⚠️'));
        },
        loading: () {
          return const DataCell(Text(''));
        },
        data: (List successCaseList) {
          return ref
              .watch(
            watchEmployeeCaseListByStatusControllerProvider(
              caseStatus: CaseStatus.lost.value,
              employeeId: employee.employeeId,
            ),
          )
              .when(
            error: (error, stackTrace) {
              return const DataCell(Text('⚠️'));
            },
            loading: () {
              return const DataCell(Text(''));
            },
            data: (List lostCaseList) {
              final totalCases = successCaseList.length + lostCaseList.length;
              final successRate = totalCases > 0
                  ? (successCaseList.length / totalCases * 100)
                      .toStringAsFixed(1)
                  : '0.0';

              return DataCell(
                SizedBox(
                  width: 150,
                  child: Row(
                    children: [
                      WidthMargin.minimum,
                      Text('$successRate%'),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    ],
  );
}
