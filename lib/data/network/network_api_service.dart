import 'dart:convert';
import 'dart:io';

import 'package:flutter_mvvm_clearn_arch/data/app_exceptions.dart';
import 'package:flutter_mvvm_clearn_arch/data/network/base_api_service.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class NetworkApiService extends BaseApiService {
  @override
  Future getGetApiResponse(String url) async {
    dynamic responseJson;

    try {
      final response = await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    }on SocketException {
      throw FetchDataException('No Internet Connection');
    }

    return responseJson;
  }


  @override
  Future getPostApiResponse(String url, dynamic data) async {
    dynamic responseJson;

    try {

      final request = MultipartRequest('POST', Uri.parse(url));

      // Add form fields
      request.fields.addAll(data);

      // Send the request and wait for the response
      final response = await request.send();
      final responseStream = await response.stream.bytesToString();

      // Process the response
      responseJson = json.decode(responseStream);
    }on SocketException {
      throw FetchDataException('No Internet Connection');
    }

    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch(response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 500:
      case 404:
        throw UnAuthorizedException(response.body.toString());
      default:
        throw FetchDataException('Error: ${response.body}');


    }
  }

}