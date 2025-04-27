import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


abstract class AuthRepository{

  Future<AsyncValue<UserCredential>> getUserData();
  Future<void> logout();
}