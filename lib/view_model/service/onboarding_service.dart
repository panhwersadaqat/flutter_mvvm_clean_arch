import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_mvvm_clearn_arch/model/user_model.dart';
import '../../utils/routes/routes_name.dart';
import '../user_viewmodel.dart';

class OnBoardingService {
  Future<UserModel?> getUserData() => UserViewModel().getUser();

  void checkAuthentication(BuildContext context)async{
    getUserData().then((value){
      if(value?.data == null) {
        Navigator.pushNamed(context, RoutesName.login);
      }else {
        Navigator.pushNamed(context, RoutesName.home);
      }
    }).onError((error, stackTrace){
      if(kDebugMode){
        print(error.toString());
      }
    });
  }
}