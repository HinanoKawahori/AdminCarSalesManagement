import 'package:admin_car_sales_management/src/common_widgets/blue_button.dart';
import 'package:admin_car_sales_management/src/common_widgets/form_divider.dart';
import 'package:admin_car_sales_management/src/config/utils/style/color_style.dart';
import 'package:admin_car_sales_management/src/config/utils/style/padding_style.dart';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../common_widgets/form/form_date_field.dart';
import '../../../../common_widgets/form/form_dropdown_field.dart';
import '../../../../common_widgets/form/form_input_field.dart';
import '../../../../common_widgets/title_with_back_button.dart';
import '../../../../config/utils/style/width_margin.dart';

class AddOrEditEmployeePage extends HookConsumerWidget {
  const AddOrEditEmployeePage({
    super.key,
    this.employeeId,
  });

  final String? employeeId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController nameController = useTextEditingController();
    final TextEditingController phoneController = useTextEditingController();
    final TextEditingController emailController = useTextEditingController();
    final TextEditingController addressController = useTextEditingController();
    // final ValueNotifier<String> birthDate = useState('');

    return Scaffold(
      backgroundColor: ColorStyle.paleBlue,
      body: Padding(
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
                  title: employeeId == null ? '従業員新規作成' : '従業員編集',
                ),
                BlueButton(
                  onPressed: () {
                    //TODO新規登録 or 編集処理
                    context.pop();
                  },
                  title: employeeId == null ? '登録' : '編集',
                ),
              ],
            ),
            const SizedBox(height: 24),
            FormInputField(
              label: '名前',
              isRequired: true,
              controller: nameController,
              isCaseForm: false,
            ),
            const FormDivider(),
            employeeId != null
                ? SizedBox(
                    width: 600,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Row(
                          children: [
                            Text(
                              'メールアドレス',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: ColorStyle.mainBlack,
                              ),
                            ),
                            WidthMargin.normal,
                          ],
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          width: 300,
                          height: 48,
                          child: const Text(
                            '1524hinano@gmail.com',
                            style: const TextStyle(
                              color: ColorStyle.mainBlack,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : FormInputField(
                    label: 'メールアドレス',
                    isRequired: true,
                    controller: emailController,
                    isCaseForm: false,
                  ),
            const FormDivider(),
            const FormDropdownField(
              label: '役割',
              items: ['スタッフ', '責任者'],
              isRequired: true,
            ),
            const FormDivider(),
            FormInputField(
              label: '電話番号',
              isRequired: false,
              controller: phoneController,
              isCaseForm: false,
            ),
            const FormDivider(),
            FormDateField(
              label: '生年月日',
              // birthDate: birthDate,
            ),
            const FormDivider(),
            FormInputField(
              label: '住所',
              isRequired: false,
              controller: addressController,
              isCaseForm: false,
              maxLine: 2,
            ),
            const FormDivider(),
          ],
        ),
      ),
    );
  }
}
