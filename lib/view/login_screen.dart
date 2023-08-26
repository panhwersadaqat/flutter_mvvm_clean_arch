import 'package:flutter/material.dart';
import 'package:flutter_mvvm_clearn_arch/utils/routes/routes_name.dart';
import 'package:flutter_mvvm_clearn_arch/utils/utils.dart';
import '../res/components/round_button.dart';

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
    final height = MediaQuery.of(context).size.height *1;
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
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

            ValueListenableBuilder(
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
            SizedBox(height: height * .1),
             RoundButton(
               title: 'LogIn',
             onPress: (){
                if(emailController.text.isEmpty) {
                  Utils.flushBarErrorMessage('Please enter email', context);
                }else if(passwordController.text.isEmpty) {
                  Utils.flushBarErrorMessage('Please enter Password', context);
                }else {
                  print('hit api');
                }
             },
             )
          ],
        ),
      ),
    );
  }
}
