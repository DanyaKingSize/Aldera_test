import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class RequestService {
  final Dio _dio;

  RequestService(this._dio);

  String buildUrlSearch(String userRequest, String contentType) {
    debugPrint(contentType);
    return 'https://images-api.nasa.gov/search?q=$userRequest&media_type=$contentType';
  }

  String buildUrlVideoLink(
    String nasaId,
  ) {
    return 'https://images-api.nasa.gov/asset/$nasaId';
  }

  String buildUrlAudioLink(
      String nasaId,
      ) {
    return 'https://images-api.nasa.gov/asset/$nasaId';
  }

  Future<Map<String, dynamic>> getResponse(
      {required String userRequestQuery, required String contentType}) async {
    final Response<Map<String, Object?>> response =
        await _dio.get(buildUrlSearch(userRequestQuery, contentType));
    if (response.statusCode == 200) {
      return response.data ?? {};
    } else {
      throw Exception('Status code not 200');
    }
  }

  Future<Map<String, dynamic>> getVideoLink({
    required String nasaId,
  }) async {
    final Response<Map<String, Object?>> response =
        await _dio.get(buildUrlVideoLink(nasaId));
    if (response.statusCode == 200) {
      return response.data ?? {};
    } else {
      throw Exception('Status code not 200');
    }
  }

  Future<Map<String, dynamic>> getAudioLink({
    required String nasaId,
  }) async {
    final Response<Map<String, Object?>> response =
    await _dio.get(buildUrlVideoLink(nasaId));
    if (response.statusCode == 200) {
      return response.data ?? {};
    } else {
      throw Exception('Status code not 200');
    }
  }

}
