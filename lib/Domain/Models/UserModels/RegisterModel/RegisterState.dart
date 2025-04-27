import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_shoes/Domain/Models/UserModels/RegisterModel/RegisterEntity.dart';

part 'RegisterState.freezed.dart';

@freezed
class RegisterState with _$RegisterState {
  const factory RegisterState(
      {required RegisterEntity registerEntity,
      @Default(AsyncValue.data("")) AsyncValue<String> currentState}) = _RegisterState;
}
