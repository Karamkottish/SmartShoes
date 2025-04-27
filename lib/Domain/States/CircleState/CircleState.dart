import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_shoes/ApplicationLayer/Presentation/_Resources/ColorManager.dart';
import 'package:smart_shoes/Domain/Constants/Enums/CircleStateColor.dart';
import 'package:smart_shoes/Domain/Constants/Enums/LegCircleInfo.dart';
import 'package:smart_shoes/Domain/States/CircleState/CircleEntity.dart';

part 'CircleState.freezed.dart';

enum CircleCurrentState { critical, serious, stable }

@freezed
class CircleState with _$CircleState {
  const CircleState._();

  const factory CircleState(
      {required CircleStateColor circleStateColor,
      required CircleEntity circleEntity}) = _CircleState;

  factory CircleState.emptyOxygen(SensorLocation sensorLocation) => CircleState(
      circleStateColor: CircleStateColor.serious,
      circleEntity: CircleEntity.emptyOxygen(sensorLocation));

  factory CircleState.emptyHeart(SensorLocation sensorLocation) => CircleState(
      circleStateColor: CircleStateColor.serious,
      circleEntity: CircleEntity.emptyOxygen(sensorLocation));

  CircleCurrentState getCurrentPercentState() {
    return circleEntity.range.isValCritical(circleEntity.percentage)
        ? CircleCurrentState.critical
        : circleEntity.range.isValSerious(circleEntity.percentage)
            ? CircleCurrentState.serious
            : CircleCurrentState.stable;
  }
}
