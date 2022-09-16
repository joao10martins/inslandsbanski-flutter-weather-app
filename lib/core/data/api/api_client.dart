import 'dart:async';
import 'dart:developer' as logger;

import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:weather_app/core/errors/failures.dart';


class ApiClient {
  ApiClient(String apiUrl) : _dio = _createDio(apiUrl);

  final Dio _dio;

  static Dio _createDio(String url) {
    return Dio(
      BaseOptions(
        connectTimeout: 10000,
        receiveTimeout: 10000,
        baseUrl: url,
      ),
    )..interceptors.addAll([_getPrettyLoggerInterceptor()]);
  }

  static PrettyDioLogger _getPrettyLoggerInterceptor() => PrettyDioLogger(
    requestHeader: true,
    requestBody: true,
    responseBody: true,
    responseHeader: false,
    error: true,
    compact: true,
    maxWidth: 120,
  );

  Future<dynamic> get(String url, {Map<String, dynamic>? params}) {
    return _wrapApiRequest(
      _dio.get(url, queryParameters: params),
      endpoint: url,
    );
  }

  Future<dynamic> post(String url, String body) async {
    return _wrapApiRequest(
      _dio.post(url, data: body),
      endpoint: url,
    );
  }

  Future<dynamic> _wrapApiRequest<T>(Future<Response<dynamic>> apiCall, {String? endpoint}) async {
    try {
      final Response response = await apiCall;
      if (response.statusCode! > 400) {
        throw ServerFailure(
          statusCode: response.statusCode,
          errorMessage: _getErrorMessageFromResponse(response.data),
          reason: endpoint,
        );
      }
      return response.data;
    } on DioError catch (e) {
      logger.log(e.toString());
      if (e.type == DioErrorType.response) {
        throw ServerFailure(
          statusCode: e.response?.statusCode,
          errorMessage: _getErrorMessageFromResponse(e.response),
          reason: endpoint,
        );
      } else if (e.type == DioErrorType.connectTimeout ||
          e.type == DioErrorType.receiveTimeout ||
          e.type == DioErrorType.sendTimeout) {
        throw NoInternetConnectionFailure();
      }
      throw ClientFailure(e);
    } catch (e) {
      logger.log(e.toString());
      throw ClientFailure(e, reason: 'error while calling $endpoint');
    }
  }

  String _getErrorMessageFromResponse(Response? response) {
    if (response != null && response.data['message'] != null) {
      return response.data['message'];
    }
    return response?.data?.toString() ?? 'Unknown server failure';
  }
}
