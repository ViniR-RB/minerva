import 'package:flutter/material.dart';
import 'package:minerva/app/core/helpers/messages.dart';
import 'package:minerva/app/features/auth/controller/login_controller.dart';
import 'package:validatorless/validatorless.dart';

class LoginPage extends StatefulWidget {
  final LoginController controller;
  const LoginPage({super.key, required this.controller});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with MessageViewMixin {
  @override
  void initState() {
    messageListener(widget.controller);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Login Page'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: widget.controller.formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField(
                  validator: Validatorless.multiple([
                    Validatorless.required("E-mail é requerido"),
                    Validatorless.email("E-mail no formato inválido"),
                  ]),
                  controller: widget.controller.emailEC,
                  decoration: const InputDecoration(label: Text("Email")),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  controller: widget.controller.passwordEC,
                  obscureText: true,
                  validator: Validatorless.multiple([
                    Validatorless.required("Password é requerido"),
                  ]),
                  decoration: const InputDecoration(label: Text("Password")),
                ),
                const SizedBox(
                  height: 8,
                ),
                ElevatedButton(
                    onPressed: () async {
                      final valid =
                          widget.controller.formKey.currentState?.validate() ??
                              false;
                      if (valid) {
                        await widget.controller.login(
                            widget.controller.emailEC.text,
                            widget.controller.passwordEC.text);
                      }
                    },
                    child: const Text("Logar"))
              ],
            ),
          ),
        ));
  }
}
