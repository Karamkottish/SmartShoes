import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_shoes/ApplicationLayer/Presentation/Views/Home/SubViews/CircleIndicator/CircleController.dart';
import 'package:smart_shoes/Data/DataSources/LocalStorageDB/LocalSensorsInfoRepo.dart';
import 'package:smart_shoes/Domain/Constants/Enums/CircleContainerStateColor.dart';
import 'package:smart_shoes/Domain/States/CircleState/CircleEntity.dart';
import 'package:smart_shoes/Domain/States/CircleState/CircleState.dart';

final circleControllerProvider =
    StateNotifierProvider.family<CircleController, CircleState, CircleEntity>(
        (ref, CircleEntity circleEntity) {
  return CircleController(circleEntity: circleEntity);
});

final circleContainerColorProvider =
    StateProvider.family((ref, List<CircleEntity> circles) {
  List<int> rankColors = [];
  for (var circle in circles) {
    rankColors.add(ref.watch(circleControllerProvider(circle)
        .select((value) => value.circleStateColor.index)));
  }
  rankColors.sort();
  return CircleContainerStateColor.values.elementAt(rankColors.first);
});

final localSensorsInfoProvider = Provider((ref) => LocalSensorsInfoRepo(ref));
