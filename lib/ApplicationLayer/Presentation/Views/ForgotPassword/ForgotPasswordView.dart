import 'package:flutter/material.dart';
import 'package:smart_shoes/ApplicationLayer/Presentation/_Resources/AssetsManager.dart';
import 'package:smart_shoes/ApplicationLayer/Presentation/_Resources/ColorManager.dart';
import 'package:smart_shoes/ApplicationLayer/Presentation/_Resources/RouteManager.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  TextEditingController emailEdtController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.surface,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                const SizedBox(
                    height: 100,
                    child: Image(image: AssetImage(ImageAssetsManager.Logo))),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Text("Forgot Password",
                      style: Theme.of(context).textTheme.headlineMedium),
                ),
                Text("Enter E-mail to send a reset password massage",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: ColorManager.secondary)),
                const SizedBox(height: 5),
                TextFormField(
                  controller: emailEdtController,
                  validator: (String? _) => emailEdtController.value.text.isEmpty? "enter an email" : null,
                  decoration: const InputDecoration(
                    helperText: "",
                    labelText: "E-mail",
                    hintText: "E-mail",
                  )
                ),
                ElevatedButton(onPressed: (){
                  //bool isValid = _formKey.currentState!.validate();

                }, child: const Text("Send Massage")),
                const SizedBox(height: 230),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  TextButton(onPressed: () => Navigator.pushReplacementNamed(context, RouteManager.registerRoute), child: Text("Register", style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: ColorManager.primary))),
                  TextButton(onPressed: () => Navigator.pushReplacementNamed(context, RouteManager.loginRoute), child: Text("Login", style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: ColorManager.primary)))
                ],)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
