import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_shoes/Domain/Constants/Enums/LegCircleInfo.dart';
import 'package:smart_shoes/Domain/States/CircleState/CircleState.dart';

final circleProvidersList = Provider((ref) => [
      circleProviderLTO,
      circleProviderLTH,
      circleProviderLLO,
      circleProviderLLH,
      circleProviderLFO,
      circleProviderLFH,
      circleProviderRTO,
      circleProviderRTH,
      circleProviderRLO,
      circleProviderRLH,
      circleProviderRFO,
      circleProviderRFH
    ]);

final circleProviderLTO =
    Provider((ref) => CircleState.emptyOxygen(SensorLocation.LTO));

final circleProviderLTH =
    Provider((ref) => CircleState.emptyHeart(SensorLocation.LTH));

final circleProviderLLO =
    Provider((ref) => CircleState.emptyOxygen(SensorLocation.LLO));

final circleProviderLLH =
    Provider((ref) => CircleState.emptyHeart(SensorLocation.LLH));

final circleProviderLFO =
    Provider((ref) => CircleState.emptyOxygen(SensorLocation.LFO));

final circleProviderLFH =
    Provider((ref) => CircleState.emptyHeart(SensorLocation.LFH));

final circleProviderRTO =
    Provider((ref) => CircleState.emptyOxygen(SensorLocation.RTO));

final circleProviderRTH =
    Provider((ref) => CircleState.emptyHeart(SensorLocation.RTH));

final circleProviderRLO =
    Provider((ref) => CircleState.emptyOxygen(SensorLocation.RLO));

final circleProviderRLH =
    Provider((ref) => CircleState.emptyHeart(SensorLocation.RLH));

final circleProviderRFO =
    Provider((ref) => CircleState.emptyOxygen(SensorLocation.RFO));

final circleProviderRFH =
    Provider((ref) => CircleState.emptyHeart(SensorLocation.RFH));
