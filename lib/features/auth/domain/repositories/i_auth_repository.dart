import 'package:fpdart/fpdart.dart';

import '../domain.dart';

abstract class IAuthRepository {
  Future<Either<AuthFailure, AccountModel>> signIn(
    String email,
    String password,
  );

  Future<Either<AuthFailure, void>> signUp(String email, String password);
}
