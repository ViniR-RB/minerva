import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Minerva',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          inputDecorationTheme:
              const InputDecorationTheme(border: OutlineInputBorder())),
      routerConfig: Modular.routerConfig,
    );
  }
}
