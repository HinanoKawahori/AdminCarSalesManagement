import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../config/firebase/firebase_auth_error_text.dart';
import '../../../config/firebase/firebase_instance_provider.dart';

part 'auth_repo.g.dart';

@Riverpod(keepAlive: true)
class AuthRepo extends _$AuthRepo {
  @override
  User? build() {
    return ref.watch(firebaseAuthProvider).currentUser;
  }

  //authStateChangeを監視する
  Stream<User?> authStateChange() {
    return ref
        .read(firebaseAuthProvider)
        .authStateChanges()
        .map((User? currentUser) {
      state = currentUser;

      return state;
    });
  }

  //サインアップ処理
  Future<String> signUp({
    required String email,
    required String password,
  }) async {
    try {
      await ref.read(firebaseAuthProvider).createUserWithEmailAndPassword(
            email: email,
            password: password,
          );
      state = ref.read(firebaseAuthProvider).currentUser;
      return 'success';
    } on FirebaseAuthException catch (e) {
      return FirebaseAuthErrorExt.fromCode(e.code).message;
    } catch (e) {
      return 'error';
    }
  }

  //サインイン処理
  Future<String> signIn({
    required String email,
    required String password,
  }) async {
    try {
      await ref.read(firebaseAuthProvider).signInWithEmailAndPassword(
            email: email,
            password: password,
          );
      state = ref.read(firebaseAuthProvider).currentUser;
      return 'success';
    } on FirebaseAuthException catch (e) {
      return FirebaseAuthErrorExt.fromCode(e.code).message;
    } catch (e) {
      return 'error';
    }
  }

  //サインアウト処理
  Future<void> signOut() async {
    await ref.read(firebaseAuthProvider).signOut();
    state = ref.read(firebaseAuthProvider).currentUser;
  }

  //パスワード再設定メールの送信
  Future<String> sendPasswordResetEmail({
    required String email,
  }) async {
    try {
      await ref.read(firebaseAuthProvider).sendPasswordResetEmail(email: email);
      // パスワードリセットメールの送信に成功した場合の処理
      return 'success';
    } on FirebaseAuthException catch (e) {
      return FirebaseAuthErrorExt.fromCode(e.code).message;
    } catch (e) {
      return 'error';
    }
  }
}
