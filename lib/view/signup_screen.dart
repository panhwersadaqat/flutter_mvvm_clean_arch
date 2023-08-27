import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mvvm_clearn_arch/utils/routes/routes_name.dart';
import 'package:flutter_mvvm_clearn_arch/utils/utils.dart';
import 'package:flutter_mvvm_clearn_arch/view_model/auth_viewmodel.dart';
import '../res/components/round_button.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  ValueNotifier<bool> obscurePassword = ValueNotifier<bool>(true);

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  FocusNode nameFocus = FocusNode();
  FocusNode phoneFocus = FocusNode();
  FocusNode emailFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();

  @override
  void dispose() {
    super.dispose();

    obscurePassword.dispose();
    emailController.dispose();
    phoneController.dispose();
    nameController.dispose();
    passwordController.dispose();
    nameFocus.dispose();
    phoneFocus.dispose();
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
                'assets/images/image5.png',
                height: 140,
              ),
              SizedBox(height: height * .080),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 30),
                child: TextFormField(
                  controller: nameController,
                  focusNode: nameFocus,
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                    hintText: 'Full name',
                    labelText: 'Full name',
                    prefixIcon: Icon(Icons.person_2_outlined),
                  ),
                  onFieldSubmitted: (value){
                    Utils.fieldFocus(context, nameFocus, emailFocus);
                  },
                ),
              ),
              SizedBox(height: height * .020),
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
                    Utils.fieldFocus(context, emailFocus, phoneFocus);
                  },
                ),
              ),
              SizedBox(height: height * .020),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 30),
                child: TextFormField(
                  controller: phoneController,
                  focusNode: phoneFocus,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    hintText: 'Phone',
                    labelText: 'Phone',
                    prefixIcon: Icon(Icons.phone_outlined),
                  ),
                  onFieldSubmitted: (value){
                    Utils.fieldFocus(context, phoneFocus, passwordFocus);
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
                title: 'Register',
                loading: authViewModel.loadingSignUp,
                onPress: (){
                  if(nameController.text.isEmpty) {
                    Utils.flushBarErrorMessage('Please enter full name', context);
                  }else if(emailController.text.isEmpty) {
                    Utils.flushBarErrorMessage('Please enter email', context);
                  }else if(phoneController.text.isEmpty) {
                    Utils.flushBarErrorMessage('Please enter phone no', context);
                  }else if(passwordController.text.isEmpty) {
                    Utils.flushBarErrorMessage('Please enter Password', context);
                  }else {
                    Map data = {
                      'name': nameController.text.toString(),
                      'email': emailController.text.toString(),
                      'phone': phoneController.text.toString(),
                      'password': passwordController.text.toString(),
                    };
                    if(kDebugMode) {
                      print(data);
                    }
                    authViewModel.registerApi(data, context);
                  }
                },
              ),
              SizedBox(height: height * .02),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, RoutesName.login);
                },
                child: Text("Already have an account? Sign Up"),
              ),
              SizedBox(height: height * .040),
            ],
          ),
        ),
      ),
    );
  }
}
