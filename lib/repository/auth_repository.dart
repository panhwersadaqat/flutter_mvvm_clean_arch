import 'package:flutter_mvvm_clearn_arch/data/network/base_api_service.dart';
import 'package:flutter_mvvm_clearn_arch/data/network/network_api_service.dart';
import 'package:flutter_mvvm_clearn_arch/res/api.dart';

class AuthRepository {

  BaseApiService _apiService = NetworkApiService();

  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response = await _apiService.getPostApiResponse(ApiUrl.login, data);
      return response;
    }catch(e) {
      throw e;
    }
  }

  Future<dynamic> registerApi(dynamic data) async {
    try {
      dynamic response = await _apiService.getPostApiResponse(ApiUrl.registration, data);
      return response;
    }catch(e) {
      throw e;
    }
  }
}