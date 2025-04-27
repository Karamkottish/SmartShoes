import 'package:flutter/material.dart';
import 'package:smart_shoes/ApplicationLayer/Presentation/Views/Edit/EditView.dart';
import 'package:smart_shoes/ApplicationLayer/Presentation/Views/Feet/FeetView.dart';
import 'package:smart_shoes/ApplicationLayer/Presentation/Views/ForgotPassword/ForgotPasswordView.dart';
import 'package:smart_shoes/ApplicationLayer/Presentation/Views/Graph/GraphView.dart';
import 'package:smart_shoes/ApplicationLayer/Presentation/Views/NavigationWidget/NavigationWidgetView.dart';
import 'package:smart_shoes/ApplicationLayer/Presentation/Views/Login/LoginView.dart';
import 'package:smart_shoes/ApplicationLayer/Presentation/Views/Profile/ProfileView.dart';
import 'package:smart_shoes/ApplicationLayer/Presentation/Views/Register/RegisterView.dart';
import 'package:smart_shoes/ApplicationLayer/Presentation/Views/Splash/SplashView.dart';
import 'package:smart_shoes/ApplicationLayer/Presentation/Views/Splash/testWidget.dart';

class RouteManager {
  static const String splashRoute = "/";
  static const String loginRoute = "/Login";
  static const String registerRoute = "/Register";
  static const String forgotPassRoute = "/ForgotPassword";
  static const String homeRoute = "/Home";
  static const String graphRoute = "/Graph";
  static const String feetRoute = "/Feet";
  static const String profileRoute = "/Profile";
  static const String editRoute = "/Edit";
  static const String testRoute = "/Test";

  static Route<dynamic> myRouteGenerator(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RouteManager.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case RouteManager.loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginView());
      case RouteManager.registerRoute:
        return MaterialPageRoute(builder: (_) => const RegisterView());
      case RouteManager.forgotPassRoute:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordView());
      case RouteManager.homeRoute:
        return MaterialPageRoute(builder: (_) => const NavigationView());
      case RouteManager.graphRoute:
        return MaterialPageRoute(builder: (_) => const GraphView());
      case RouteManager.feetRoute:
        return MaterialPageRoute(builder: (_) => const FeetView());
      case RouteManager.profileRoute:
        return MaterialPageRoute(builder: (_) => const ProfileView());
      case RouteManager.editRoute:
        return MaterialPageRoute(builder: (_) => const EditView1());
      case RouteManager.testRoute:
        return MaterialPageRoute(builder: (context) => const TestWidget());
      default:
        return MaterialPageRoute(builder: (_) => const HomeView());
    }
  }
}
