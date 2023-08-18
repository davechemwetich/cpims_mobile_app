import 'package:cpims_mobile_app/Workflow1/pages/home/api/dash_func.dart';
import 'package:flutter/material.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key, required token});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  Future<Map<String, dynamic>>? _dashboardData;

  @override
  void initState() {
    super.initState();
    _dashboardData = fetchDashboardData("YOUR_BEARER_TOKEN_HERE");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard Summaries'),
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: _dashboardData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            // Display dashboard summaries
            final summaries = snapshot.data?["summaries"] ?? [];
            return ListView.builder(
              itemCount: summaries.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(summaries[index]),
                );
              },
            );
          } else {
            return const Center(child: Text('No data available.'));
          }
        },
      ),
    );
  }
}
