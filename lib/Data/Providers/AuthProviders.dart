import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_shoes/Data/DataSources/LocalStorageDB/SharedPrefAuthRepo.dart';

Provider sharedPrefRepoProvider = Provider((ref) {
  return SharedPrefRepo();
});


final sharedPrefProvider = FutureProvider((ref) async {
  return await SharedPreferences.getInstance();
});