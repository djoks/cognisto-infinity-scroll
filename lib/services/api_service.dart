import 'dart:io';

import 'package:cognisto_infinity_scroll/constants/api.dart';
import 'package:dio/dio.dart';

class ApiService {
  Dio _dio = Dio();
  Dio get dio => _dio;

  ApiService() {
    _dio = Dio(
      BaseOptions(
        baseUrl: kBaseUrl,
        connectTimeout: kConnectionTimeout,
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.acceptHeader: 'application/json',
        },
      ),
    );
  }

  Future<Response> get(String url, {Map<String, dynamic>? params}) {
    Uri? uri = Uri.tryParse(url);
    return _dio.get(uri.toString(), queryParameters: params);
  }
}
