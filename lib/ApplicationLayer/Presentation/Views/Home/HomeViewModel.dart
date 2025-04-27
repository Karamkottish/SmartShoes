import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_shoes/Data/Models.dart';
import 'package:smart_shoes/Data/Providers/ConstantCircleProviders.dart';
import 'package:smart_shoes/Data/Providers/LegSensorsProviders.dart';
import 'package:smart_shoes/Domain/States/CircleState/CircleEntity.dart';
import 'package:smart_shoes/Domain/States/CircleState/CircleState.dart';

class HomeViewModel extends StateNotifier<AsyncValue> {
  Ref ref;

  HomeViewModel(this.ref, super.state);

  void changeValues() {
    late LegsSensorsModel model =
        LegsSensorsModel(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
    _changeCircleValue(circleProviderLTO, model.LTO);
    _changeCircleValue(circleProviderLTH, model.LTH);
    _changeCircleValue(circleProviderLLO, model.LLO);
    _changeCircleValue(circleProviderLLH, model.LLH);
    _changeCircleValue(circleProviderLFO, model.LFO);
    _changeCircleValue(circleProviderLFH, model.LFH);
    _changeCircleValue(circleProviderRTO, model.RTO);
    _changeCircleValue(circleProviderRTH, model.RTH);
    _changeCircleValue(circleProviderRLO, model.RLO);
    _changeCircleValue(circleProviderRLH, model.RLH);
    _changeCircleValue(circleProviderRFO, model.RFO);
    _changeCircleValue(circleProviderRFH, model.RFH);
  }

  void _changeCircleValue(Provider<CircleState> circleProvider, int value) =>
      ref
          .read(circleControllerProvider(_getCircleEntity(circleProvider))
              .notifier)
          .setPercent(value);

  CircleEntity _getCircleEntity(Provider<CircleState> circle) =>
      ref.read(circle).circleEntity;
}
