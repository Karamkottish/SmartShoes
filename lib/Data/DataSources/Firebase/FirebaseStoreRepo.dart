import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_shoes/Data/DataSources/DataSourcsesProviders.dart';
import 'package:smart_shoes/Data/DataSources/StoreRepository.dart';
import 'package:smart_shoes/Domain/Models/UserModels/UserModel/UserModel.dart';

class FirebaseStoreRepository extends StateNotifier<AsyncValue<void>>
    implements StoreRepository {
  FirebaseFirestore fireStore;
  Ref ref;

  FirebaseStoreRepository({
    required this.fireStore,
    required this.ref,
  }) : super(const AsyncValue.data(null));

  @override
  Future<UserModel> getCurrentUserInfo() async {
    var userDoc = await _getUserDoc().get();
    return UserModel.fromJson(userDoc.data()!);
  }

  @override
  Future<void> saveUserInfo(UserModel userModel) async {
    await _getUserDoc().set(userModel.toJson());
  }

  Future<AsyncValue<void>> updateUserInfo(UserModel userModel) async=>
    await AsyncValue.guard(() => _getUserDoc().update(userModel.toJson()));


  DocumentReference<Map<String, dynamic>> _getUserDoc() => fireStore
      .collection("users")
      .doc(ref.read(fireBaseProviderAuthRepo).getCurrentUser!.uid);
}
