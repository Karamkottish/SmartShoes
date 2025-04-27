import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_shoes/Data/DataSources/DataSourcsesProviders.dart';
import 'package:smart_shoes/ApplicationLayer/Presentation/Views/_Common/InputField.dart';
import 'package:smart_shoes/ApplicationLayer/Presentation/Views/_Common/SharedInputOperations.dart';
import 'package:smart_shoes/ApplicationLayer/Presentation/_Resources/StringManager.dart';
import 'package:smart_shoes/Domain/Models/UserModels/RegisterModel/RegisterEntity.dart';
import 'package:smart_shoes/Domain/Models/UserModels/RegisterModel/RegisterState.dart';

enum _Field { userName, email, password, weight, height, birthYear }

final registerStateProvider =
    StateNotifierProvider<RegisterViewModel, RegisterState>(
        (ref) => RegisterViewModel(ref: ref));

class RegisterViewModel extends StateNotifier<RegisterState>
    with SharedUserOperations {
  Ref ref;

  RegisterViewModel({required this.ref})
      : super(RegisterState(registerEntity: RegisterEntity.empty()));

  void setUsername(String val) {
    bool isValid = isValidUserName(val);
    _setField(_Field.userName, val, StringManager.usernameErrMsg, isValid);
  }

  void setEmail(String val) {
    bool isValid = isValidEmail(val);
    _setField(_Field.email, val, StringManager.emailErrMsg, isValid);
  }

  void setPassword(String val) {
    bool isValid = isValidPassword(val);
    _setField(
        _Field.password, val, StringManager.passwordLengthErrMsg, isValid);
  }

  void setWeight(String val) {
    bool isValid = isValidWeight(val);
    _setField(_Field.weight, val, StringManager.weightErrMsg, isValid);
  }

  void setHeight(String val) {
    bool isValid = isValidHeight(val);
    _setField(_Field.height, val, StringManager.heightErrMsg, isValid);
  }

  void setBirth(String val) {
    bool isValid = isValidBirth(val);
    _setField(_Field.birthYear, val, StringManager.birthYearErrMsg, isValid);
  }

  void register() async {
    state = state.copyWith(currentState: const AsyncLoading());
    var result = await ref
        .read(fireBaseProviderAuthRepo)
        .createUser(state.registerEntity.getRegisterStrings());

    result.when(
        data: (data) => state = state.copyWith(
            currentState: const AsyncValue.data("Signed Up Successfully")),
        error: (error, stackTrace) {
          state = state.copyWith(
              currentState: AsyncValue.error(
                  (error as FirebaseException).message.toString(), stackTrace));
        },
        loading: () =>
            state = state.copyWith(currentState: const AsyncValue.loading()));
  }

  bool get isValidInput =>
      state.registerEntity.userName.isValid &&
      state.registerEntity.email.isValid &&
      state.registerEntity.password.isValid &&
      state.registerEntity.weight.isValid &&
      state.registerEntity.height.isValid &&
      state.registerEntity.birthYear.isValid;

  void _setField(_Field field, String val, String errMsg, bool isValid) {
    switch (field) {
      case _Field.userName:
        state = state.copyWith.registerEntity(
            userName: InputField(
                value: val,
                errorMsg: !isValid ? errMsg : null,
                isValid: isValid));
        break;
      case _Field.email:
        state = state.copyWith.registerEntity(
            email: InputField(
                value: val,
                errorMsg: !isValid ? errMsg : null,
                isValid: isValid));
        break;
      case _Field.password:
        state = state.copyWith.registerEntity(
            password: InputField(
                value: val,
                errorMsg: !isValid ? errMsg : null,
                isValid: isValid));
        break;
      case _Field.weight:
        state = state.copyWith.registerEntity(
            weight: InputField(
                value: val,
                errorMsg: !isValid ? errMsg : null,
                isValid: isValid));
        break;
      case _Field.height:
        state = state.copyWith.registerEntity(
            height: InputField(
                value: val,
                errorMsg: !isValid ? errMsg : null,
                isValid: isValid));
        break;
      case _Field.birthYear:
        state = state.copyWith.registerEntity(
            birthYear: InputField(
                value: val,
                errorMsg: !isValid ? errMsg : null,
                isValid: isValid));
        break;
    }
  }
}
