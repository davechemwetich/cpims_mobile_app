import 'package:cpims_mobile_app/Workflow1/pages/api/api_service.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  final String bearerToken;

  LandingPage(this.bearerToken);

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
      print("Error fetching data: $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
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
