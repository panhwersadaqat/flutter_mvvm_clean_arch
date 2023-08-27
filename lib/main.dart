import 'package:flutter/material.dart';
import 'package:flutter_mvvm_clearn_arch/utils/routes/routes.dart';
import 'package:flutter_mvvm_clearn_arch/utils/routes/routes_name.dart';
import 'package:flutter_mvvm_clearn_arch/view/login_screen.dart';
import 'package:flutter_mvvm_clearn_arch/view_model/auth_viewmodel.dart';
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
        ],
        child : MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch:Colors.blue,
            useMaterial3: true,
          ),
          initialRoute: RoutesName.login,
          onGenerateRoute: Routes.generateRoute,
        ),
    );
  }
}
