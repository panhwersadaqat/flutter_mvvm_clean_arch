import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mvvm_clearn_arch/utils/routes/routes_name.dart';
import 'package:flutter_mvvm_clearn_arch/utils/utils.dart';
import 'package:flutter_mvvm_clearn_arch/view_model/auth_viewmodel.dart';
import '../res/components/round_button.dart';
import 'package:provider/provider.dart';

import 'onboarding/size_config.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  ValueNotifier<bool> obscurePassword = ValueNotifier<bool>(true);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  FocusNode emailFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();

  @override
  void dispose() {
    super.dispose();

    obscurePassword.dispose();
    emailController.dispose();
    passwordController.dispose();
    emailFocus.dispose();
    passwordFocus.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    final height = MediaQuery.of(context).size.height *1;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: height * .080),
              Image.asset(
                'assets/images/image4.png',
                height: 170,
              ),
              SizedBox(height: height * .080),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 30),
                child: TextFormField(
                  controller: emailController,
                  focusNode: emailFocus,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    hintText: 'Email',
                    labelText: 'Email',
                    prefixIcon: Icon(Icons.email_outlined),
                  ),
                  onFieldSubmitted: (value){
                    Utils.fieldFocus(context, emailFocus, passwordFocus);
                  },
                ),
              ),
              SizedBox(height: height * .020),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 30),
                child: ValueListenableBuilder(
                  valueListenable: obscurePassword,
                  builder: (context, value, child) {
                    return TextFormField(
                      controller: passwordController,
                      obscureText: obscurePassword.value,
                      focusNode: passwordFocus,
                      decoration:   InputDecoration(
                      hintText: 'Password',
                      labelText: 'Password',
                      prefixIcon: Icon(Icons.lock_outline),
                      suffixIcon: InkWell(
                        onTap: (){
                          obscurePassword.value = !obscurePassword.value;
                        },
                          child: Icon(
                            obscurePassword.value ? Icons.visibility_off_outlined:
                            Icons.visibility_outlined
                          ),
                      ),
                    ),
                    );
                  },

                ),
              ),
              SizedBox(height: height * .080),
              RoundButton(
                 title: 'LogIn',
               loading: authViewModel.loading,
               onPress: (){
                  if(emailController.text.isEmpty) {
                    Utils.flushBarErrorMessage('Please enter email', context);
                  }else if(passwordController.text.isEmpty) {
                    Utils.flushBarErrorMessage('Please enter Password', context);
                  }else {
                    Map data = {
                      'email': emailController.text.toString(),
                      'password': passwordController.text.toString(),
                    };
                    if(kDebugMode) {
                      print(data);
                    }
                    authViewModel.loginApi(data, context);
                  }
               },
               ),
              SizedBox(height: height * .02),
              InkWell(
                onTap:() {
                  Navigator.pushNamed(context, RoutesName.signup);
                },
                child: Text(
                    "Don't have an account? Sign Up"
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
