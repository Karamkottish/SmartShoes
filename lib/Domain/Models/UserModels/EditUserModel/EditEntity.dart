import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_shoes/ApplicationLayer/Presentation/Views/_Common/InputField.dart';
import 'package:smart_shoes/Domain/Models/UserModels/UserModel/UserModel.dart';

part 'EditEntity.freezed.dart';

@freezed
class EditEntity with _$EditEntity {
  const EditEntity._();

  const factory EditEntity(
          {required InputField name,
          required InputField email,
          required InputField weight,
          required InputField height,
          @Default(InputField(value: "")) InputField oldPassword,
          @Default(InputField(value: "")) InputField newPassword,
          required InputField birthYear,
          @Default(AsyncValue.data("")) AsyncValue<String> submissionState}) =
      _EditEntity;

  factory EditEntity.fromUserModel(UserModel userModel) => EditEntity(
      name: InputField(value: userModel.name),
      email: InputField(value: userModel.email),
      weight: InputField(value: userModel.weight.toString()),
      height: InputField(value: userModel.height.toString()),
      birthYear: InputField(value: userModel.birthYear.toString()),
      oldPassword: const InputField(value: ""),
      newPassword: const InputField(value: ""));
}
