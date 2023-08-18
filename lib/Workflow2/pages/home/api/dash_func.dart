import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> fetchDashboardData(String token) async {
  const String baseUrl = "https://dev.cpims.net/api/";
  const String endpoint = "dashboard/";

  final response = await http.get(
    Uri.parse(baseUrl + endpoint),
    headers: {
      'Authorization': 'Bearer $token',
    },
  );

  if (response.statusCode == 200) {
    final Map<String, dynamic> data = json.decode(response.body);
    return data;
  } else {
    throw Exception('Failed to fetch data');
  }
}
