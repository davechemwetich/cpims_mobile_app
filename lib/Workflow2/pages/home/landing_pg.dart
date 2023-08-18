// ignore_for_file: library_private_types_in_public_api

import 'package:cpims_mobile_app/Workflow2/pages/home/cacheapi.dart';
import 'package:cpims_mobile_app/Workflow2/pages/service/api_service.dart';
import 'package:flutter/material.dart';

class LandingPage2 extends StatefulWidget {
  final String bearerToken;

  const LandingPage2(this.bearerToken, {super.key});

  @override
  _LandingPage2State createState() => _LandingPage2State();
}

class _LandingPage2State extends State<LandingPage2> {
  late ApiService2 _apiService;
  String _dashboardData = "";

  @override
  void initState() {
    super.initState();
    _apiService = ApiService2(widget.bearerToken);
    _fetchDashboardData();
  }

  Future<void> _fetchDashboardData() async {
    try {
      final response = await _apiService.getDashboardData();
      setState(() {
        _dashboardData = response.data.toString();
      });
    } catch (error) {
      debugPrint("Error fetching data: $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Dashboard"),
        ),
        body: Column(
          children: [
            SizedBox(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(_dashboardData),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Cache()),
                );
              },
              child: const Text(
                "cacheddata",
              ),
            )
          ],
        ));
  }
}
