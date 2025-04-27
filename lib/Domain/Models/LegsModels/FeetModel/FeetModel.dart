import 'package:freezed_annotation/freezed_annotation.dart';

part 'FeetModel.freezed.dart';

part 'FeetModel.g.dart';

@freezed
class FeetModel with _$FeetModel {
  const factory FeetModel(
      {required int R11,
      required int R12,
      required int R13,
      required int R14,
      required int R21,
      required int R22,
      required int R23,
      required int R24,
      required int R25,
      required int R26,
      required int R31,
      required int R32}) = _FeetModel;

  factory FeetModel.fromJson(Map<String, dynamic> json) =>
      _$FeetModelFromJson(json);
}
