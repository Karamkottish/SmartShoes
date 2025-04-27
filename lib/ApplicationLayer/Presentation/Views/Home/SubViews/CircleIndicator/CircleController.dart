import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_shoes/Domain/Constants/Enums/LegCircleInfo.dart';
import 'package:smart_shoes/Domain/States/CircleState/CircleEntity.dart';
import 'package:smart_shoes/Domain/States/CircleState/CircleState.dart';
import 'package:smart_shoes/Domain/Constants/Enums/CircleStateColor.dart';
import 'package:smart_shoes/Domain/States/CircleState/Range.dart';




class CircleController extends StateNotifier<CircleState> {

  CircleController({required CircleEntity circleEntity})
      : super(CircleState(
            circleStateColor: CircleStateColor.critical,
            circleEntity: circleEntity));

  void setPercent(int percent) =>
      state = state.copyWith.circleEntity(percentage: percent);

  void _setColor() {
    var currentValueState = state.getCurrentPercentState();
    currentValueState == CircleCurrentState.stable
        ? state = state.copyWith(circleStateColor: CircleStateColor.stable)
        : currentValueState == CircleCurrentState.serious
            ? state = state.copyWith(circleStateColor: CircleStateColor.serious)
            : state =
                state.copyWith(circleStateColor: CircleStateColor.critical);
  }

  void inc() {
    if (state.circleEntity.percentage == 100) {
      setPercent(0);
      _setColor();
      return;
    }
    setPercent(state.circleEntity.percentage + 10);
    _setColor();
  }

}

//*******************

final circleColorProvider = StateNotifierProvider.family<CircleColorController,
    CircleStateColor, CircleEntity>((ref, CircleEntity entity) {
  return CircleColorController(ref, entity);
});

class CircleColorController extends StateNotifier<CircleStateColor> {
  Ref ref;
  late CircleEntity ent;

  CircleColorController(this.ref, CircleEntity entity)
      : super(CircleStateColor.stable) {
    ent = entity;
    ref.listen<int>(circleProvider(entity).select((value) => value.percentage),
        (previous, next) {
      var oldCondition =
          ref.read(circleProvider(entity)).range.getCondition(previous ?? next);
      var newCondition =
          ref.read(circleProvider(entity)).range.getCondition(next);

      if (oldCondition != newCondition) {
        switch (newCondition) {
          case ValCondition.stable:
            state = CircleStateColor.stable;
            break;
          case ValCondition.serious:
            state = CircleStateColor.serious;
            break;
          case ValCondition.critical:
            state = CircleStateColor.critical;
            break;
        }
      }
    });
  }
}

final circleUnitTextProvider =
    Provider.family<UnitInfo, CircleEntity>((ref, CircleEntity entity) {
  return entity.unit;
});

final stringProvider = Provider((ref) => "test");

final circleProvider = StateNotifierProvider.family<
    CircleEntityController,
    CircleEntity,
    CircleEntity>((ref, arg) => CircleEntityController(circleEntity: arg));

class CircleEntityController extends StateNotifier<CircleEntity> {
  CircleEntityController({required CircleEntity circleEntity})
      : super(circleEntity);

  void setPercent(int percent) {
    state = state.copyWith(percentage: percent);
  }
}
