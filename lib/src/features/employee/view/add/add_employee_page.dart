import 'package:admin_car_sales_management/src/common_widgets/blue_button.dart';
import 'package:admin_car_sales_management/src/common_widgets/form_divider.dart';
import 'package:admin_car_sales_management/src/common_widgets/form_must_mark.dart';
import 'package:admin_car_sales_management/src/config/utils/style/color_style.dart';
import 'package:admin_car_sales_management/src/config/utils/style/custom_font_style.dart';
import 'package:admin_car_sales_management/src/config/utils/style/padding_style.dart';
import 'package:admin_car_sales_management/src/config/utils/style/width_margin.dart';
import 'package:admin_car_sales_management/src/features/routing/app_router.dart';
import 'package:admin_car_sales_management/src/features/routing/router_utils.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../common_widgets/form/form_date_field.dart';
import '../../../../common_widgets/form/form_dropdown_field.dart';

class AddOrEditEmployeePage extends HookConsumerWidget {
  const AddOrEditEmployeePage({super.key, this.employeeId});

  final String? employeeId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ここでは簡単のため、状態管理を省略しています。実際の実装では適切な状態管理を行ってください。

    return Padding(
      padding: PaddingStyle.normal,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                employeeId == null ? '従業員新規作成' : '従業員編集',
                style: const TextStyle(
                  fontSize: CustomFontSize.header,
                ),
              ),
              BlueButton(
                onPressed: () {
                  //TODO 新規登録 or 編集処理
                  context.pop();
                },
                title: employeeId == null ? '登録' : '編集',
              ),
            ],
          ),

          // BlueGradationButton(onPressed: ,t)
          const SizedBox(height: 24),
          FormInputField('名前', isRequired: true),
          const FormDivider(),
          FormInputField('メールアドレス', isRequired: true),
          const FormDivider(),

          const FormDropdownField(
            label: '役割',
            items: ['スタッフ', 'マネージャー', '管理者'],
            isRequired: true,
          ),
          const FormDivider(),
          FormInputField('電話番号'),
          const FormDivider(),
          const FormDateField(label: '生年月日'),
          const FormDivider(),
          FormInputField('住所'),
          const FormDivider(),
        ],
      ),
    );
  }

  Widget FormInputField(String label, {bool isRequired = false}) {
    return SizedBox(
      width: 800,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                label,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: ColorStyle.mainBlack,
                ),
              ),
              WidthMargin.normal,
              isRequired ? const FormMustMark() : Container(),
            ],
          ),
          Container(
            width: 400,
            color: ColorStyle.white,
            child: TextField(
              decoration: InputDecoration(
                labelText: label,
                border: const OutlineInputBorder(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
