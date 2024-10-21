import 'package:admin_car_sales_management/src/config/utils/style/custom_font_style.dart';
import 'package:admin_car_sales_management/src/config/utils/style/height_margin.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../common_widgets/employee_info_row.dart';
import '../../../../config/utils/style/color_style.dart';

class EmployeeInfoWidget extends ConsumerWidget {
  const EmployeeInfoWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //ここで、ref.watch()でデータを取得する
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //従業員の名前
        Text(
          '田中正敏',
          style: TextStyle(
            fontSize: CustomFontSize.large,
          ),
        ),
        Divider(color: ColorStyle.secondGrey),
        HeightMargin.small,
        //従業員ID
        EmployeeInfoRow(
          fieldName: '従業員ID',
          fieldData: '1235324234KL',
        ),
        HeightMargin.small,
        //役割
        EmployeeInfoRow(
          fieldName: '役割',
          fieldData: 'スタッフ',
        ),
        HeightMargin.small,
        //メールアドレス
        EmployeeInfoRow(
          fieldName: 'メールアドレス',
          fieldData: 'tanaka@example.com',
        ),
      ],
    );
  }
}
