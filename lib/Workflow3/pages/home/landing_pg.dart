// ignore_for_file: library_private_types_in_public_api

import 'package:cpims_mobile_app/Workflow1/pages/api/api_service.dart';
import 'package:flutter/material.dart';

class LandingPage3 extends StatefulWidget {
  final String bearerToken;

  const LandingPage3(this.bearerToken, {super.key});

  @override
  _LandingPage3State createState() => _LandingPage3State();
}

class _LandingPage3State extends State<LandingPage3> {
  late ApiService _apiService;
  String _dashboardData = "";

  @override
  void initState() {
    super.initState();
    _apiService = ApiService(widget.bearerToken);
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
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(_dashboardData),
        ),
      ),
    );
  }
}
