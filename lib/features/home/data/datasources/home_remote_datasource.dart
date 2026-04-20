import 'package:fpdart/fpdart.dart';

import '../../../../core/core.dart';
import '../../domain/domain.dart';

abstract class IHomeRemoteDataSource {
  Future<Unit> addAnnotation(AnnotationModel annotation);

  Future<Unit> deleteAnnotation(int id);

  Future<Unit> editAnnotation(AnnotationModel annotation);

  Future<List<AnnotationModel>> getAnnotations();

  Future<Unit> logout();
}

class HomeRemoteDataSource implements IHomeRemoteDataSource {
  final IHttpClient _httpClient;
  final IAuthTokenStorageAdapter _authTokenStorage;

  HomeRemoteDataSource(this._httpClient, this._authTokenStorage);

  @override
  Future<Unit> addAnnotation(AnnotationModel annotation) async {
    final payload = await _buildAnnotationPayload(annotation);

    await _httpClient.post(ApiConstants.insertAnnotation, body: payload);
    return unit;
  }

  @override
  Future<Unit> deleteAnnotation(int id) async {
    await _httpClient.delete(ApiConstants.deleteAnnotation(id));
    return unit;
  }

  @override
  Future<Unit> editAnnotation(AnnotationModel annotation) async {
    final payload = await _buildAnnotationPayload(annotation, update: true);

    await _httpClient.patch(
      ApiConstants.updateAnnotation(annotation.id!),
      body: payload,
    );
    return unit;
  }

  @override
  Future<List<AnnotationModel>> getAnnotations() async {
    final userId = await _authTokenStorage.getUserId();

    if (userId == null || userId.trim().isEmpty) {
      throw const UnauthorizedException(message: 'Usuario nao identificado');
    }

    final response = await _httpClient.get(
      ApiConstants.annotations(userId: userId),
    );
    final responseData = response.data;

    if (responseData is! List) {
      throw const InternalServerErrorException(
        message: 'Formato de resposta invalido para anotacoes',
      );
    }

    return responseData
        .whereType<Map>()
        .map(
          (json) => AnnotationModel.fromJson(Map<String, dynamic>.from(json)),
        )
        .toList();
  }

  @override
  Future<Unit> logout() async {
    await _httpClient.post(ApiConstants.logout);
    return unit;
  }

  Future<Map<String, dynamic>> _buildAnnotationPayload(
    AnnotationModel annotation, {
    bool update = false,
  }) async {
    final storedUserId = await _authTokenStorage.getUserId();
    final resolvedUserId = annotation.userId.isNotEmpty
        ? annotation.userId
        : (storedUserId ?? '');

    if (resolvedUserId.isEmpty) {
      throw const UnauthorizedException(message: 'Usuario nao identificado');
    }

    return AnnotationModel.toJson(
      annotation.copyWith(userId: resolvedUserId),
      update: update,
    );
  }
}
