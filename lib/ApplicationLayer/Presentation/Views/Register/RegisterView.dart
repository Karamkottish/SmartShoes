import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_shoes/ApplicationLayer/Presentation/Views/_Common/ToastProvider.dart';
import 'package:smart_shoes/ApplicationLayer/Presentation/Views/Register/RegisterViewModel.dart';
import 'package:smart_shoes/ApplicationLayer/Presentation/_Resources/AssetsManager.dart';
import 'package:smart_shoes/ApplicationLayer/Presentation/_Resources/ColorManager.dart';
import 'package:smart_shoes/ApplicationLayer/Presentation/_Resources/RouteManager.dart';
import 'package:smart_shoes/ApplicationLayer/Presentation/_Resources/StringManager.dart';
import 'package:smart_shoes/ApplicationLayer/Presentation/_Resources/StyleManager.dart';

class RegisterView extends ConsumerStatefulWidget {
  const RegisterView({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _RegisterViewState();
}

class _RegisterViewState extends ConsumerState<RegisterView> {
  TextEditingController userEdtController = TextEditingController();
  TextEditingController emailEdtController = TextEditingController();
  TextEditingController passwordEdtController = TextEditingController();
  TextEditingController rePasswordEdtController = TextEditingController();
  TextEditingController weightEdtController = TextEditingController();
  TextEditingController heightEdtController = TextEditingController();
  TextEditingController birthYearEdtController = TextEditingController();

  @override
  void initState() {
    super.initState();
    ref.listenManual<AsyncValue<String>>(
        registerStateProvider.select((value) => value.currentState),
        (previous, next) => ref.read(toastProvider(context)).show(state: next));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.surface,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          child: Column(
            children: [
              const SizedBox(
                  height: 100,
                  child: Image(image: AssetImage(ImageAssetsManager.Logo))),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Text(StringManager.register,
                    style: Theme.of(context).textTheme.headlineMedium),
              ),
              TextFormField(
                controller: userEdtController,
                onChanged: (val) {
                  ref.read(registerStateProvider.notifier).setUsername(val);
                },
                decoration: InputDecoration(
                    helperText: StringManager.emptyStr,
                    labelText: StringManager.userName,
                    hintText: StringManager.userName,
                    errorText: ref.watch(registerStateProvider.select(
                        (value) => value.registerEntity.userName.errorMsg))),
              ),
              TextFormField(
                controller: emailEdtController,
                onChanged: (val) =>
                    ref.read(registerStateProvider.notifier).setEmail(val),
                decoration: InputDecoration(
                    helperText: StringManager.emptyStr,
                    labelText: StringManager.email,
                    hintText: StringManager.email,
                    errorText: ref.watch(registerStateProvider.select(
                        (value) => value.registerEntity.email.errorMsg))),
              ),
              TextFormField(
                controller: passwordEdtController,
                onChanged: (val) =>
                    ref.read(registerStateProvider.notifier).setPassword(val),
                decoration: InputDecoration(
                    helperText: StringManager.emptyStr,
                    labelText: StringManager.password,
                    hintText: StringManager.password,
                    errorText: ref.watch(registerStateProvider.select(
                        (value) => value.registerEntity.password.errorMsg))),
              ),
              Row(children: [
                Expanded(
                    child: TextFormField(
                        controller: weightEdtController,
                        onChanged: (val) => ref
                            .read(registerStateProvider.notifier)
                            .setWeight(val),
                        decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.fromLTRB(9, 11, 2, 11),
                            suffixIcon: Text(StringManager.kg,
                                style: TextStyleManager.getRegularStyle(
                                    color: ColorManager.secondary)),
                            suffixIconConstraints: const BoxConstraints(
                                minWidth: 20, minHeight: 0),
                            helperText: StringManager.emptyStr,
                            labelText: StringManager.weight,
                            hintText: StringManager.weight,
                            errorText: ref.watch(registerStateProvider.select(
                                (value) =>
                                    value.registerEntity.weight.errorMsg))))),
                const SizedBox(width: 1),
                Expanded(
                    child: TextFormField(
                        controller: heightEdtController,
                        onChanged: (val) => ref
                            .read(registerStateProvider.notifier)
                            .setHeight(val),
                        decoration: InputDecoration(
                          helperText: StringManager.emptyStr,
                          labelText: StringManager.height,
                          hintText: StringManager.height,
                          errorText: ref.watch(registerStateProvider.select(
                              (value) => value.registerEntity.height.errorMsg)),
                          contentPadding:
                              const EdgeInsets.fromLTRB(9, 11, 2, 11),
                          suffixIcon: Text(StringManager.cm,
                              style: TextStyleManager.getRegularStyle(
                                  color: ColorManager.secondary)),
                          suffixIconConstraints:
                              const BoxConstraints(minWidth: 25, minHeight: 0),
                        ))),
                const SizedBox(width: 1),
                Expanded(
                    child: TextFormField(
                        controller: birthYearEdtController,
                        onChanged: (val) => ref
                            .read(registerStateProvider.notifier)
                            .setBirth(val),
                        decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.fromLTRB(9, 11, 2, 11),
                            helperText: StringManager.emptyStr,
                            labelText: StringManager.birthYear,
                            hintText: StringManager.birthYear,
                            errorText: ref.watch(registerStateProvider.select(
                                (value) => value
                                    .registerEntity.birthYear.errorMsg))))),
              ]),
              ElevatedButton(
                  onPressed: !ref.watch(registerStateProvider.notifier
                          .select((value) => value.isValidInput))
                      ? null
                      : () =>
                          ref.read(registerStateProvider.notifier).register(),
                  child: const Text(StringManager.register)),
              TextButton(
                  onPressed: () => Navigator.pushReplacementNamed(
                      context, RouteManager.loginRoute),
                  child: Text(StringManager.login,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: ColorManager.primary)))
            ],
          ),
        ),
      ),
    );
  }
}


Future signUp(String name, String email, String password, double weight,
    double height, int year) async {
  try {
    var usrCred = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    var user = usrCred.user!;
    if (usrCred.user != null) {
      FirebaseFirestore.instance.collection("userInfo").doc("${user.uid}").set({
        "name": name,
        "email": email,
        "weight": weight,
        "height": height,
        "birthYear": year
      });
      FirebaseFirestore.instance
          .collection("legsSensors")
          .doc("${user.uid}")
          .set({
        "LTO": 0,
        "LTH": 0,
        "LLO": 0,
        "LLH": 0,
        "LFO": 0,
        "LFH": 0,
        "RTO": 0,
        "RTH": 0,
        "RLO": 0,
        "RLH": 0,
        "RFO": 0,
        "RFH": 0
      });
      FirebaseFirestore.instance
          .collection("feetSensors")
          .doc("${user.uid}")
          .set({
        "R11": 0,
        "R12": 0,
        "R13": 0,
        "R14": 0,
        "R21": 0,
        "R22": 0,
        "R23": 0,
        "R24": 0,
        "R25": 0,
        "R26": 0,
        "R31": 0,
        "R32": 0
      });
    }
  } on FirebaseAuthException catch (e) {
    print("message is: ${e.message} \nand code is: ${e.code}");
  }
}
