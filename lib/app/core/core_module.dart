import 'package:flutter_modular/flutter_modular.dart';
import 'package:minerva/app/core/rest_client/rest_client.dart';

class CoreModule extends Module {
  @override
  List<Module> get imports => const [];

  @override
  void binds(Injector i) {}
  @override
  void exportedBinds(Injector i) {
    i.addLazySingleton(RestClient.new);
  }

  @override
  void routes(RouteManager r) {}
}
