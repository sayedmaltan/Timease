import 'package:dio/dio.dart';

class ApiService {
  final Dio dio;
  final String _baseUrl = 'https://api.timease.me/api/v1/';

  ApiService({required this.dio});

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var response = await dio.get(
      _baseUrl + endPoint,
    );
    return response.data;
  }

  Future<Map<String, dynamic>> post({required String endPoint,required body}) async {
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
