import 'package:desafio_flutter/features/home/data/datasources/home_remote_datasource.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/core.dart';
import '../../domain/domain.dart';

class HomeRepository implements IHomeRepository {
  final IHomeRemoteDataSource _datasource;

  const HomeRepository(this._datasource);

  @override
  Future<Either<HomeFailure, Unit>> addAnnotation(
    AnnotationModel annotation,
  ) async {
    try {
      await _datasource.addAnnotation(annotation);
      return Right(unit);
    } on NotFoundException {
      return Left(HomeFailure.notFound());
    } on BadRequestException {
      return Left(HomeFailure.badRequest());
    } on ForbiddenException {
      return Left(HomeFailure.forbidden());
    } on UnauthorizedException {
      return Left(HomeFailure.unauthorized());
    } catch (e) {
      return Left(HomeFailure.unexpected());
    }
  }

  @override
  Future<Either<HomeFailure, Unit>> deleteAnnotation(int id) async {
    try {
      await _datasource.deleteAnnotation(id);
      return Right(unit);
    } on NotFoundException {
      return Left(HomeFailure.notFound());
    } on BadRequestException {
      return Left(HomeFailure.badRequest());
    } on ForbiddenException {
      return Left(HomeFailure.forbidden());
    } on UnauthorizedException {
      return Left(HomeFailure.unauthorized());
    } catch (e) {
      return Left(HomeFailure.unexpected());
    }
  }

  @override
  Future<Either<HomeFailure, Unit>> editAnnotation(
    AnnotationModel annotation,
  ) async {
    try {
      await _datasource.editAnnotation(annotation);
      return Right(unit);
    } on NotFoundException {
      return Left(HomeFailure.notFound());
    } on BadRequestException {
      return Left(HomeFailure.badRequest());
    } on ForbiddenException {
      return Left(HomeFailure.forbidden());
    } on UnauthorizedException {
      return Left(HomeFailure.unauthorized());
    } catch (e) {
      return Left(HomeFailure.unexpected());
    }
  }

  @override
  Future<Either<HomeFailure, List<AnnotationModel>>> getAnnotations() async {
    try {
      final annotations = await _datasource.getAnnotations();
      return Right(annotations);
    } on NotFoundException {
      return Left(HomeFailure.notFound());
    } on BadRequestException {
      return Left(HomeFailure.badRequest());
    } on ForbiddenException {
      return Left(HomeFailure.forbidden());
    } on UnauthorizedException {
      return Left(HomeFailure.unauthorized());
    } catch (e) {
      return Left(HomeFailure.unexpected());
    }
  }

  @override
  Future<Either<HomeFailure, Unit>> logout() async {
    try {
      await _datasource.logout();
      return const Right(unit);
    } on NotFoundException {
      return Left(HomeFailure.notFound());
    } on BadRequestException {
      return Left(HomeFailure.badRequest());
    } on ForbiddenException {
      return Left(HomeFailure.forbidden());
    } on UnauthorizedException {
      return Left(HomeFailure.unauthorized());
    } catch (e) {
      return Left(HomeFailure.unexpected());
    }
  }
}
