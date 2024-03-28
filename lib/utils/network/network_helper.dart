import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

enum DioMethod { post, get, put, delete}

class NetworkHelpper {

  Future<dynamic> dioRequestPublic({
    required String url,
    required DioMethod method,
    bool removeAuth = false,
    Map<String, dynamic>? params,
  }) async {
    late Response response;
    var dio = Dio();
    dio.options.headers['content-Type'] = 'application/json';

    try {
      if (method == DioMethod.get) {
        response = await dio.get(url);
      }  else if (method == DioMethod.post) {
        response = await dio.post(url, data: params);
      } else if (method == DioMethod.delete) {
        response = await dio.delete(url, data: params);
      } else if (method == DioMethod.put) {
        response = await dio.put(url, data: params);
      }

      debugPrint(response.statusCode.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      } else if (response.statusCode == 400) {
        throw Exception("Invalid request");
      } else if (response.statusCode == 401) {
        throw Exception("Unauthorized");
      } else if (response.statusCode == 500) {
        throw Exception("Server Error");
      } else {
        throw Exception("Something went wrong");
      }
    } on SocketException catch (e) {
      log('1 error => ${e.toString()}');
      throw Exception("No Internet Connection");
    } on FormatException catch (e) {
      log('2 error => ${e.toString()}');
      throw Exception("Bad response format");
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError ||
          e.type == DioExceptionType.connectionError) {
        throw Exception("internet issue");
      } else if (e.type == DioExceptionType.badResponse) {
        if (e.response?.data['errors'][''][0] != null) {
          throw Exception("${e.response?.data['errors'][''][0]}");
        } else {
          throw Exception("Server Error");
        }
      } else {
        log(e.toString());
      }
    } catch (e) {
      if (e.toString().contains('401')) {
        throw Exception("Unauthorized");
      } else {
        throw Exception("Something went wrong");
      }
    }
  }
}
