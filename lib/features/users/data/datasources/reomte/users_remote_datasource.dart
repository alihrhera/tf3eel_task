import 'package:tf3eel_task/features/users/data/model/user_model.dart';
import 'package:tf3eel_task/features/users/data/model/users_response_model.dart';

import '../../../../../core/network/api_client.dart';
import '../../../../../core/constants/api_endpoints.dart';

abstract class UsersRemoteDataSourceInterface {
  Future<UsersResponseModel> getUsers();
  Future<UserModel> getUserById(int id);
}

class UsersRemoteDataSource implements UsersRemoteDataSourceInterface {
  final ApiClient _apiClient;

  UsersRemoteDataSource(this._apiClient);

  @override
  Future<UsersResponseModel> getUsers() async {
    final response = await _apiClient.get(ApiEndpoints.users);
    return UsersResponseModel.fromJson(response);
  }

  @override
  Future<UserModel> getUserById(int id) async {
    final response = await _apiClient.get(ApiEndpoints.getUserById(id));
    return UserModel.fromJson(response['data']);
  }
}
