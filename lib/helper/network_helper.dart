import 'dart:developer';

import 'package:dio/dio.dart';

abstract class NetworkHelper {
  static const String productListUrl =
      'https://gist.githubusercontent.com/nero-angela/d16a5078c7959bf5abf6a9e0f8c2851a/raw/04fb4d21ddd1ba06f0349a890f5e5347d94d677e/ikeaSofaDataIBB.json';

  static final Dio dio = Dio()
    ..interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          // 요청시
          log('REQ : [${options.method}] ${options.path}');
          return handler.next(options);
        },
        onResponse: (response, handler) {
          // 수신시
          log('RES : [${response.statusCode}] ${response.requestOptions.path}');
          return handler.next(response);
        },
        onError: (DioError e, handler) {
          // 에러시
          log('ERR : [${e.response?.statusCode}] ${e.requestOptions.path}');
          return handler.next(e);
        },
      ),
    );
}
