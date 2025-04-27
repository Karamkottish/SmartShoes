import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_shoes/ApplicationLayer/Presentation/Views/_Common/SharedInputOperations.dart';
import 'package:smart_shoes/ApplicationLayer/Presentation/_Resources/StringManager.dart';
import 'package:smart_shoes/Data/DataSources/DataSourcsesProviders.dart';
import 'package:smart_shoes/Domain/Models/UserModels/EditUserModel/EditEntity.dart';
import 'package:smart_shoes/Domain/Models/UserModels/UserModel/UserModel.dart';




class EditViewModel extends StateNotifier<AsyncValue<EditEntity>>
    with SharedUserOperations {
  UserModel initialUser;
  TextEditingController usrNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController yearController = TextEditingController();
  TextEditingController oldPassController = TextEditingController();
  TextEditingController newPassController = TextEditingController();
  Ref ref;

  EditViewModel(this.ref, super.state, this.initialUser) {
    usrNameController.text = state.value?.name.value ?? "";
    emailController.text = state.value?.email.value ?? "";
    weightController.text = state.value?.weight.value ?? "";
    heightController.text = state.value?.height.value ?? "";
    yearController.text = state.value?.birthYear.value ?? "";
  }

  void updateUserInfo() async {
    state = AsyncData(state.requireValue
        .copyWith(submissionState: const AsyncValue.loading()));

    AsyncValue<void> result = const AsyncValue.loading();
    var newUserInfo = initialUser.copyWith(
        name: usrNameController.value.text,
        weight: double.parse(weightController.value.text),
        height: double.parse(heightController.value.text),
        birthYear: int.parse(yearController.value.text));

    if (newPassController.value.text.isNotEmpty) {
      result = await ref
          .read(fireBaseProviderAuthRepo)
          .updatePassword(newPassController.value.text);
      result.when(
          data: (data) => state = AsyncData(state.requireValue.copyWith(
              submissionState: const AsyncData(
                  "Updated Password, Wait to Apply Other Changes"))),
          error: (error, stackTrace) {
            state = AsyncData(state.requireValue.copyWith(
                submissionState:
                    AsyncError((error as Exception).toString(), stackTrace)));
          },
          loading: () {});
      newPassController.value = const TextEditingValue(text: "");
      Future.delayed(const Duration(seconds: 2));
    }

    state = AsyncData(state.requireValue
        .copyWith(submissionState: const AsyncValue.loading()));

    result =
        await ref.read(fireBaseProviderStoreRepo).updateUserInfo(newUserInfo);
    result.when(
        data: (data) => state = AsyncData(state.requireValue
            .copyWith(submissionState: const AsyncData("Updated User"))),
        error: (error, stackTrace) => state = AsyncData(state.requireValue
            .copyWith(
                submissionState: AsyncError(error.toString(), stackTrace))),
        loading: () {});
  }

  void onNameChange() => isValidUserName(usrNameController.value.text)
      ? state = AsyncData(state.requireValue.copyWith
          .name(value: usrNameController.value.text, errorMsg: null))
      : state = AsyncData(state.requireValue.copyWith.name(
          value: usrNameController.value.text,
          errorMsg: StringManager.usernameErrMsg,
          isValid: false));

  void onEmailChange() => isValidEmail(emailController.value.text)
      ? state = AsyncData(state.requireValue.copyWith
          .email(value: emailController.value.text, errorMsg: null))
      : state = AsyncData(state.requireValue.copyWith.email(
          value: emailController.value.text,
          errorMsg: StringManager.emailErrMsg));

  void onWeightChange() => isValidWeight(weightController.value.text)
      ? state = AsyncData(state.requireValue.copyWith
          .weight(value: weightController.value.text, errorMsg: null))
      : state = AsyncData(state.requireValue.copyWith.weight(
          value: weightController.value.text,
          errorMsg: StringManager.weightErrMsg));

  void onHeightChange() => isValidHeight(heightController.value.text)
      ? state = AsyncData(state.requireValue.copyWith
          .height(value: heightController.value.text, errorMsg: null))
      : state = AsyncData(state.requireValue.copyWith.height(
          value: heightController.value.text,
          errorMsg: StringManager.heightErrMsg));

  void onBirthYearChange() => isValidBirth(yearController.value.text)
      ? state = AsyncData(state.requireValue.copyWith
          .birthYear(value: yearController.value.text, errorMsg: null))
      : state = AsyncData(state.requireValue.copyWith.birthYear(
          value: yearController.value.text,
          errorMsg: StringManager.birthYearErrMsg));

  void onPasswordChange() => !isValidPassword(newPassController.value.text)
      ? state = AsyncData(state.requireValue.copyWith.newPassword(
          value: newPassController.value.text,
          errorMsg: StringManager.passwordLengthErrMsg))
      : state = AsyncData(state.requireValue.copyWith
          .newPassword(value: newPassController.value.text, errorMsg: null));
}
