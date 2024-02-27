import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class RequestService {
  String buildUrl(String userRequest, String contentType) {
    debugPrint(contentType);
    return 'https://images-api.nasa.gov/search?q=$userRequest&media_type=$contentType';
  }

  Future<Map<String, dynamic>> getResponse(
      {required String userRequestQuery, required String contentType}) async {
    final Response<Map<String, Object?>> response =
        await Dio().get(buildUrl(userRequestQuery, contentType));
    if (response.statusCode == 200) {
      return response.data ?? {};
    } else {
      throw Exception('Status code not 200');
    }
  }
}
