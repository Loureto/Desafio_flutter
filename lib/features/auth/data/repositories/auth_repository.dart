import 'package:fpdart/fpdart.dart';

import '../../../../core/core.dart';
import '../../domain/domain.dart';
import '../data.dart';

class AuthRepository implements IAuthRepository {
  final IAuthRemoteDataSource _datasource;

  const AuthRepository(this._datasource);

  @override
  Future<Either<AuthFailure, AccountModel>> signIn(
    String email,
    String password,
  ) async {
    try {
      final result = await _datasource.signIn(email, password);
      return Right(result);
    } on TimeoutException {
      return Left(AuthFailure.timeout());
    } on UnauthorizedException {
      return Left(AuthFailure.unauthorized());
    } on BadRequestException {
      return Left(AuthFailure.badRequest());
    } on InternalServerErrorException {
      return Left(AuthFailure.server());
    } catch (e) {
      return Left(AuthFailure.unexpected());
    }
  }

  @override
  Future<Either<AuthFailure, void>> signUp(
    String email,
    String password,
  ) async {
    try {
      await _datasource.signUp(email, password);
      return const Right(null);
    } on TimeoutException {
      return Left(AuthFailure.timeout());
    } on BadRequestException {
      return Left(AuthFailure.badRequest());
    } on InternalServerErrorException {
      return Left(AuthFailure.server());
    } catch (e) {
      return Left(AuthFailure.unexpected());
    }
  }
}
