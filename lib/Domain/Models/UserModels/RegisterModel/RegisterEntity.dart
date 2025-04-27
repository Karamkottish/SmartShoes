import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_shoes/ApplicationLayer/Presentation/Views/_Common/InputField.dart';
import 'package:smart_shoes/Domain/Models/UserModels/RegisterModel/RegisterReqModel.dart';

part 'RegisterEntity.freezed.dart';

@freezed
class RegisterEntity with _$RegisterEntity {
  const RegisterEntity._();

  const factory RegisterEntity(
      {required InputField userName,
      required InputField email,
      required InputField password,
      required InputField weight,
      required InputField height,
      required InputField birthYear}) = _RegisterEntity;

  factory RegisterEntity.empty() => const RegisterEntity(
      userName: InputField(value: ""),
      email: InputField(value: ""),
      password: InputField(value: ""),
      weight: InputField(value: ""),
      height: InputField(value: ""),
      birthYear: InputField(value: ""));

  RegisterReqModel getRegisterStrings() {
    return RegisterReqModel(
        name: userName.value,
        email: email.value,
        password: password.value,
        weight: double.tryParse(weight.value) ?? -1,
        height: double.tryParse(height.value) ?? -1,
        birthYear: int.tryParse(birthYear.value) ?? -1,
        imgSource: "");
  }
}
