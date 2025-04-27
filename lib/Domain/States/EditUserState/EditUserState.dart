import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_shoes/Domain/Models/UserModels/EditUserModel/EditEntity.dart';

part 'EditUserState.freezed.dart';


@freezed
class EditState with _$EditState {
  const factory EditState(
      {required EditEntity editEntity, @Default(AsyncValue.loading()) AsyncValue<
          void> state}) = _EditState;
}