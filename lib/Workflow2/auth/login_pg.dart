// ignore_for_file: avoid_print

import 'package:cpims_mobile_app/Workflow1/pages/home/dash_page.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

class LoginPage2 extends StatefulWidget {
  const LoginPage2({super.key});

  @override
  State<LoginPage2> createState() => _LoginPage2State();
}

class _LoginPage2State extends State<LoginPage2> {
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
          final token = response.data["token"];
          print("Token is $token");

          // Navigate to the next screen
          // ignore: use_build_context_synchronously
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DashBoardScreen(token: token)),
          );
        } else {
          // Failed login
          print("Login failed");
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
        title: const Text("Login Page"),
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