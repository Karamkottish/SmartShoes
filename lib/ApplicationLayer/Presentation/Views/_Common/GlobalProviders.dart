import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_shoes/ApplicationLayer/Presentation/_Resources/StringManager.dart';

mixin GlobalProvider{
  static Provider<RegExp> mailValidationProvider = Provider((ref) =>
      RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"));
  static Provider<Type> stringManagerProvider = Provider((ref) => StringManager);
}