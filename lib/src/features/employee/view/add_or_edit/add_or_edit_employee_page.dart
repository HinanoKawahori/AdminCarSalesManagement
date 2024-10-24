import 'package:admin_car_sales_management/src/common_widgets/blue_button.dart';
import 'package:admin_car_sales_management/src/common_widgets/error_dialog.dart';
import 'package:admin_car_sales_management/src/common_widgets/form_divider.dart';
import 'package:admin_car_sales_management/src/common_widgets/ok_dialog.dart';
import 'package:admin_car_sales_management/src/config/utils/style/color_style.dart';
import 'package:admin_car_sales_management/src/config/utils/style/padding_style.dart';
import 'package:admin_car_sales_management/src/features/auth/controller/auth_controller.dart';
import 'package:admin_car_sales_management/src/features/employee/controller/employee_controller.dart';
import 'package:admin_car_sales_management/src/features/employee/data_model/employee.dart';
import 'package:admin_car_sales_management/src/function/switch_data.dart';
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

    //従業員データ
    final ValueNotifier<Employee?> employeeData = useState(null);
    //名前
    final TextEditingController nameController = useTextEditingController();
    //電話番号
    final TextEditingController phoneController = useTextEditingController();
    //メールアドレス
    final TextEditingController emailController = useTextEditingController();
    //住所
    final TextEditingController addressController = useTextEditingController();
    //役割
    final ValueNotifier<String?> role = useState(null);
    //生年月日
    final ValueNotifier<Timestamp?> birthDate = useState(null);

    //初期値をゲットする
    useEffect(
      () {
        Future(() async {
          isLoading.value = true;
          if (employeeId != null && employeeId!.isNotEmpty) {
            employeeData.value = await ref
                .read(employeeControllerProvider.notifier)
                .getEmployeeData(employeeId: employeeId!);
            if (employeeData.value == null) {
              return;
            }
            nameController.text = employeeData.value!.employeeName;
            phoneController.text = employeeData.value!.phoneNumber ?? '';
            emailController.text = employeeData.value!.email;
            addressController.text = employeeData.value!.address ?? '';
            role.value = switchRoleToString(employeeData.value!.role);
            birthDate.value = employeeData.value!.birthDate;
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
                  title: employeeId == null ? '従業員新規追加' : '従業員編集',
                ),
                BlueButton(
                  onPressed: () async {
                    if (employeeId == null) {
                      await createEmployee(
                        name: nameController.text,
                        email: emailController.text,
                        phoneNumber: phoneController.text,
                        address: addressController.text,
                        role: role.value!,
                        birthDate: birthDate.value,
                        ref: ref,
                        context: context,
                        isLoading: isLoading,
                      );
                    } else {
                      await updateEmployee(
                        ref: ref,
                        context: context,
                        name: nameController.text,
                        email: emailController.text,
                        phoneNumber: phoneController.text,
                        address: addressController.text,
                        role: role.value!,
                        birthDate: birthDate.value,
                        employeeData: employeeData.value,
                      );
                    }
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
                    hintText: (nameController.text.isNotEmpty)
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
                          hintText: 'メールアドレス',
                          isRequired: true,
                          controller: emailController,
                          isCaseForm: false,
                        ),
                  const FormDivider(),
                  //役割
                  FormDropdownField(
                    label: (role.value != null) ? role.value : '',
                    items: const ['スタッフ', '責任者'],
                    isRequired: true,
                    title: '役割',
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        role.value = newValue;
                      }
                    },
                  ),
                  const FormDivider(),
                  //電話番号
                  FormInputField(
                    hintText: (phoneController.text.isNotEmpty)
                        ? phoneController.text
                        : '電話番号',
                    title: '電話番号',
                    isRequired: false,
                    controller: phoneController,
                    isCaseForm: false,
                  ),
                  const FormDivider(),
                  //生年月日

                  FormDateField(
                    hintText: '生年月日',
                    onTap: () async {
                      final DateTime? pickedDate = await showDatePicker(
                        context: context,
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                      );
                      if (pickedDate != null) {
                        birthDate.value = Timestamp.fromDate(pickedDate);
                      }
                    },
                    birthDate: birthDate,
                  ),
                  const FormDivider(),
                  //住所
                  FormInputField(
                    hintText: (addressController.text.isNotEmpty)
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

//従業員更新処理
  Future<void> updateEmployee({
    required WidgetRef ref,
    required BuildContext context,
    required Employee? employeeData,
    required String name,
    required String role,
    required String? email,
    required String? phoneNumber,
    required String? address,
    required Timestamp? birthDate,
  }) async {
    //従業員データ更新
    await ref.read(employeeControllerProvider.notifier).updateEmployee(
          phoneNumber: phoneNumber,
          address: address,
          role: switchRoleToInt(role),
          birthDate: birthDate,
          employee: employeeData!,
          name: name,
        );
    if (context.mounted) {
      context.pop();
    }
  }
}

//従業員作成処理

//TODO
Future<void> createEmployee({
  required WidgetRef ref,
  required BuildContext context,
  required String name,
  required String role,
  required String? email,
  required String? phoneNumber,
  required String? address,
  required Timestamp? birthDate,
  required isLoading,
}) async {
  isLoading.value = true;
  //TODO⭐️「以下を、emuを参考にFunctionで作る」
  //０PWランダム生成
  //１auth登録
  //２firestore登録
  //３メール送信
  //auth登録
  final String result = await ref.read(authControllerProvider.notifier).signUp(
        email: email!,
        password: '仮決めのパスワード',
      );
  if (result == 'success') {
    //auth登録成功したら、firestoreに登録
    await ref.read(employeeControllerProvider.notifier).createEmployee(
          phoneNumber: phoneNumber,
          address: address,
          role: switchRoleToInt(role),
          birthDate: birthDate,
          name: name,
          email: email,
        );
    //登録したemailの従業員に、パスワードリセットメールを送信
    await ref
        .read(authControllerProvider.notifier)
        .sendPasswordResetEmail(email: email);

    isLoading.value = false;
    if (context.mounted) {
      okDialog(
        context: context,
        title: '従業員登録成功',
        desc: '従業員登録が完了しました！',
        dismissOnTouchOutside: false,
        btnOkOnPress: () {
          context.pop();
        },
      );
    }
  } else if (result == 'error') {
    isLoading.value = false;
    if (context.mounted) {
      errorDialog(
        context: context,
        title: '従業員登録失敗',
        desc: '従業員登録に失敗しました。\n時間を置いてからまたお試しください。',
      );
    }
  } else {
    isLoading.value = false;
    if (context.mounted) {
      errorDialog(
        context: context,
        title: '従業員登録失敗',
        desc: result,
      );
    }
  }

  return;
}
