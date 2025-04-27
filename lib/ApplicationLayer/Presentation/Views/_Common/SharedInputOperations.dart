mixin SharedUserOperations{
  RegExp mailValidator = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  bool isValidEmail(String val) => mailValidator.hasMatch(val);
  bool isValidPassword(String val) => val.length> 6;
  bool isValidUserName(String val) => val.length>0;
  bool isValidWeight(String val) => (double.tryParse(val) ?? -1) > 0;
  bool isValidHeight (String val) => (double.tryParse(val) ?? -1) > 0;
  bool isValidBirth(String val) => (int.tryParse(val) ?? -1) > 1900;


}