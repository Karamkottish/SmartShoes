import 'package:freezed_annotation/freezed_annotation.dart';

part 'UserModel.freezed.dart';
part 'UserModel.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel(
      {required String name,
      required String email,
      required double weight,
      required double height,
      required int birthYear,
      required String imgSource}) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  factory UserModel.emptyUserModel() => const UserModel(
      name: "", email: "", weight: 0, height: 0, birthYear: 0, imgSource: "");
}
