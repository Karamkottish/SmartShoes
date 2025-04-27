import 'package:smart_shoes/Data/DataBaseModel.dart';

import 'Models.dart';

class LoginRequest{
  DataBase db = DataBase.instance;
  Future<Person?> getLogin(String email, String password) async{
    var result = await db.login(email, password);
    return result;

}


}