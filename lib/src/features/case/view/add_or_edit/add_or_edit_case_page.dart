import 'package:admin_car_sales_management/src/common_widgets/form/form_visit_date_field.dart';
import 'package:admin_car_sales_management/src/common_widgets/title_with_back_button.dart';
import 'package:admin_car_sales_management/src/config/utils/style/height_margin.dart';
import 'package:admin_car_sales_management/src/config/utils/style/width_margin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
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
    final TextEditingController caseIdController = useTextEditingController();
    final TextEditingController customerNameController =
        useTextEditingController();
    final TextEditingController emailController = useTextEditingController();
    final TextEditingController phoneController = useTextEditingController();
    final TextEditingController mileageController = useTextEditingController();
    final TextEditingController addressController = useTextEditingController();
    final TextEditingController manufacturerController =
        useTextEditingController();
    final TextEditingController modelController = useTextEditingController();
    final TextEditingController yearController = useTextEditingController();
    final TextEditingController mileageAssessmentController =
        useTextEditingController();
    final TextEditingController priceController = useTextEditingController();
    final TextEditingController memoController = useTextEditingController();

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
                    child: _buildCaseInfoForm(
                      caseIdController,
                      customerNameController,
                      emailController,
                      phoneController,
                      mileageController,
                      addressController,
                    ),
                  ),
                  WidthMargin.large,
                  Expanded(
                    child: _buildAssessmentInfoForm(
                      manufacturerController,
                      modelController,
                      yearController,
                      mileageAssessmentController,
                      priceController,
                      memoController,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCaseInfoForm(
    TextEditingController caseIdController,
    TextEditingController customerNameController,
    TextEditingController emailController,
    TextEditingController phoneController,
    TextEditingController mileageController,
    TextEditingController addressController,
  ) {
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
        FormInputField(
          label: '案件ID',
          controller: caseIdController,
          isRequired: false,
          isCaseForm: true,
        ),
        const FormDivider(),
        FormInputField(
          label: '顧客名',
          controller: customerNameController,
          isRequired: true,
          isCaseForm: true,
        ),
        const FormDivider(),
        FormInputField(
          label: 'メールアドレス',
          controller: emailController,
          isRequired: false,
          isCaseForm: true,
        ),
        const FormDivider(),
        const FormDropdownField(
          label: '性別',
          items: ['男性', '女性', 'その他'],
          isRequired: false,
        ),
        const FormDivider(),
        FormInputField(
          label: '電話番号',
          controller: phoneController,
          isRequired: false,
          isCaseForm: true,
        ),
        const FormDivider(),
        FormInputField(
          label: '走行距離',
          controller: mileageController,
          isRequired: false,
          isCaseForm: true,
        ),
        const FormDivider(),
        const FormDateField(label: '生年月日'),
        const FormDivider(),
        FormInputField(
          label: '住所',
          controller: addressController,
          isRequired: false,
          isCaseForm: true,
          maxLine: 2,
        ),
      ],
    );
  }

  Widget _buildAssessmentInfoForm(
    TextEditingController manufacturerController,
    TextEditingController modelController,
    TextEditingController yearController,
    TextEditingController mileageAssessmentController,
    TextEditingController priceController,
    TextEditingController memoController,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '査定情報',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        HeightMargin.normal,
        const Divider(color: ColorStyle.mainBlack),
        const SizedBox(height: 16),
        const FormDropdownField(
          label: '営業ステータス',
          items: ['商談中', '成約', '失注'],
          isRequired: true,
        ),
        const FormDivider(),
        FormInputField(
          label: 'メーカー',
          controller: manufacturerController,
          isRequired: false,
          isCaseForm: true,
        ),
        const FormDivider(),
        FormInputField(
          label: '車種',
          controller: modelController,
          isRequired: false,
          isCaseForm: true,
        ),
        const FormDivider(),
        FormInputField(
          label: '年式',
          controller: yearController,
          isRequired: false,
          isCaseForm: true,
        ),
        const FormDivider(),
        const FormDropdownField(
          label: 'ランク',
          items: ['S', 'A', 'B', 'C'],
          isRequired: false,
        ),
        const FormDivider(),
        FormInputField(
          label: '走行距離',
          controller: mileageAssessmentController,
          isRequired: false,
          isCaseForm: true,
        ),
        const FormDivider(),
        FormInputField(
          label: '査定金額',
          controller: priceController,
          isRequired: false,
          isCaseForm: true,
        ),
        const FormDivider(),
        const FormVisitDateField(label: '訪問日時'),
        const FormDivider(),
        FormInputField(
          label: 'メモ',
          controller: memoController,
          isRequired: false,
          isCaseForm: true,
          maxLine: 4,
        ),
      ],
    );
  }
}
