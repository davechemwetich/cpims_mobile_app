// ignore_for_file: library_private_types_in_public_api

import 'package:cpims_mobile_app/Workflow1/pages/api/api_service.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  final String bearerToken;

  const LandingPage(this.bearerToken, {super.key});

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
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
