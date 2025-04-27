import 'package:smart_shoes/Data/DataSources/StoreRepository.dart';
import 'package:smart_shoes/Domain/Models/UserModels/UserModel/UserModel.dart';

class LocalStoreRepo implements StoreRepository {
  @override
  Future<UserModel> getCurrentUserInfo() {
    // TODO: implement getUserInfo
    throw UnimplementedError();
  }

  @override
  Future<void> saveUserInfo(UserModel userModel) {
    // TODO: implement saveUserInfo
    throw UnimplementedError();
  }
}
