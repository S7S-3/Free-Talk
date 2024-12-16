import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class DioHelper {
  static final Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://bodehatem99-001-site1.jtempurl.com/api/',
      receiveDataWhenStatusError: true,
    ),
  );

  static Future<Response> getData({
    required String url,
    required Map<String, dynamic> query, // Make query required
    String lang = 'en',
    String? token,
  }) async {
    dio.options.headers = {
      'lang': lang,
      'Authorization': token ?? '',
      'Content-Type': 'application/json',
    };

    return await dio.get(
      url,
      queryParameters: query,
    );
  }

  static Future<Response> postData({
    required String url,
    required Map<String, dynamic> data, // Make data required
    required Map<String, dynamic> query, // Make query required
    String lang = 'en',
    String? token,
  }) async {
    dio.options.headers = {
      'lang': lang,
      'Authorization': token ?? '',
      'Content-Type': 'application/json',
    };

    return await dio.post(
      url,
      queryParameters: query,
      data: data,
    );
  }

  static Future<Response> putData({
    required String url,
    required Map<String, dynamic> data, // Make data required
    required Map<String, dynamic> query, // Make query required
    String lang = 'en',
    String? token,
  }) async {
    dio.options.headers = {
      'lang': lang,
      'Authorization': token ?? '',
      'Content-Type': 'application/json',    };

    return dio.put(
      url,
      queryParameters: query,
      data: data,
    );
  }
}