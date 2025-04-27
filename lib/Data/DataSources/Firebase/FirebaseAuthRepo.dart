import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_shoes/Data/DataSources/AuthRepository.dart';
import 'package:smart_shoes/Data/DataSources/DataSourcsesProviders.dart';
import 'package:smart_shoes/Domain/Models/UserModels/LoginModel/LoginReqModel.dart';
import 'package:smart_shoes/Domain/Models/UserModels/RegisterModel/RegisterReqModel.dart';

class FirebaseAuthRepository extends StateNotifier<AsyncValue<void>>
    implements AuthRepository {
  Ref ref;
  FirebaseAuth auth;
  FirebaseFirestore fireStore;

  FirebaseAuthRepository(
      {required this.ref, required this.auth, required this.fireStore})
      : super(const AsyncData(null));

  Stream<User?> get authStateStream {
    return auth.userChanges();
  }

  User? get getCurrentUser => auth.currentUser;

  Future<AsyncValue<UserCredential>> createUser(
      RegisterReqModel registerModel) async {
    var result = await AsyncValue.guard(() =>
        auth.createUserWithEmailAndPassword(
            email: registerModel.email, password: registerModel.password));
    result.whenData((value) async {
      await ref
          .read(fireBaseProviderStoreRepo)
          .saveUserInfo(registerModel.getUserModel());
      return;
    });
    return result;
  }

  Future<AsyncValue<UserCredential>> login(LoginReqModel loginReqModel) async =>
      await AsyncValue.guard(() => auth.signInWithEmailAndPassword(
          email: loginReqModel.email, password: loginReqModel.password));

  Future<AsyncValue<void>> updatePassword(String newPassword)async=>
    await AsyncValue.guard(() => getCurrentUser!.updatePassword(newPassword));

  @override
  Future<void> logout() async {}

  @override
  Future<AsyncValue<UserCredential>> getUserData() {
    throw UnimplementedError();
  }
}
