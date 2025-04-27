import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_shoes/ApplicationLayer/Presentation/Views/Edit/EditViewModel.dart';
import 'package:smart_shoes/ApplicationLayer/Presentation/Views/Profile/ProfileViewModel.dart';
import 'package:smart_shoes/Data/DataSources/DataSourcsesProviders.dart';
import 'package:smart_shoes/Domain/Models/UserModels/EditUserModel/EditEntity.dart';
import 'package:smart_shoes/Domain/Models/UserModels/UserModel/UserModel.dart';

final userInfoProvider = FutureProvider((ref) {
  return ref.watch(fireBaseProviderStoreRepo).getCurrentUserInfo();
});

final profileControllerProvider =
    StateNotifierProvider.autoDispose<ProfileController, AsyncValue<UserModel>>(
        (ref) => ProfileController(ref.watch(userInfoProvider)));

final editProvider = StateNotifierProvider.autoDispose<
    EditViewModel,
    AsyncValue<
        EditEntity>>((ref) => ref.watch(userInfoProvider).when(
    data: (data) =>
        EditViewModel(ref,AsyncValue.data(EditEntity.fromUserModel(data)), data),
    error: (error, stackTrace) => EditViewModel(ref,
        AsyncValue.error(error, stackTrace), UserModel.emptyUserModel()),
    loading: () =>
        EditViewModel(ref,const AsyncValue.loading(), UserModel.emptyUserModel())));