// ignore_for_file: avoid_print
import 'package:cpims_mobile_app/Workflow1/pages/home/landing_pg.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class LoginPage3 extends StatefulWidget {
  const LoginPage3({super.key});

  @override
  State<LoginPage3> createState() => _LoginPage3State();
}

class _LoginPage3State extends State<LoginPage3> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;

  Future<void> _login() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      const baseUrl = "https://dev.cpims.net/api/";
      const endpoint = "token/";

      final username = _usernameController.text;
      final password = _passwordController.text;

      final dio = Dio();

      try {
        final response = await dio.post(
          baseUrl + endpoint,
          data: {
            "username": username,
            "password": password,
          },
          options: Options(
            contentType: "application/json",
          ),
        );

        if (response.statusCode == 200) {
          // Successful login
          final token = response.data["access"];

          // Fluttertoast.showToast(
          //   msg: "Login successful. Token is $token",
          //   toastLength: Toast.LENGTH_LONG,
          //   gravity: ToastGravity.BOTTOM,
          // );

          print('Login successful. Your Token is $token');

          // ignore: use_build_context_synchronously
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const LandingPage(
                "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjkyMzkwMzE3LCJpYXQiOjE2OTIzODY3MTcsImp0aSI6IjI1Zjk0Y2Y0YWU2ODQ4OGZhYWJiZmMyNDY3MWI3OTQ0IiwidXNlcl9pZCI6Mzk2Nn0.DRCpvOiVaNjrRz_bue1KSvb4zKYecg0h-Pzg4ZqKDwM",
              ),
            ),
          );
        } else {
          // Failed login
          // Fluttertoast.showToast(
          //   msg: "Login failed",
          //   toastLength: Toast.LENGTH_SHORT,
          //   gravity: ToastGravity.BOTTOM,
          // );

          debugPrint("Login failed");
        }
      } catch (error) {
        print("Error: $error");
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login page with POST"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _usernameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your username";
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  labelText: "Username",
                ),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _passwordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your password";
                  }
                  return null;
                },
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "Password",
                ),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _isLoading ? null : _login,
                child: _isLoading
                    ? const CircularProgressIndicator()
                    : const Text("Login"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
