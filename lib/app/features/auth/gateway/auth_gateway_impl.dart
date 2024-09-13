import 'package:minerva/app/core/either/either.dart';

import './auth_gateway.dart';

class AuthGatewayImpl implements AuthGateway {
  AuthGatewayImpl();

  @override
  Future<Either<Exception, String>> login(String email, String password) async {
    try {
      await Future.delayed(const Duration(seconds: 3));
      return Success("Sucesso $email,$password");
    } catch (e) {
      return Failure(Exception(e.toString()));
    }
  }
}
