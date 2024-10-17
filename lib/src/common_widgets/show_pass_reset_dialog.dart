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
                  'assets/images/logo_blue.png',
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
                HeightMargin.large,
                Container(
                  width: 150,
                  height: 40,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: ColorStyle.blueGradation,
                    ),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: ElevatedButton(
                    onPressed: () async {
                      await _sendEmail(
                        ref,
                        formKey,
                        emailController,
                        context,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          ColorStyle.transparent, // ボタン自体の背景色を透明にする
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      shadowColor: ColorStyle.transparent, // 影も透明にして影響をなくす
                    ),
                    child: const Text(
                      '送信',
                      style: TextStyle(
                        fontSize: CustomFontSize.normal,
                        color: ColorStyle.mainWhite,
                      ),
                    ),
                  ),
                ),
              ],
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
