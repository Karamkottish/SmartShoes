import 'package:freezed_annotation/freezed_annotation.dart';

part 'LegsSensorsModel.freezed.dart';

part 'LegsSensorsModel.g.dart';

@freezed
class LegsSensorsModel with _$LegsSensorsModel {
  const factory LegsSensorsModel(
      {required int LTO,
      required int LTH,
      required int LLO,
      required int LLH,
      required int LFO,
      required int LFH,
      required int RTO,
      required int RTH,
      required int RLO,
      required int RLH,
      required int RFO,
      required int RFH}) = _LegsSensorsModel;

  factory LegsSensorsModel.fromJson(Map<String, dynamic> json) =>
      _$LegsSensorsModelFromJson(json);
}
