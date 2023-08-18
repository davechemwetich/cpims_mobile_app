import 'package:dio/dio.dart';

class ApiService3 {
  final Dio _dio = Dio();

  ApiService3(String bearerToken) {
    _dio.options.baseUrl = "https://dev.cpims.net/api/";
    _dio.options.headers["Authorization"] = "Bearer $bearerToken";
  }

  Future<Response> getDashboardData() async {
    try {
      final response = await _dio.get("dashboard/");
      return response;
    } catch (error) {
      rethrow;
    }
  }
}
