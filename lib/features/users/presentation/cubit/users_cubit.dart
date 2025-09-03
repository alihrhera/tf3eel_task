import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/repositories/users_repository.dart';
import 'users_state.dart';

class UsersCubit extends Cubit<UsersState> {
  final UsersRepository repository;
  int _currentPage = 1;

  UsersCubit(this.repository) : super(UsersInitial());

  Future<void> fetchUsers() async {
    if (state is UsersLoading) return;

    emit(UsersLoading());

    final result = await repository.getUsers(_currentPage);

    result.fold((failure) => emit(UsersError(failure.message)), (
      usersResponse,
    ) {
      emit(
        UsersLoaded(
          users: usersResponse.data,
          hasReachedMax: !usersResponse.hasMorePages,
        ),
      );
      _currentPage = usersResponse.page + 1;
    });
  }

  Future<void> loadMoreUsers() async {
    final currentState = state;
    if (currentState is! UsersLoaded ||
        currentState.hasReachedMax ||
        currentState.isLoadingMore)
      return;

    emit(currentState.copyWith(isLoadingMore: true));

    final result = await repository.getUsers(_currentPage);

    result.fold((failure) => emit(UsersError(failure.message)), (
      usersResponse,
    ) {
      final updatedUsers = [...currentState.users, ...usersResponse.data];
      emit(
        UsersLoaded(
          users: updatedUsers,
          hasReachedMax: !usersResponse.hasMorePages,
          isLoadingMore: false,
        ),
      );
      _currentPage = usersResponse.page + 1;
    });
  }
}

class UserDetailCubit extends Cubit<UserDetailState> {
  final UsersRepository repository;

  UserDetailCubit(this.repository) : super(UserDetailInitial());

  Future<void> fetchUserById(int id) async {
    emit(UserDetailLoading());

    final result = await repository.getUserById(id);

    result.fold(
      (failure) => emit(UserDetailError(failure.message)),
      (user) => emit(UserDetailLoaded(user)),
    );
  }
}
