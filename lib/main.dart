// ignore_for_file: constant_identifier_names

import 'package:cpims_mobile_app/welcome/start_page.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive_flutter/hive_flutter.dart';

const String SETTINGS_BOX = "settings";
const String API_BOX = "api_data";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox(SETTINGS_BOX);
  await Hive.openBox(API_BOX);
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
      home: const Welcome(),
    );
  }
}
