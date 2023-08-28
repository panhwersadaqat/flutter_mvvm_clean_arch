import 'package:flutter/material.dart';
import 'package:flutter_mvvm_clearn_arch/utils/routes/routes.dart';
import 'package:flutter_mvvm_clearn_arch/utils/routes/routes_name.dart';
import 'package:flutter_mvvm_clearn_arch/view/login_screen.dart';
import 'package:flutter_mvvm_clearn_arch/view/onboarding/onboarding_screen.dart';
import 'package:flutter_mvvm_clearn_arch/view_model/auth_viewmodel.dart';
import 'package:flutter_mvvm_clearn_arch/view_model/user_viewmodel.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
              create: (_) => AuthViewModel()
          ),
          ChangeNotifierProvider(
              create: (_) => UserViewModel()
          ),
        ],
        child : MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch:Colors.blue,
            useMaterial3: true,
          ),
          initialRoute: RoutesName.onboarding,
          onGenerateRoute: Routes.generateRoute,
        ),
    );
  }
/*  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnboardingScreen(),
    );
  }*/
}
