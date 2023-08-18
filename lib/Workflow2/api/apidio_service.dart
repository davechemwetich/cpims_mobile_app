import 'package:cpims_mobile_app/Workflow2/model/case_model.dart';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';

class ApiDio {
  final Dio _dio = Dio();
  final String baseUrl = 'https://dev.cpims.net/api/';

  Future<void> fetchDataAndSave(String token) async {
    final response = await _dio.get(
      '${baseUrl}caseload/',
      options: Options(headers: {'Authorization': 'Bearer $token'}),
    );

    if (response.statusCode == 200) {
      final data = response.data;
      final box = await Hive.openBox<Case>('cases');

      // Clear existing data
      await box.clear();

      // Save new data
      for (var caseData in data) {
        final newCase = Case(caseData['id'], caseData['name']);
        box.add(newCase);
      }
    }
  }
}
