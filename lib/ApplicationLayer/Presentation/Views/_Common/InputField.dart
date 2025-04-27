import 'package:freezed_annotation/freezed_annotation.dart';

part 'InputField.freezed.dart';

@freezed
class InputField with _$InputField {
  const factory InputField(
      {required String value,
      @Default(null) String? errorMsg,
      @Default(false) bool isValid}) = _InputField;
}
