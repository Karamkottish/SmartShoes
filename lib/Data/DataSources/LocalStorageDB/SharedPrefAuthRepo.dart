import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_shoes/Data/DataSources/AuthRepository.dart';



class SharedPrefRepo extends AuthRepository {
  @override
  Future<void> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  Future<void> saveUserInfo(UserCredential userCredential) async {

  }

  @override
  Future<AsyncValue<UserCredential>> getUserData() {
    // TODO: implement getUserData
    throw UnimplementedError();
  }
}
