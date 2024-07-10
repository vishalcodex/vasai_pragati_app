import 'dart:developer';

import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import 'package:get/get.dart';

import '../models/api_response.dart';
import '../providers/api_client.dart';

import '../services/auth_service.dart';
import 'api_endpoints.dart';

class ApiProvider extends GetxService with ApiClient {
  late dio.Dio _httpClient;
  late AuthService authService;

  ApiProvider() {
    authService = Get.find<AuthService>();
    baseUrl = Urls.baseUrl;
    _httpClient = dio.Dio();
  }

  Future<ApiProvider> init() async {
    _httpClient.options.baseUrl = this.baseUrl!;
    _httpClient.options.connectTimeout = 60 * 1000;
    return this;
  }

  Future<ApiResponse> downloadPdf(method, endpoint, data) async {
    var url = Uri.parse(Urls.getApiUrl(endpoint));
    var token = authService.token ?? "";
    _httpClient.options.headers.addAll({"Authorization": "Bearer $token"});

    try {
      var result;
      print(_httpClient.options.baseUrl + endpoint);
      switch (method) {
        case "GET":
          result = await _httpClient.get(url.path);
          break;
        case "POST":
          result = await _httpClient.post(
            url.path,
            data: data,
            options: Options(
              responseType: ResponseType.bytes,
            ),
          );
          break;
        default:
          return ApiResponse.error("Invalid Request", Error.INVALID_REQUEST);
      }
      if (result != null) {
        var response = result.data;
        return ApiResponse.completed(response);

        // if (result.) {
        // } else {
        //   return ApiResponse.error(response["error"], Error.DATA_FETCH_ERROR);
        // }
      } else {
        return ApiResponse.error("Page Not Found", Error.INVALID_ROUTE);
      }
    } on dio.DioError catch (ex) {
      if (ex.type == dio.DioErrorType.connectTimeout) {
        return ApiResponse.error("Connection Timeout", Error.TIME_OUT_ERROR);
      }
      switch (ex.response!.statusCode) {
        case 404:
          return ApiResponse.error(
              ex.response!.data["message"], Error.DATA_FETCH_ERROR);
        default:
          return ApiResponse.error(
              ex.response!.data["message"], Error.DATA_FETCH_ERROR);
      }
    }
  }

  Future<ApiResponse> makeAPICall(method, endpoint, data) async {
    var url = Uri.parse(Urls.getApiUrl(endpoint));
    var token = authService.token ?? "";
    _httpClient.options.headers.addAll({"Authorization": "Bearer $token"});

    try {
      var result;
      if (kDebugMode) {
        // ignore: prefer_interpolation_to_compose_strings
        print(Urls.getApiUrl(endpoint));
        print(data);
      }
      switch (method) {
        case "GET":
          result = await _httpClient.get(url.path);
          break;
        case "POST":
          result = await _httpClient.post(url.path, data: data);
          break;
        case "PUT":
          result = await _httpClient.put(url.path, data: data);
          break;
        case "DELETE":
          result = await _httpClient.delete(url.path, data: data);
          break;
        default:
          return ApiResponse.error("Invalid Request", Error.INVALID_REQUEST);
      }
      if (result != null) {
        var response = result.data;
        if (kDebugMode) {
          log(response.toString());
        }
        if (response["success"]) {
          return ApiResponse.completed(response["data"]);
        } else {
          return ApiResponse.error(response["error"], Error.DATA_FETCH_ERROR);
        }
      } else {
        return ApiResponse.error("Page Not Found", Error.INVALID_ROUTE);
      }
    } on dio.DioError catch (ex) {
      if (ex.type == dio.DioErrorType.connectTimeout) {
        return ApiResponse.error("Connection Timeout", Error.TIME_OUT_ERROR);
      }
      switch (ex.response!.statusCode) {
        case 404:
          return ApiResponse.error(
              ex.response!.data["message"], Error.DATA_FETCH_ERROR);
        default:
          log(ex.response!.data);
          return ApiResponse.error(ex.response!.data, Error.DATA_FETCH_ERROR);
      }
    }
  }
}
