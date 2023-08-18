import 'package:cpims_mobile_app/Workflow2/api/apidio_service.dart';
import 'package:flutter/material.dart';

class Cache extends StatelessWidget {
  Cache({super.key});

  final ApiDio apiService = ApiDio();
  final String token =
      'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjkyMzkwMzE3LCJpYXQiOjE2OTIzODY3MTcsImp0aSI6IjI1Zjk0Y2Y0YWU2ODQ4OGZhYWJiZmMyNDY3MWI3OTQ0IiwidXNlcl9pZCI6Mzk2Nn0.DRCpvOiVaNjrRz_bue1KSvb4zKYecg0h-Pzg4ZqKDwM';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: ElevatedButton(
            onPressed: () async {
              await apiService.fetchDataAndSave(token);
              debugPrint('Data fetched and saved!');
            },
            child: const Text('Fetch & Save Data'),
          ),
        ),
      ),
    );
  }
}
