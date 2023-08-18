import 'package:cpims_mobile_app/welcome/start_page.dart';
import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();

  runApp(const Cpims());
}

class Cpims extends StatelessWidget {
  const Cpims({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'CPIMS Flutter',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: const Welcome());
  }
}
