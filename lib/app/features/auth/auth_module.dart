import 'package:flutter_modular/flutter_modular.dart';
import 'package:minerva/app/core/core_module.dart';
import 'package:minerva/app/features/auth/controller/login_controller.dart';
import 'package:minerva/app/features/auth/gateway/auth_gateway.dart';
import 'package:minerva/app/features/auth/gateway/auth_gateway_impl.dart';
import 'package:minerva/app/features/auth/pages/login_page.dart';

class AuthModule extends Module {
  @override
  List<Module> get imports => [
        CoreModule(),
      ];
  // LoginControler(rest:  )
  @override
  void binds(Injector i) {
    i.addLazySingleton(LoginController.new);
    i.addLazySingleton<AuthGateway>(AuthGatewayImpl.new);
  }

  @override
  void exportedBinds(Injector i) {}

  @override
  void routes(RouteManager r) {
    r.child("/",
        child: (_) => LoginPage(
              controller: Modular.get(),
            ));
  }
}
