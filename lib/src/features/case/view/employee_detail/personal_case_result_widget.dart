import 'package:admin_car_sales_management/src/common_widgets/employee_info_row.dart';
import 'package:admin_car_sales_management/src/config/utils/style/color_style.dart';
import 'package:admin_car_sales_management/src/config/utils/style/custom_font_style.dart';
import 'package:admin_car_sales_management/src/config/utils/style/height_margin.dart';
import 'package:admin_car_sales_management/src/config/utils/style/width_margin.dart';
import 'package:admin_car_sales_management/src/features/dash_board/view/component/sales_bar_chart.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PersonalCaseResultWidget extends HookConsumerWidget {
  PersonalCaseResultWidget({super.key});
  final saleSumList = [
    16000000.0,
    20000000.0,
    20000000.0,
    10000000.0,
    20000000.0,
    7000000.0,
    20000000.0,
    20000000.0,
    8000000.0,
    9000000.0,
    12000000.0,
    11000000.0,
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        HeightMargin.normal,
        //買取総額の推移//////////////////////////////////////////////
        //買取金額の推移
        const EmployeeInfoRow(
          fieldName: '買取金額の推移',
          fieldData: '',
        ),
        HeightMargin.normal,
        SizedBox(
          width: double.infinity,
          height: 200,
          child: SalesBarChart(
            salesSumList: saleSumList,
          ),
        ),
        HeightMargin.normal,
        //8月の買取総額
        const EmployeeInfoRow(
          fieldName: '8月の買取総額',
          fieldData: '2,000,000円',
        ),
        HeightMargin.small,
        //年間の買取総額
        const EmployeeInfoRow(
          fieldName: '年間の買取総額',
          fieldData: '92,000,000円',
        ),
        HeightMargin.small,
        //成約率///////////////////////////////////////////////////
        Row(
          children: [
            const Text(
              '成約率',
              style: TextStyle(
                fontSize: CustomFontSize.large,
                fontWeight: FontWeight.bold,
                color: ColorStyle.mainBlack,
              ),
            ),
            WidthMargin.normal,
            Expanded(
              child: Container(
                height: 1,
                color: ColorStyle.secondGrey,
              ),
            ),
          ],
        ),
        HeightMargin.small,
        //8月の成約件数
        const EmployeeInfoRow(
          fieldName: '8月の成約件数',
          fieldData: '20件',
        ),
        HeightMargin.small,
        //8月の成約率
        const EmployeeInfoRow(
          fieldName: '8月の成約率',
          fieldData: '20%',
        ),
        HeightMargin.small,
        //1年間での平均成約率
        const EmployeeInfoRow(
          fieldName: '1年間での平均成約率',
          fieldData: '30%',
        ),
      ],
    );
  }
}
