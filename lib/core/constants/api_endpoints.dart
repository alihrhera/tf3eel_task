class ApiEndpoints {
  static const String baseUrl = 'https://reqres.in/api';
  static const String users = '$baseUrl/users';

  static String getUserById(int id) => '$users/$id';
}
