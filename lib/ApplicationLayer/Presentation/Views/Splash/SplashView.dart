import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_shoes/ApplicationLayer/Presentation/Views/Login/LoginView.dart';
import 'package:smart_shoes/ApplicationLayer/Presentation/Views/NavigationWidget/NavigationWidgetView.dart';
import 'package:smart_shoes/ApplicationLayer/Presentation/_Resources/AssetsManager.dart';
import 'package:smart_shoes/ApplicationLayer/Presentation/_Resources/ColorManager.dart';
import 'package:smart_shoes/Data/DataSources/DataSourcsesProviders.dart';


class SplashView extends ConsumerStatefulWidget {
  const SplashView({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _SplashViewState();
}

class _SplashViewState extends ConsumerState<SplashView> {
  Timer? timer;

  void _startTimer() => timer = Timer(const Duration(seconds: 5), _goNext);

  void _goNext() {}

  @override
  void initState() {
    super.initState();
    ref.read(fireBaseProviderAuthRepo).logout();
    _startTimer();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<AsyncValue<User?>>(fireBaseProviderAuthStream, (previous, next) {
      print("Entered Splash");
      next.when(data: (data) async {
        await Future.delayed(const Duration(seconds: 3));
        data == null?
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => const LoginView())):
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => const NavigationView()));
      }, error: (error, stackTrace) {
        print("there is error");
      }, loading: () {
        print("now loading");
      });
    });
    return const Scaffold(
      backgroundColor: ColorManager.surface,
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(image: AssetImage(ImageAssetsManager.LogoWithWords)),
              SizedBox(height: 100),
              CircularProgressIndicator(color: ColorManager.primary)
            ]),
      ),
    );
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }
}
