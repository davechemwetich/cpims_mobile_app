import 'package:cpims_mobile_app/Workflow1/auth/login_pg.dart';
import 'package:cpims_mobile_app/Workflow2/auth/login_pg.dart';
import 'package:cpims_mobile_app/Workflow3/auth/auth3.dart';
import 'package:flutter/material.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Container(
            padding: const EdgeInsets.all(12),
            alignment: Alignment.center,
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Divider(),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPage1()),
                      );
                    },
                    child: const ListTile(
                      title: Text("Work Flow 1"),
                      trailing: Icon(Icons.arrow_circle_right_rounded),
                    ),
                  ),
                  const Divider(),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPage2()),
                      );
                    },
                    child: const ListTile(
                      title: Text("Work Flow 2"),
                      trailing: Icon(Icons.arrow_circle_right_rounded),
                    ),
                  ),
                  const Divider(),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPage3()),
                      );
                    },
                    child: const ListTile(
                      title: Text("Work Flow 3"),
                      trailing: Icon(Icons.arrow_circle_right_rounded),
                    ),
                  ),
                  const Divider(),
                ],
              ),
            ),
          ),
        ));
  }
}
