import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_shoes/ApplicationLayer/Presentation/Views/_Common/InputField.dart';
import 'package:smart_shoes/ApplicationLayer/Presentation/_Resources/StringManager.dart';
import 'package:smart_shoes/Domain/Models/UserModels/LoginModel/LoginReqModel.dart';

part 'LoginEntity.freezed.dart';

@freezed
class LoginEntity with _$LoginEntity {
  const LoginEntity._();

  const factory LoginEntity(
      {required InputField email, required InputField password}) = _LoginEntity;

  factory LoginEntity.empty() => const LoginEntity(
      email: InputField(value: StringManager.emptyStr, errorMsg: null),
      password: InputField(value: StringManager.emptyStr, errorMsg: null));

  LoginReqModel getLoginStrings() =>
      LoginReqModel(email: email.value, password: password.value);
}
