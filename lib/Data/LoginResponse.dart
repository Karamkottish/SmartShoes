import 'package:smart_shoes/Data/LoginRequest.dart';
import 'package:smart_shoes/Data/Models.dart';

abstract class LoginCallBack{
  void onLoginSuccess(Person person);
  void onLoginFailed(String error);
}

class LoginResponse{
  LoginCallBack callBack;
  LoginRequest loginRequest = LoginRequest();
  LoginResponse(this.callBack);

  doLogin(String email, String password) {
    loginRequest.getLogin(email, password).
    then((person) => callBack.onLoginSuccess(person!)).
    catchError((error) => callBack.onLoginFailed(error.toString()));
  }

}