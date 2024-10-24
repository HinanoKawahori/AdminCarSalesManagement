import 'package:admin_car_sales_management/src/function/switch_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../common_widgets/form/form_date_field.dart';
import '../../../../../common_widgets/show_toast.dart';
import '../../../../../config/utils/style/color_style.dart';
import '../../../../../config/utils/style/height_margin.dart';
import '../../../../../config/utils/style/width_margin.dart';
import '../../../../../common_widgets/form/form_dropdown_field.dart';
import '../../../../../common_widgets/form/form_input_field.dart';
import '../../../../../common_widgets/form_divider.dart';
import '../../../../employee/data_model/employee.dart';

class CaseInfoForm extends HookConsumerWidget {
  const CaseInfoForm({
    super.key,
    required this.caseIdController,
    required this.customerNameController,
    required this.emailController,
    required this.phoneController,
    required this.addressController,
    required this.customerBirthDate,
    required this.caseStatus,
    required this.employeeData,
  });

  final TextEditingController caseIdController;
  final TextEditingController customerNameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;

  final TextEditingController addressController;
  final ValueNotifier<Timestamp?> customerBirthDate;
  final ValueNotifier<int?> caseStatus;
  final ValueNotifier<Employee?> employeeData;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '案件情報',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        HeightMargin.normal,
        const Divider(color: ColorStyle.mainBlack),
        HeightMargin.normal,
        SizedBox(
          height: 48,
          width: 600,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '案件ID',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: ColorStyle.mainBlack,
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 300,
                child: Row(
                  children: [
                    const Text('1231413321AED123'),
                    WidthMargin.minimum,
                    Tooltip(
                      message: 'コピー',
                      child: SizedBox(
                        width: 20,
                        height: 16,
                        child: Center(
                          child: GestureDetector(
                            onTap: () {
                              Clipboard.setData(const ClipboardData(
                                  text: '1231413321AED123'));
                              showToast(toastMessage: '案件IDをコピーしました！');
                            },
                            child: const Icon(
                              Icons.copy,
                              color: ColorStyle.mainGrey,
                              size: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const FormDivider(),
        //営業ステータス
        FormDropdownField(
          label: '営業ステータス',
          items: ['商談中', '成約', '失'],
          isRequired: true,
          title: '営業ステータス',
          onChanged: (String? value) {
            //TODO
            if (value != null) {
              caseStatus.value = getStatusCode(value);
            }
          },
        ),
        const FormDivider(),
        //顧客名
        FormInputField(
          title: '顧客名',
          hintText: (customerNameController.text.isNotEmpty)
              ? customerNameController.text
              : '顧客名',
          controller: customerNameController,
          isRequired: true,
          isCaseForm: true,
        ),
        const FormDivider(),
        //担当者
        FormDropdownField(
          label: '担当者',
          items: ['商談中', '成約', '失注'],
          isRequired: true,
          title: '担当者',
          onChanged: (String? value) {
            //TODO ref.watchで持ってくるか
          },
        ),
        const FormDivider(),
        //メールアドレス
        FormInputField(
          title: 'メールアドレス',
          hintText: (emailController.text.isNotEmpty)
              ? emailController.text
              : 'メールアドレス',
          controller: emailController,
          isRequired: false,
          isCaseForm: true,
        ),
        const FormDivider(),
        //性別選択ラジオボタン
        _buildGenderRadio(ref),
        const FormDivider(),
        //電話番号
        FormInputField(
          title: '電話番号',
          hintText:
              (phoneController.text.isNotEmpty) ? phoneController.text : '電話番号',
          controller: phoneController,
          isRequired: false,
          isCaseForm: true,
        ),
        const FormDivider(),
        //生年月日
        FormDateField(
          label: '生年月日',
          birthDate: customerBirthDate,
          onTap: () async {
            final DateTime? pickedDate = await showDatePicker(
              context: context,
              firstDate: DateTime(2000),
              lastDate: DateTime(2100),
            );
            if (pickedDate != null) {
              customerBirthDate.value = Timestamp.fromDate(pickedDate);
            }
          },
          hintText: '',
        ),
        const FormDivider(),
        //住所
        FormInputField(
          title: '住所',
          hintText: (addressController.text.isNotEmpty)
              ? addressController.text
              : '住所',
          controller: addressController,
          isRequired: false,
          isCaseForm: true,
          maxLine: 2,
        ),
      ],
    );
  }

  Widget _buildGenderRadio(WidgetRef ref) {
    String _selectedGender = '女性';
    return SizedBox(
      height: 48,
      width: 600,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Row(
            children: [
              Text(
                '性別',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: ColorStyle.mainBlack,
                ),
              ),
              WidthMargin.normal,
            ],
          ),
          SizedBox(
            width: 300,
            child: Row(
              children: [
                Radio<String>(
                  value: '女性',
                  groupValue: _selectedGender,
                  onChanged: (String? value) {
                    _selectedGender = value!;
                  },
                  fillColor: WidgetStateProperty.resolveWith<Color>(
                    (Set<WidgetState> states) {
                      if (states.contains(WidgetState.selected)) {
                        return Colors.blue;
                      }
                      return Colors.blue;
                    },
                  ),
                ),
                const Text('女性'),
                const SizedBox(width: 20),
                Radio<String>(
                  fillColor: WidgetStateProperty.resolveWith<Color>(
                    (Set<WidgetState> states) {
                      if (states.contains(WidgetState.selected)) {
                        return Colors.blue;
                      }
                      return Colors.blue;
                    },
                  ),
                  value: '男性',
                  groupValue: _selectedGender,
                  onChanged: (String? value) {
                    _selectedGender = value!;
                  },
                ),
                const Text('男性'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
