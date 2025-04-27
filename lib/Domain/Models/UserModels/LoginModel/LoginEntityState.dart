import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'LoginEntity.dart';

part 'LoginEntityState.freezed.dart';

@freezed
class LoginEntityState with _$LoginEntityState {
  const factory LoginEntityState(
      {required LoginEntity loginEntity,
      @Default(AsyncValue.data(""))
          AsyncValue<String> currentState}) = _LoginEntityState;
}
