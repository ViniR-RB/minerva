import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:minerva/app/app_module.dart';
import 'package:minerva/app/app_widget.dart';
import 'package:minerva/app/core/enviroments/enviroments.dart';

void main() {
  Enviroment.validate();
  runZonedGuarded(
      () => runApp(ModularApp(module: AppModule(), child: const AppWidget())),
      (error, stack) {
    log("Erro não trackeado", error: error, stackTrace: stack);
  });
}
