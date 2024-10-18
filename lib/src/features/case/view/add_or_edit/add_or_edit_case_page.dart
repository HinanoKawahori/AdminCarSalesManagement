import 'package:admin_car_sales_management/src/common_widgets/title_with_back_button.dart';
import 'package:admin_car_sales_management/src/config/utils/style/height_margin.dart';
import 'package:admin_car_sales_management/src/config/utils/style/width_margin.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:admin_car_sales_management/src/common_widgets/blue_button.dart';
import 'package:admin_car_sales_management/src/common_widgets/form_divider.dart';
import 'package:admin_car_sales_management/src/config/utils/style/color_style.dart';
import 'package:admin_car_sales_management/src/config/utils/style/padding_style.dart';
import 'package:admin_car_sales_management/src/common_widgets/form/form_date_field.dart';
import 'package:admin_car_sales_management/src/common_widgets/form/form_dropdown_field.dart';

import '../../../../common_widgets/form/form_input_field.dart';

class AddOrEditCasePage extends HookConsumerWidget {
  const AddOrEditCasePage({
    super.key,
    this.caseId,
  });
  final String? caseId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: ColorStyle.paleBlue,
      body: SingleChildScrollView(
        child: Padding(
          padding: PaddingStyle.normal,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TitleWithBackButton(
                    onPressed: () {
                      context.pop();
                    },
                    title: caseId == null ? '案件新規作成' : '案件詳細',
                  ),
                  BlueButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    title: caseId == null ? '登録' : '編集',
                  ),
                ],
              ),
              HeightMargin.large,
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: _buildCaseInfoForm(),
                  ),
                  WidthMargin.large,
                  Expanded(
                    child: _buildAssessmentInfoForm(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCaseInfoForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '案件情報',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        HeightMargin.normal,
        const Divider(color: ColorStyle.mainBlack),
        const SizedBox(height: 16),
        FormInputField('案件ID'),
        const FormDivider(),
        FormInputField('顧客名', isRequired: true),
        const FormDivider(),
        FormInputField('メールアドレス'),
        const FormDivider(),
        const FormDropdownField(
          label: '性別',
          items: ['男性', '女性', 'その他'],
          isRequired: false,
        ),
        const FormDivider(),
        FormInputField('電話番号'),
        const FormDivider(),
        FormInputField('走行距離'),
        const FormDivider(),
        const FormDateField(label: '生年月日'),
        const FormDivider(),
        FormInputField('住所'),
      ],
    );
  }

  Widget _buildAssessmentInfoForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('査定情報',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        HeightMargin.normal,
        const Divider(color: ColorStyle.mainBlack),
        const SizedBox(height: 16),
        const FormDropdownField(
          label: '営業ステータス',
          items: ['商談中', '成約', '失注'],
          isRequired: true,
        ),
        const FormDivider(),
        FormInputField('メーカー'),
        const FormDivider(),
        FormInputField('車種'),
        const FormDivider(),
        FormInputField('年式'),
        const FormDivider(),
        const FormDropdownField(
          label: 'ランク',
          items: ['S', 'A', 'B', 'C'],
          isRequired: false,
        ),
        const FormDivider(),
        FormInputField('走行距離'),
        const FormDivider(),
        FormInputField('査定金額'),
        const FormDivider(),
        const FormDateField(label: '訪問日時'),
        const FormDivider(),
        FormInputField(
          'メモ',
        ),
      ],
    );
  }
}
