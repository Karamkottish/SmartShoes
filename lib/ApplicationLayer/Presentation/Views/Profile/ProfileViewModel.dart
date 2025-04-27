import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_shoes/ApplicationLayer/Presentation/_Resources/StringManager.dart';
import 'package:smart_shoes/Domain/Models/UserModels/UserModel/UserModel.dart';



class ProfileController extends StateNotifier<AsyncValue<UserModel>> {
  ProfileController(super._state);

  String get welcome => "${StringManager.hi}, ${state.value?.name}";

  String get email => "${StringManager.email}: ${state.value?.email}";

  String get age =>
      "${StringManager.age}: ${DateTime.now().year - (state.value?.birthYear ?? 0)} ${StringManager.yearsOld}";

  String get weight =>
      "${StringManager.weight}: ${state.value?.weight} ${StringManager.kg}";

  String get height =>
      "${StringManager.height}: ${state.value?.height} ${StringManager.cm}";
}
