import 'package:admin_car_sales_management/src/common_widgets/show_pass_reset_dialog.dart';
import 'package:admin_car_sales_management/src/config/utils/style/box_shadow.dart';
import 'package:admin_car_sales_management/src/config/utils/style/color_style.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

import '../../../common_widgets/error_dialog.dart';
import '../../routing/router_utils.dart';
import '../controller/auth_controller.dart';
import 'component/login_text_form_field.dart';

// 必要なインポートは省略しています。元のコードと同じものを使用してください。

class LoginPage extends HookConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final TextEditingController emailController = useTextEditingController();
    final TextEditingController passwordController = useTextEditingController();
    final ValueNotifier<String?> errorMessage = useState(null);

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: ColorStyle.backGroundColor,
        ),
      ),
      child: Scaffold(
        backgroundColor: ColorStyle.transparent,
        body: Center(
          child: Container(
            width: 400,
            padding: const EdgeInsets.all(32),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [customBoxShadow],
            ),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // ロゴ
                  SizedBox(
                    height: 100,
                    child: Image.asset(
                      'assets/images/blue_grade_logo_with_text.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(height: 32),
                  // メールアドレス入力フィールド
                  LoginTextFormField(
                    passwordController: emailController,
                    title: 'メールアドレス',
                    imagePath: 'assets/images/email.png',
                  ),
                  const SizedBox(height: 16),
                  // パスワード入力フィールド
                  LoginTextFormField(
                    passwordController: passwordController,
                    title: 'パスワード',
                    imagePath: 'assets/images/key.png',
                  ),
                  const SizedBox(height: 24),
                  // エラーメッセージ
                  if (errorMessage.value != null)
                    Text(
                      errorMessage.value!,
                      style: const TextStyle(color: Colors.red),
                    ),
                  const SizedBox(height: 24),
                  // ログインボタン
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () async {
                        await _signIn(
                          ref,
                          formKey,
                          emailController,
                          passwordController,
                          context,
                          errorMessage,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'ログイン',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: ColorStyle.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // パスワードリセットリンク
                  TextButton(
                    onPressed: () {
                      showPassResetDialog(context: context);
                    },
                    child: const Text('パスワードを忘れた方はこちら'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// _signIn関数は元のコードと同じです
//ログイン処理
Future<void> _signIn(
  WidgetRef ref,
  GlobalKey<FormState> formKey,
  TextEditingController emailController,
  TextEditingController passwordController,
  BuildContext context,
  ValueNotifier<String?> errorMessage,
) async {
  if (formKey.currentState!.validate() == false) {
    return;
  }
  if (errorMessage.value != null) {
    return;
  }
  //サインイン
  final String result = await ref.read(authControllerProvider.notifier).signIn(
        email: emailController.text,
        password: passwordController.text,
      );

  if (context.mounted) {
    if (result == 'error') {
      errorDialog(
        context: context,
        title: 'ログイン失敗',
        desc: 'ログインに失敗しました。\n時間を置いてからまたお試しください。',
      );
    } else if (result != 'success') {
      errorDialog(
        context: context,
        title: 'ログイン失敗',
        desc: result,
      );
    } else {
      context.goNamed(AppRoute.employeeList.name);
    }
  }
  return;
}
