import 'package:admin_car_sales_management/src/common_widgets/form/form_visit_date_field.dart';
import 'package:admin_car_sales_management/src/common_widgets/title_with_back_button.dart';
import 'package:admin_car_sales_management/src/config/utils/style/height_margin.dart';
import 'package:admin_car_sales_management/src/config/utils/style/width_margin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
import '../../../../common_widgets/show_toast.dart';

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
                  //タイトル
                  TitleWithBackButton(
                    onPressed: () {
                      context.pop();
                    },
                    title: caseId == null ? '案件新規作成' : '案件詳細',
                  ),
                  //登録or編集ボタン
                  BlueButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    title: caseId == null ? '登録' : '編集',
                  ),
                ],
              ),
              HeightMargin.large,
              //フォーム
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    //案件情報フォーム
                    child: _buildCaseInfoForm(
                      ref,
                      caseIdController,
                      customerNameController,
                      emailController,
                      phoneController,
                      mileageController,
                      addressController,
                    ),
                  ),
                  WidthMargin.large,
                  //査定情報フォーム
                  Expanded(
                    child: _buildAssessmentInfoForm(
                      ref,
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
    WidgetRef ref,
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
        HeightMargin.normal,
        //TODO 案件ID
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
        //顧客名
        FormInputField(
          title: '顧客名',
          labelText: (customerNameController.text.isNotEmpty)
              ? customerNameController.text
              : '顧客名',
          controller: customerNameController,
          isRequired: true,
          isCaseForm: true,
        ),
        const FormDivider(),
        //メールアドレス
        FormInputField(
          title: 'メールアドレス',
          labelText: (emailController.text.isNotEmpty)
              ? emailController.text
              : 'メールアドレス',
          controller: emailController,
          isRequired: false,
          isCaseForm: true,
        ),
        const FormDivider(),
        //性別
        _buildGenderRadio(ref),
        const FormDivider(),
        //電話番号
        FormInputField(
          title: '電話番号',
          labelText:
              (phoneController.text.isNotEmpty) ? phoneController.text : '電話番号',
          controller: phoneController,
          isRequired: false,
          isCaseForm: true,
        ),

        const FormDivider(),
        //生年月日
        const FormDateField(
          label: '生年月日',
          // birthDate: '',
        ),
        const FormDivider(),
        //住所
        FormInputField(
          title: '住所',
          labelText: (addressController.text.isNotEmpty)
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
                        return Colors.blue; // 選択された状態の色
                      }
                      return Colors.blue; // 選択されていない状態の色
                    },
                  ),
                ),
                const Text('女性'),
                const SizedBox(width: 20),
                Radio<String>(
                  fillColor: WidgetStateProperty.resolveWith<Color>(
                    (Set<WidgetState> states) {
                      if (states.contains(WidgetState.selected)) {
                        return Colors.blue; // 選択された状態の色
                      }
                      return Colors.blue; // 選択されていない状態の色
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

  Widget _buildAssessmentInfoForm(
    WidgetRef ref,
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
        HeightMargin.normal,
        //営業ステータス
        const FormDropdownField(
          label: '営業ステータス',
          items: ['商談中', '成約', '失注'],
          isRequired: true,
        ),
        const FormDivider(),
        //メーカー
        const FormDropdownField(
          label: 'メーカー',
          items: [
            'ホンダ',
            'スズキ',
            'トヨタ',
          ],
          isRequired: false,
        ),
        const FormDivider(),
        //車種
        const FormDropdownField(
          label: '車種',
          items: [
            'ワゴン',
            'ワルツ',
            'ブリヂストン',
          ],
          isRequired: false,
        ),
        const FormDivider(),
        //年式
        const FormDropdownField(
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
        //ランク
        const FormDropdownField(
          label: 'ランク',
          items: ['S', 'A', 'B', 'C'],
          isRequired: false,
        ),
        const FormDivider(),
        //走行距離
        const FormDropdownField(
          label: '走行距離',
          items: [
            '19000km-20000km',
            '20000km-21000km',
            '22000km-23000km',
          ],
          isRequired: false,
        ),
        const FormDivider(),
        //査定金額
        FormInputField(
          title: '査定金額',
          labelText:
              (priceController.text.isNotEmpty) ? priceController.text : '名前',
          controller: priceController,
          isRequired: false,
          isCaseForm: true,
        ),
        const FormDivider(),
        //訪問日時
        const FormVisitDateField(label: '訪問日時'),
        const FormDivider(),
        //メモ
        FormInputField(
          title: 'メモ',
          labelText:
              (memoController.text.isNotEmpty) ? memoController.text : 'メモ',
          controller: memoController,
          isRequired: false,
          isCaseForm: true,
          maxLine: 4,
        ),
      ],
    );
  }
}
