import 'dart:collection';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:robot_manager/util/device_info_util.dart';
import 'package:robot_manager/util/shared_preferenced.dart';

class DioUtil {
  static Dio dio;

  factory DioUtil() => _getInstance();
  static DioUtil _instance;

  DioUtil._();

  static DioUtil _getInstance() {
    if (_instance == null) {
      _instance = DioUtil._();
      dio = Dio();
      dio.options.baseUrl = "https://express-beta.hachi-tech.com/";
      // "https://hachiservice-beta2.hachi-tech.com/express/";
      dio.options.connectTimeout = 30000;
      dio.options.receiveTimeout = 3000;
      dio.interceptors
        ..add(InterceptorsWrapper(
          // 请求日志拦截器
          onRequest: (requestOptions) {
            print(
                "send request: path:${requestOptions.path}, url: ${requestOptions.baseUrl} , data: ${requestOptions.data}");
            return requestOptions;
          },
          onError: (error) {
            debugPrint('request error ${error.message}');
            return error;
          },
        ))
        ..add(InterceptorsWrapper(
          // 请求公参拦截器
          onRequest: (requestOptions) async {
            Map<String, dynamic> commonParam = Map();
            Map<String, dynamic> origin;
            commonParam['token'] =
                await SharedPrefenenceUtil.getStringData("token");
            commonParam['basic'] = await DeviceUtil().requestCommonParamter();
            print('${requestOptions.method}, ${commonParam.toString()}');
            if (requestOptions.method == 'GET') {
              print("当前是 GET 方法");
              origin = requestOptions.queryParameters;
              origin.addAll(commonParam);
              requestOptions.queryParameters = Map.of(origin);
            } else {
              print('当前是 post 方法');
              origin = requestOptions.data;
              origin.addAll(commonParam);
              requestOptions.data = FormData.from(origin);
            }

            return requestOptions;
          },
          onError: (error) {
            return error;
          },
        ));
      (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
          (HttpClient httpClient) {
        httpClient.findProxy = (uri) {
          return "PROXY 192.168.1.2:8888";
        };
        httpClient.badCertificateCallback = (cert, host, port) => true;
      };
    }
    return _instance;
  }

  Future<String> get(String url, Map<String, Object> param) async {
    Response response = await dio.get(url, queryParameters: param);
    return response.toString();
  }

  Future<String> post(String url, Map<String, Object> param) async {
    Response response = await dio.post(url, data: FormData.from(param));
    print(response.toString());
    return response.toString();
  }
}
