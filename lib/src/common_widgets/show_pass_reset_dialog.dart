import 'package:admin_car_sales_management/src/common_widgets/blud_gradation_button.dart';
import 'package:admin_car_sales_management/src/common_widgets/custom_text_form_field.dart';
import 'package:admin_car_sales_management/src/common_widgets/error_dialog.dart';
import 'package:admin_car_sales_management/src/common_widgets/ok_dialog.dart';
import 'package:admin_car_sales_management/src/config/utils/style/color_style.dart';
import 'package:admin_car_sales_management/src/config/utils/style/custom_font_style.dart';
import 'package:admin_car_sales_management/src/config/utils/style/height_margin.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../features/auth/controller/auth_controller.dart';

void showPassResetDialog({
  required BuildContext context,
}) {
  showDialog(
    context: context,
    builder: (context) {
      return const PassResetDialog();
    },
  );
}

class PassResetDialog extends HookConsumerWidget {
  const PassResetDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController emailController = useTextEditingController();
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return Dialog(
      child: Container(
        width: 400,
        decoration: BoxDecoration(
          color: ColorStyle.mainWhite,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            right: 16.0,
            left: 16.0,
            bottom: 24.0,
            top: 8.0,
          ),
          child: Form(
            key: formKey,
            child: SizedBox(
              width: 300,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      onPressed: () {
                        context.pop();
                      },
                      icon: const Icon(
                        Icons.close,
                        color: ColorStyle.mainGrey,
                      ),
                    ),
                  ),
                  Image.asset(
                    'assets/images/blue_grade_logo_with_text.png',
                    width: 80,
                    fit: BoxFit.contain,
                  ),
                  HeightMargin.medium,
                  const Text(
                    'メールアドレスを入力してください。\nパスワード再設定メールを送信します。',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: CustomFontSize.normal,
                      color: ColorStyle.mainBlack,
                    ),
                  ),
                  HeightMargin.medium,
                  CustomTextFormField(
                    controller: emailController,
                    hight: 65,
                    hintText: 'メールアドレス',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'メールアドレスを入力してください';
                      }
                      if (!EmailValidator.validate(value)) {
                        return '有効なメールアドレスを入力してください';
                      }
                      return null;
                    },
                  ),
                  HeightMargin.normal,
                  SizedBox(
                    width: double.infinity,
                    child: BlueGradationButton(
                      onPressed: () async {
                        await _sendEmail(
                          ref,
                          formKey,
                          emailController,
                          context,
                        );
                      },
                      title: '送信',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

//パスワードリセットメール送信
  Future<void> _sendEmail(
    WidgetRef ref,
    GlobalKey<FormState> formKey,
    TextEditingController emailController,
    BuildContext context,
  ) async {
    //メルアド未入力なら弾く
    if (formKey.currentState!.validate() == false) {
      return;
    }

    final String result = await ref
        .read(authControllerProvider.notifier)
        .sendPasswordResetEmail(email: emailController.text);
    if (result == 'success') {
      if (context.mounted) {
        okDialog(
          context: context,
          title: 'メール送信成功',
          desc: 'パスワード再設定メールを送信しました！',
          dismissOnTouchOutside: false,
          btnOkOnPress: () {
            context.pop();
          },
        );
      }
    } else {
      if (context.mounted) {
        errorDialog(
            context: context, title: 'メール送信失敗', desc: 'パスワード再設定メールの送信に失敗しました。');
      }
    }
    return;
  }
}
