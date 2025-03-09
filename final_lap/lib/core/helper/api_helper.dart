import 'package:dio/dio.dart';

class ApiHelper {
  final Dio _dio = Dio();

  Future get({required String endPoint}) async {
    Response response = await _dio.get(endPoint);
    return response.data;
  }
}
