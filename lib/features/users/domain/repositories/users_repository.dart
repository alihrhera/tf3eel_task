import 'package:dartz/dartz.dart';
import 'package:tf3eel_task/features/users/data/model/user_model.dart';
import 'package:tf3eel_task/features/users/data/model/users_response_model.dart';
import '../../../../core/errors/failures.dart';

abstract class UsersRepository {
  Future<Either<Failure, UsersResponseModel>> getUsers(int page);
  Future<Either<Failure, UserModel>> getUserById(int id);
}