import 'package:get_it/get_it.dart';
import '../../features/users/data/repositories/users_repository_impl.dart';
import '../../features/users/domain/repositories/users_repository.dart';
import '../network/api_client.dart';

final sl = GetIt.instance;

Future<void> init() async {

  // Repositories
  sl.registerLazySingleton<UsersRepository>(
    () => UsersRepositoryImpl(apiClient: sl()),
  );

  // Core
  sl.registerLazySingleton(() => ApiClient());
}
