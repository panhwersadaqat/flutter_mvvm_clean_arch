import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mvvm_clearn_arch/utils/routes/routes_name.dart';
import 'package:flutter_mvvm_clearn_arch/view/home_screen.dart';
import 'package:flutter_mvvm_clearn_arch/view/login_screen.dart';
import 'package:flutter_mvvm_clearn_arch/view/signup_screen.dart';

import '../../view/onboarding/onboarding_screen.dart';

class Routes {
  
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch(settings.name) {
      case RoutesName.onboarding:
        return MaterialPageRoute(builder: (BuildContext context) => OnboardingScreen());
      case RoutesName.home:
        return MaterialPageRoute(builder: (BuildContext context) => HomeScreen());
      case RoutesName.login:
        return MaterialPageRoute(builder: (BuildContext context) => LoginScreen());
      case RoutesName.signup:
        return MaterialPageRoute(builder: (BuildContext context) => SignUpScreen());
      default:
        return MaterialPageRoute(builder: (_){
          return const Scaffold(
            body: Center(
              child: Text('No route defined'),
            ),
          );
        });
    }
  }
}