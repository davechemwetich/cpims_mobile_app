import 'package:dio/dio.dart';

class ApiService2 {
  final Dio _dio = Dio();

  ApiService2(String bearerToken) {
    _dio.options.baseUrl = "https://dev.cpims.net/api/";
    _dio.options.headers["Authorization"] = "Bearer $bearerToken";
  }

  Future<Response> getDashboardData() async {
    try {
      final response = await _dio.get("caseload/");
      return response;
    } catch (error) {
      rethrow;
    }
  }
}
