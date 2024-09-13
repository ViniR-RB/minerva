import 'package:minerva/app/core/either/either.dart';

abstract interface class AuthGateway {
  Future<Either<Exception, String>> login(String email, String password);
}
