import 'package:admin_car_sales_management/src/common_widgets/blue_button.dart';
import 'package:admin_car_sales_management/src/common_widgets/form_divider.dart';
import 'package:admin_car_sales_management/src/config/utils/style/color_style.dart';
import 'package:admin_car_sales_management/src/config/utils/style/padding_style.dart';
import 'package:admin_car_sales_management/src/features/employee/controller/employee_controller.dart';
import 'package:admin_car_sales_management/src/features/employee/data_model/employee.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
    final ValueNotifier<bool> isLoading = useState(false);

    // 1初めにUSEFUTUREで初期値を取得
    // 2初期値がある場合は、表示
    // 3useStateまたはuseTextEditingControllerを変化させる
    //名前
    final TextEditingController nameController = useTextEditingController();
    //電話番号
    final TextEditingController phoneController = useTextEditingController();
    //メールアドレス
    final TextEditingController emailController = useTextEditingController();
    //住所
    final TextEditingController addressController = useTextEditingController();
    //役割
    final ValueNotifier<int?> role = useState(null);
    //生年月日
    final ValueNotifier<Timestamp?> birthDate = useState(null);
    useEffect(
      () {
        Future(() async {
          isLoading.value = true;
          if (employeeId != null && employeeId!.isNotEmpty) {
            final Employee employeeData = await ref
                .read(employeeControllerProvider.notifier)
                .getEmployeeData(employeeId: employeeId!);
            nameController.text = employeeData.employeeName;
            phoneController.text = employeeData.phoneNumber;
            emailController.text = employeeData.email;
            addressController.text = employeeData.address;
            role.value = employeeData.role;
            birthDate.value = employeeData.birthDate;
          }

          isLoading.value = false;
        });
        return null;
      },
      [],
    );

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
            Padding(
              padding: PaddingStyle.detailForm,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //名前
                  FormInputField(
                    title: '名前',
                    labelText: (nameController.text.isNotEmpty)
                        ? nameController.text
                        : '名前',
                    isRequired: true,
                    controller: nameController,
                    isCaseForm: false,
                  ),
                  const FormDivider(),
                  //メールアドレス
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
                                child: Text(
                                  (emailController.text.isNotEmpty)
                                      ? emailController.text
                                      : 'メールアドレス',
                                  style: const TextStyle(
                                    color: ColorStyle.mainBlack,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      : FormInputField(
                          title: 'メールアドレス',
                          labelText: 'メールアドレス',
                          isRequired: true,
                          controller: emailController,
                          isCaseForm: false,
                        ),
                  const FormDivider(),
                  FormDropdownField(
                    //TODO
                    label: (role.value != null) ? role.value.toString() : '役割',
                    items: const ['スタッフ', '責任者'],
                    isRequired: true,
                  ),
                  const FormDivider(),
                  FormInputField(
                    labelText: (phoneController.text.isNotEmpty)
                        ? phoneController.text
                        : '電話番号',
                    title: '電話番号',
                    isRequired: false,
                    controller: phoneController,
                    isCaseForm: false,
                  ),
                  const FormDivider(),
                  const FormDateField(
                    label: '生年月日',
                    // birthDate: birthDate,
                  ),
                  const FormDivider(),
                  FormInputField(
                    labelText: (addressController.text.isNotEmpty)
                        ? addressController.text
                        : '住所',
                    title: '住所',
                    isRequired: false,
                    controller: addressController,
                    isCaseForm: false,
                    maxLine: 2,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
