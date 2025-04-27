import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_shoes/ApplicationLayer/Presentation/Views/_Common/SharedInputOperations.dart';
import 'package:smart_shoes/ApplicationLayer/Presentation/_Resources/StringManager.dart';
import 'package:smart_shoes/Data/DataSources/DataSourcsesProviders.dart';
import 'package:smart_shoes/Domain/Models/UserModels/LoginModel/LoginEntity.dart';
import 'package:smart_shoes/Domain/Models/UserModels/LoginModel/LoginEntityState.dart';

class LoginViewModel extends StateNotifier<LoginEntityState>
    with SharedUserOperations {
  Ref ref;

  LoginViewModel(this.ref)
      : super(LoginEntityState(loginEntity: LoginEntity.empty()));

  void setEmail(String newMailVal) => state = state.copyWith.loginEntity.email(
      value: newMailVal,
      errorMsg: !isValidEmail(newMailVal) ? StringManager.emailErrMsg : null,
      isValid: isValidEmail(newMailVal));

  void setPassword(String newPassVal) =>
      state = state.copyWith.loginEntity.password(
          value: newPassVal,
          errorMsg: !isValidPassword(newPassVal)
              ? StringManager.passwordLengthErrMsg
              : null,
          isValid: isValidPassword(newPassVal));

  bool get isValidInput =>
      state.loginEntity.email.isValid && state.loginEntity.password.isValid;

  String? get getPasswordErrMsg => state.loginEntity.password.errorMsg;

  String? get getEmailErrMsg => state.loginEntity.email.errorMsg;

  void login(BuildContext context) async {
    state = state.copyWith(currentState: const AsyncLoading());
    var result = await ref
        .read(fireBaseProviderAuthRepo)
        .login(state.loginEntity.getLoginStrings());

    result.when(
        data: (data) => state =
            state.copyWith(currentState: const AsyncValue.data("Logged In")),
        error: (error, stackTrace) => state = state.copyWith(
            currentState: AsyncValue.error(
                (error as FirebaseAuthException).message.toString(),
                stackTrace)),
        loading: () =>
            state = state.copyWith(currentState: const AsyncValue.loading()));
  }
}
