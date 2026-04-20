import 'package:fpdart/fpdart.dart';

import '../domain.dart';

abstract class IHomeRepository {
  Future<Either<HomeFailure, Unit>> addAnnotation(AnnotationModel annotation);

  Future<Either<HomeFailure, Unit>> deleteAnnotation(int id);

  Future<Either<HomeFailure, Unit>> editAnnotation(AnnotationModel annotation);

  Future<Either<HomeFailure, List<AnnotationModel>>> getAnnotations();

  Future<Either<HomeFailure, Unit>> logout();
}
