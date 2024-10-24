import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../../common_widgets/form/form_dropdown_field.dart';
import '../../../../../common_widgets/form/form_input_field.dart';
import '../../../../../common_widgets/form/form_visit_date_field.dart';
import '../../../../../common_widgets/form_divider.dart';
import '../../../../../config/utils/style/color_style.dart';
import '../../../../../config/utils/style/height_margin.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../employee/data_model/employee.dart';

class AssessmentInfoForm extends HookConsumerWidget {
  const AssessmentInfoForm({
    super.key,
    required this.mileageController,
    required this.manufacturerController,
    required this.modelController,
    required this.yearController,
    required this.mileageAssessmentController,
    required this.priceController,
    required this.memoController,
  });
  final TextEditingController mileageController;
  final TextEditingController manufacturerController;
  final TextEditingController modelController;
  final TextEditingController yearController;
  final TextEditingController mileageAssessmentController;
  final TextEditingController priceController;
  final TextEditingController memoController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '査定情報',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        HeightMargin.normal,
        const Divider(color: ColorStyle.mainBlack),
        HeightMargin.normal,
        FormDropdownField(
          title: 'メーカー',
          onChanged: (String? value) {
            //TODO
          },
          label: 'メーカー',
          items: [
            'ホンダ',
            'スズキ',
            'トヨタ',
          ],
          isRequired: false,
        ),
        const FormDivider(),
        FormDropdownField(
          title: '車種',
          onChanged: (String? value) {
            //TODO
          },
          label: '車種',
          items: [
            'ワゴン',
            'ワルツ',
            'ブリヂストン',
          ],
          isRequired: false,
        ),
        const FormDivider(),
        FormDropdownField(
          title: '年式',
          onChanged: (String? value) {
            //TODO
          },
          label: '年式',
          items: [
            '1920',
            '1930',
            '1940',
            '1950',
            '1960',
          ],
          isRequired: false,
        ),
        const FormDivider(),
        FormDropdownField(
          title: 'ランク',
          onChanged: (String? value) {
            //TODO
          },
          label: 'ランク',
          items: ['S', 'A', 'B', 'C'],
          isRequired: false,
        ),
        const FormDivider(),
        FormDropdownField(
          title: '走行距離',
          onChanged: (String? value) {
            //TODO
          },
          label: '走行距離',
          items: const [
            '19000km-20000km',
            '20000km-21000km',
            '22000km-23000km',
          ],
          isRequired: false,
        ),
        const FormDivider(),
        FormInputField(
          title: '査定金額',
          hintText:
              (priceController.text.isNotEmpty) ? priceController.text : '名前',
          controller: priceController,
          isRequired: false,
          isCaseForm: true,
        ),
        const FormDivider(),
        const FormVisitDateField(label: '訪問日時'),
        const FormDivider(),
        FormInputField(
          title: 'メモ',
          hintText:
              (memoController.text.isNotEmpty) ? memoController.text : 'メモ',
          controller: memoController,
          isRequired: false,
          isCaseForm: true,
          maxLine: 4,
        ),
        HeightMargin.medium,
      ],
    );
  }
}
