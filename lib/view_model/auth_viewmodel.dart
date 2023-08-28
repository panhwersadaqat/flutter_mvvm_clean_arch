import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_mvvm_clearn_arch/repository/auth_repository.dart';
import 'package:flutter_mvvm_clearn_arch/utils/routes/routes_name.dart';
import 'package:flutter_mvvm_clearn_arch/utils/utils.dart';
import 'package:flutter_mvvm_clearn_arch/view_model/user_viewmodel.dart';

import '../model/user_model.dart';

class AuthViewModel with ChangeNotifier {

  final repository = AuthRepository();
  bool _loading = false;
  bool get loading => _loading;

  bool _loadingSignUp = false;
  bool get loadingSignUp => _loadingSignUp;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  setLoadingSignUp(bool valueSignUp) {
    _loadingSignUp = valueSignUp;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data, BuildContext context) async {
    setLoading(true);
    repository.loginApi(data).then((response) {
      setLoading(false);
      if (response['status'] == 200 && response['data'] != null) {
        Navigator.pushNamed(context, RoutesName.home);
        // Convert the API response data to a UserModel object
        UserModel user = UserModel.fromJson(response);
        UserViewModel viewModel = UserViewModel();
        viewModel.saveUser(user);
      } else {
        Utils.flushBarErrorMessage('Login Failed', context);
        print(response.toString());
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      if (kDebugMode) {
        Utils.flushBarErrorMessage('Login Failed', context);
        print(error.toString());
      }
    });
  }




  Future<void> registerApi(dynamic data, BuildContext context) async {
    setLoadingSignUp(true);
    repository.registerApi(data).then((value){
      setLoadingSignUp(false);
      Utils.toastMessage('Registration Successful');
      //Navigator.pushNamed(context, RoutesName.login);
    }).onError((error, stackTrace){
      setLoadingSignUp(false);
      if(kDebugMode) {
        Utils.flushBarErrorMessage('Registration Failed', context);
        print(error.toString());
      }
    });
  }

}