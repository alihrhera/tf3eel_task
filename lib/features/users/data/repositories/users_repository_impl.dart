import 'package:dartz/dartz.dart';
import 'package:tf3eel_task/core/constants/api_endpoints.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/network/api_client.dart';
import '../model/user_model.dart';
import '../model/users_response_model.dart';
import '../../domain/repositories/users_repository.dart';

class UsersRepositoryImpl implements UsersRepository {
  final ApiClient _apiClient;

  UsersRepositoryImpl({required ApiClient apiClient}) : _apiClient = apiClient;

  @override
  Future<Either<Failure, UsersResponseModel>> getUsers(int page) async {
    try {
      final response = await _apiClient.get(ApiEndpoints.users);
      return Right(UsersResponseModel.fromJson(response));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    }
    on UnauthorizedException catch (e){
      return Left(ServerFailure(e.message.toString()));
    }
    on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on NotFoundException catch (e) {
      return Left(NotFoundFailure(e.message));
    } catch (e) {
      return Left(NotFoundFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserModel>> getUserById(int id) async {
    try {
      final response = await _apiClient.get(ApiEndpoints.getUserById(id));
      final data = response['data'] ?? response;
      return Right(UserModel.fromJson(data));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    }
    on UnauthorizedException catch (e){
      return Left(ServerFailure(e.message.toString()));
    }
    on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on NotFoundException catch (e) {
      return Left(NotFoundFailure(e.message));
    } catch (e) {
      return Left(NetworkFailure(e.toString()));
    }
  }
}
