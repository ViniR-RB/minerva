import 'package:flutter/material.dart';
import 'package:minerva/app/core/either/either.dart';
import 'package:minerva/app/core/helpers/messages.dart';
import 'package:minerva/app/features/auth/gateway/auth_gateway.dart';

class LoginController with MessageControllerMixin {
  final AuthGateway _gateway;

  final emailEC = TextEditingController();
  final passwordEC = TextEditingController();

  final formKey = GlobalKey<FormState>();

  LoginController({required AuthGateway gateway}) : _gateway = gateway;

  Future<void> login(String email, String password) async {
    final result = await _gateway.login(email, password);

    switch (result) {
      case Success(:final value):
        showSnackBar(value);
      case Failure(:final exception):
        showSnackBar(exception.toString());
    }
  }
}
