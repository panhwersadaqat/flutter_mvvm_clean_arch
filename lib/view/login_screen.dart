import 'package:flutter/material.dart';
import 'package:flutter_mvvm_clearn_arch/utils/routes/routes_name.dart';
import 'package:flutter_mvvm_clearn_arch/utils/utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: (){
            Utils.flushBarErrorMessage('Hello World!', context);
            Utils.snackBar("Hello World!", context);
            Utils.toastMessage('Hello World');
           // Navigator.pushNamed(context, RoutesName.home);
          },
          child: Text('Click'),
        ),
      ),
    );
  }
}
