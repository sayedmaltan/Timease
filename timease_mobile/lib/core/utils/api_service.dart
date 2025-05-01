import 'package:dio/dio.dart';
import 'package:timease_mobile/core/utils/cash_helper.dart';
import 'package:timease_mobile/core/utils/function/logout.dart';

class ApiService {
  late Dio dio;
  final String _baseUrl = 'https://timease.up.railway.app/api/';

  ApiService({required this.dio});

  Future<String?> refreshToken() async {
    try {
      var response = await post(
        endPoint: 'auth/refresh-token',
        body: {
          "refreshToken": CashHelper.getData('refreshToken'),
        },
      );
      CashHelper.setData('accessToken', response['accessToken']);
      return response['accessToken'];
    } catch (e) {
      throw Exception('failed to refresh token');
    }
  }

  void interceptorsWrapper() {
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        if (options.path.compareTo(
                    'https://timease.up.railway.app/api/auth/login') ==
                0 ||
            options.path.compareTo(
                    'https://timease.up.railway.app/api/auth/signup') ==
                0 ||
            options.path.compareTo(
                    'https://timease.up.railway.app/api/auth/logout') ==
                0 ||
            options.path.compareTo(
                    'https://timease.up.railway.app/api/auth/refresh-token') ==
                0) {
          options.headers["Authorization"] = "";
        } else {
          //HERE IS dio.options
          options.headers["Authorization"] =
              "Bearer ${CashHelper.getData('accessToken')}";
        }
        return handler.next(options);
      },
      onError: (error, handler) async {
        if (error.response?.statusCode == 401) {
          try {
            dio.options.headers["Authorization"] = "";
            String? newAccessToken = await refreshToken();
            if (newAccessToken != null) {
              error.requestOptions.headers["Authorization"] =
                  "Bearer $newAccessToken";
              final retryResponse = await dio.fetch(error.requestOptions);
              return handler.resolve(retryResponse);
            }
          } catch (refreshError) {
            return handler.next(error);
          }
        } else if (error.response?.statusCode == 403 &&
            error.requestOptions.path == '${_baseUrl}auth/refresh-token') {
          try {
            logout();
            return handler.next(error);
          } catch (_) {
            return handler.next(error);
          }
        } else if (error.response?.statusCode == 502) {
          try {
            final retryResponse = await dio.fetch(error.requestOptions);
            return handler.resolve(retryResponse);
          } catch (_) {
            return handler.next(error);
          }
        }
        return handler.next(error);
      },
    ));
  }

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var response = await dio.get(
      _baseUrl + endPoint,
    );
    return response.data;
  }

  Future<Map<String, dynamic>> post(
      {required String endPoint, required body}) async {
    var response = await dio.post(
      _baseUrl + endPoint,
      data: body,
    );
    return response.data;
  }

  Future<Map<String, dynamic>> put(
      {required String endPoint, required body}) async {
    var response = await dio.put(
      _baseUrl + endPoint,
      data: body,
    );
    return response.data;
  }

  Future<void> delete({required String endPoint}) async {
    await dio.delete(
      _baseUrl + endPoint,
    );
    // return response.data;
  }
}
