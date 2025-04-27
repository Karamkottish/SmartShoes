import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_shoes/Domain/Constants/Enums/LegCircleInfo.dart';
import 'package:smart_shoes/Domain/States/CircleState/Range.dart';

part 'CircleEntity.freezed.dart';

@freezed
class CircleEntity with _$CircleEntity {
  const CircleEntity._();

  const factory CircleEntity(
      {required SensorLocation sensorLocation,
      @Default(Range()) Range range,
      required int percentage,
      required UnitInfo unit}) = _CircleEntity;

  factory CircleEntity.emptyHeart(SensorLocation sensorLocation) =>
      CircleEntity(
          sensorLocation: sensorLocation,
          percentage: 0,
          unit: UnitInfo.heartBeat);

  factory CircleEntity.emptyOxygen(SensorLocation sensorLocation) =>
      CircleEntity(
          sensorLocation: sensorLocation, percentage: 0, unit: UnitInfo.o2Rate);
}
