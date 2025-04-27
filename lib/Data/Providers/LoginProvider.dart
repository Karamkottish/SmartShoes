import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_shoes/ApplicationLayer/Presentation/Views/Login/LoginViewModel.dart';
import 'package:smart_shoes/Data/DataSources/DataSourcsesProviders.dart';
import 'package:smart_shoes/Domain/Models/UserModels/LoginModel/LoginEntityState.dart';

final loginProvider =
    StateNotifierProvider<LoginViewModel, LoginEntityState>((ref) {
  ref.listen<User?>(fireBaseProviderAuthStream.select((value) => value.value),
      (previous, next) {
    print("inside LoginProvider, something happened");
  });
  return LoginViewModel(ref);
});
