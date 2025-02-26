import 'package:dio/dio.dart';
import 'package:timease_mobile/constants.dart';

class ApiService {
  final Dio dio;
  final String _baseUrl = 'https://api.timease.me/api/v1/';

  ApiService({required this.dio});

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    dio.options.headers["Authorization"] = "Bearer $refreshToken";
    var response = await dio.get(
      _baseUrl + endPoint,
    );
    return response.data;
  }

  Future<Map<String, dynamic>> post({required String endPoint,required body}) async {
    dio.options.headers["Authorization"] = "Bearer $refreshToken";
    var response = await dio.post(
      _baseUrl + endPoint,
      options: Options(
        headers: {
          'Content-Type': 'application/json',
        },
      ),
      data: body,
    );
    return response.data;
  }


}
