import 'package:cpims_mobile_app/Workflow1/pages/api/api_service.dart';
import 'package:flutter/material.dart';

class LandingPage2 extends StatefulWidget {
  final String bearerToken;

  LandingPage2(this.bearerToken);

  @override
  // ignore: library_private_types_in_public_api
  _LandingPage2State createState() => _LandingPage2State();
}

class _LandingPage2State extends State<LandingPage2> {
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
      print("Error fetching data: $error");
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
