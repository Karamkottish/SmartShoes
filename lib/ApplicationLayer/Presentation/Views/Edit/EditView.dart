import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_shoes/ApplicationLayer/Presentation/Views/_Common/ToastProvider.dart';
import 'package:smart_shoes/ApplicationLayer/Presentation/_Resources/ValueManager.dart';
import 'package:smart_shoes/Data/DataBaseModel.dart';
import 'package:smart_shoes/Data/FirebaseModel.dart';
import 'package:smart_shoes/Data/Models.dart';
import 'package:smart_shoes/ApplicationLayer/Presentation/_Resources/ColorManager.dart';
import 'package:smart_shoes/ApplicationLayer/Presentation/_Resources/RouteManager.dart';
import 'package:smart_shoes/ApplicationLayer/Presentation/_Resources/StyleManager.dart';
import 'package:smart_shoes/Data/Providers/ProfileProviders.dart';

import '../../_Resources/StringManager.dart';

class EditView1 extends ConsumerStatefulWidget {
  const EditView1({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _EditView1State();
}

class _EditView1State extends ConsumerState<EditView1> {
  @override
  void initState() {
    super.initState();
    ref.listenManual<AsyncValue<String>>(
        editProvider.select((value) => value.requireValue.submissionState),
        (previous, next) => ref.read(toastProvider(context)).show(state: next));
  }

  @override
  Widget build(BuildContext context) {
    return contentWidget();
  }

  Widget contentWidget() => Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(AppSizeManager.s50),
            child: AppBar(
              title: const Text(StringManager.editProfile),
            )),
        backgroundColor: ColorManager.surface,
        body: SingleChildScrollView(
          child: ref.watch(editProvider).when(
              data: (data) => Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: AppPaddingManager.p18,
                        horizontal: AppPaddingManager.p12),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        TextFormField(
                            controller: ref
                                .watch(editProvider.notifier)
                                .usrNameController,
                            decoration: InputDecoration(
                                helperText: StringManager.emptyStr,
                                labelText: StringManager.userName,
                                hintText: StringManager.userName,
                                errorText: data.name.errorMsg),
                            onChanged: (_) =>
                                ref.read(editProvider.notifier).onNameChange()),

                        // numbered info
                        Row(children: [
                          Expanded(
                              child: TextFormField(
                            controller: ref
                                .watch(editProvider.notifier)
                                .weightController,
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.fromLTRB(
                                    AppPaddingManager.p9,
                                    AppPaddingManager.p11,
                                    AppPaddingManager.p2,
                                    AppPaddingManager.p11),
                                suffixIcon: Text(StringManager.kg,
                                    style: TextStyleManager.getRegularStyle(
                                        color: ColorManager.secondary)),
                                suffixIconConstraints: const BoxConstraints(
                                    minWidth: AppSizeManager.s25,
                                    minHeight: AppSizeManager.s0),
                                helperText: StringManager.emptyStr,
                                labelText: StringManager.weight,
                                hintText: StringManager.weight,
                                errorText: data.weight.errorMsg),
                            onChanged: (_) => ref
                                .read(editProvider.notifier)
                                .onWeightChange(),
                          )),
                          const SizedBox(width: 1),
                          Expanded(
                              child: TextFormField(
                                  controller: ref
                                      .watch(editProvider.notifier)
                                      .heightController,
                                  decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.fromLTRB(
                                          AppPaddingManager.p9,
                                          AppPaddingManager.p11,
                                          AppPaddingManager.p2,
                                          AppPaddingManager.p11),
                                      suffixIcon: Text(StringManager.cm,
                                          style:
                                              TextStyleManager.getRegularStyle(
                                                  color:
                                                      ColorManager.secondary)),
                                      suffixIconConstraints:
                                          const BoxConstraints(
                                              minWidth: AppSizeManager.s25,
                                              minHeight: AppSizeManager.s0),
                                      helperText: StringManager.emptyStr,
                                      labelText: StringManager.height,
                                      hintText: StringManager.height,
                                      errorText: data.height.errorMsg),
                                  onChanged: (_) => ref
                                      .read(editProvider.notifier)
                                      .onHeightChange())),
                          Expanded(
                              child: TextFormField(
                                  controller: ref
                                      .watch(editProvider.notifier)
                                      .yearController,
                                  decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.fromLTRB(
                                          AppPaddingManager.p9,
                                          AppPaddingManager.p11,
                                          AppPaddingManager.p2,
                                          AppPaddingManager.p11),
                                      helperText: StringManager.emptyStr,
                                      labelText: StringManager.birthYear,
                                      hintText: StringManager.birthYear,
                                      errorText: data.birthYear.errorMsg),
                                  onChanged: (_) => ref
                                      .read(editProvider.notifier)
                                      .onBirthYearChange())),
                        ]),
                        TextFormField(
                          controller: ref
                              .watch(editProvider.notifier)
                              .newPassController,
                          decoration: InputDecoration(
                              helperText: StringManager.emptyStr,
                              labelText: StringManager.newPassword,
                              hintText: StringManager.newPassword,
                              errorText: data.newPassword.errorMsg),
                          onChanged: (value) => ref
                              .read(editProvider.notifier)
                              .onPasswordChange(),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: AppPaddingManager.p200),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      foregroundColor: ColorManager.primary,
                                      backgroundColor: ColorManager.surface,
                                      side: const BorderSide(
                                          width: AppSizeManager.s3,
                                          color: ColorManager.primary),
                                    ),
                                    onPressed: () =>
                                        Navigator.pushReplacementNamed(
                                            context, RouteManager.homeRoute),
                                    child: const Text(StringManager.cancel)),
                                ElevatedButton(
                                    onPressed: () => ref
                                        .read(editProvider.notifier)
                                        .updateUserInfo(),
                                    child: const Text(StringManager.confirm))
                              ]),
                        )
                      ],
                    ),
                  ),
              error: (error, stackTrace) =>
                  Center(child: Text("Something went wrong :(\n error:$error")),
              loading: () => const Center(child: CircularProgressIndicator())),
        ),
      );
}
