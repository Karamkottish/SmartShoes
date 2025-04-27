

import 'package:smart_shoes/Domain/Models/UserModels/UserModel/UserModel.dart';

abstract class StoreRepository{

  Future<void> saveUserInfo(UserModel userModel);

  Future<UserModel> getCurrentUserInfo();



}