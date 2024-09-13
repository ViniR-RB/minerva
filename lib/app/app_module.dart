import 'package:flutter_modular/flutter_modular.dart';
import 'package:minerva/app/core/core_module.dart';
import 'package:minerva/app/features/auth/auth_module.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => [
        CoreModule(),
      ];

  @override
  void binds(Injector i) {}
  @override
  void exportedBinds(Injector i) {}

  @override
  void routes(RouteManager r) {
    r.module("/", module: AuthModule());
  }
}
