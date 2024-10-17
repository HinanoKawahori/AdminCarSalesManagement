import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../repo/auth_repo.dart';

part 'auth_controller.g.dart';

@riverpod
class AuthController extends _$AuthController {
  @override
  AsyncValue build() {
    return const AsyncData(null);
  }

  //サインイン処理
  Future<String> signIn({
    required String email,
    required String password,
  }) async {
    state = const AsyncLoading();
    final String result = await ref.read(authRepoProvider.notifier).signIn(
          email: email,
          password: password,
        );
    state = const AsyncData(null);
    return result;
  }

  //サインアウト処理
  Future<void> signOut() async {
    state = const AsyncLoading();
    await ref.read(authRepoProvider.notifier).signOut();
    state = const AsyncData(null);
  }

  //パスワード再設定メールの送信
  Future<String> sendPasswordResetEmail({
    required String email,
  }) async {
    state = const AsyncLoading();
    final String resultMessage = await ref
        .read(authRepoProvider.notifier)
        .sendPasswordResetEmail(email: email);
    state = const AsyncData(null);
    return resultMessage;
  }
}
