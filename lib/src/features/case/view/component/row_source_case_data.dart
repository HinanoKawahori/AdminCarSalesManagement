import 'package:admin_car_sales_management/src/features/employee/controller/employee_controller.dart';
import 'package:admin_car_sales_management/src/function/switch_data.dart';
import 'package:admin_car_sales_management/src/function/timestamp_converter.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../data_model/case.dart';

class RowSourceCaseData extends DataTableSource {
  final BuildContext context;
  final List<Case> caseList;
  final int count;
  final WidgetRef ref;
  RowSourceCaseData({
    required this.context,
    required this.caseList,
    required this.count,
    required this.ref,
  });

  @override
  DataRow? getRow(int index) {
    if (index < rowCount) {
      return recentFileDataRow(
        caseList[index],
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
  Case caseData,
  BuildContext context,
  WidgetRef ref,
) {
  return DataRow(
    cells: [
      //顧客名
      DataCell(
        Text(
          caseData.customerName,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      //ステータス
      DataCell(
        Text(
          //TODO
          getStatusText(caseData.caseStatus!),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      //担当者
      ref
          .watch(watchEmployeeDataControllerProvider(
              employeeId: caseData.assignedEmployeeId))
          .when(
        error: (error, stackTrace) {
          return const DataCell(Text('⚠️'));
        },
        loading: () {
          return const DataCell(Text(''));
        },
        data: (employee) {
          if (employee == null) {
            return const DataCell(Text('⚠️'));
          }
          return DataCell(
            Text(
              employee.employeeName,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          );
        },
      ),
      //買取金額
      DataCell(
        Text(
          caseData.carPrice.toString(),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      //顧客電話番号
      DataCell(
        Text(
          caseData.customerPhoneNumber.toString(),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      //作成日時
      DataCell(
        Text(
          createDateText(caseData.createdAt),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      //最終更新日時
      DataCell(
        Text(
          createDateText(caseData.updatedAt),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    ],
  );
}
