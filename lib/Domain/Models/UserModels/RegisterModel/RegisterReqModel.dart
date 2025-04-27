import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_shoes/Domain/Models/UserModels/UserModel/UserModel.dart';

part 'RegisterReqModel.freezed.dart';

part 'RegisterReqModel.g.dart';

@freezed
class RegisterReqModel with _$RegisterReqModel {
  const RegisterReqModel._();

  const factory RegisterReqModel(
      {required String name,
      required String email,
      required String password,
      required double weight,
      required double height,
      required int birthYear,
      required String imgSource}) = _RegisterReqModel;

  factory RegisterReqModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterReqModelFromJson(json);

  UserModel getUserModel() => UserModel(
      name: name,
      email: email,
      weight: weight,
      height: height,
      birthYear: birthYear,
      imgSource: imgSource);
}
