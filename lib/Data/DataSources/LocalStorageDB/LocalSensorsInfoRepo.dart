import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_shoes/Data/Providers/AuthProviders.dart';



class LocalSensorsInfoRepo {
  Ref ref;

  LocalSensorsInfoRepo(this.ref);

  Future<void> init() async {
    ref.read(sharedPrefProvider).whenData((value) => value.get);
  }

  Future<void> setLocalSensors() async {}
}
