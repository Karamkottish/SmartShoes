import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_shoes/ApplicationLayer/Presentation/Views/_Common/ToastProvider.dart';
import 'package:smart_shoes/ApplicationLayer/Presentation/_Resources/ColorManager.dart';
import 'package:smart_shoes/ApplicationLayer/Presentation/_Resources/RouteManager.dart';
import 'package:smart_shoes/ApplicationLayer/Presentation/_Resources/StringManager.dart';
import 'package:smart_shoes/Data/Providers/LoginProvider.dart';
import '../../_Resources/AssetsManager.dart';

class LoginView extends ConsumerStatefulWidget {
  const LoginView({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {
  TextEditingController emailTextEdtController = TextEditingController();
  TextEditingController passwordTextEdtController = TextEditingController();

  @override
  void initState() {
    super.initState();

    ref.listenManual<AsyncValue<String>>(
        loginProvider.select(
                (value) => value.currentState),
            (previous, next) =>
            ref.read(toastProvider(context)).show(state: next));

  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: ColorManager.surface,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                const Image(image: AssetImage(ImageAssetsManager.Logo)),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 50),
                  child: Text(StringManager.welcome,
                      style: Theme.of(context).textTheme.headlineMedium),
                ),
                TextFormField(
                  controller: emailTextEdtController,
                  onChanged: (value) =>
                      ref.read(loginProvider.notifier).setEmail(value),
                  decoration: InputDecoration(
                      helperText: StringManager.emptyStr,
                      labelText: StringManager.email,
                      hintText: StringManager.email,
                      errorText: ref.watch(loginProvider.select(
                          (value) => value.loginEntity.email.errorMsg))),
                ),
                TextFormField(
                  controller: passwordTextEdtController,
                  onChanged: (value) =>
                      ref.read(loginProvider.notifier).setPassword(value),
                  decoration: InputDecoration(
                      helperText: StringManager.emptyStr,
                      labelText: StringManager.password,
                      hintText: StringManager.password,
                      errorText: ref.watch(loginProvider.select(
                          (value) => value.loginEntity.password.errorMsg))),
                ),
                ElevatedButton(
                    onPressed: ref.watch(loginProvider.notifier).isValidInput
                        ? () async =>
                            ref.read(loginProvider.notifier).login(context)
                        : null,
                    child: const Text(StringManager.login)),
                const SizedBox(height: 40),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                          onPressed: () => Navigator.pushReplacementNamed(
                              context, RouteManager.forgotPassRoute),
                          child: Text(StringManager.forgotPassword,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(color: ColorManager.primary))),
                      TextButton(
                          onPressed: () => Navigator.pushReplacementNamed(
                              context, RouteManager.registerRoute),
                          child: Text(StringManager.register,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(color: ColorManager.primary)))
                    ])
              ],
            ),
          ),
        ),
      );
}
