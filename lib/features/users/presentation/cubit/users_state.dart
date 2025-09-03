import 'package:equatable/equatable.dart';
import 'package:tf3eel_task/features/users/data/model/user_model.dart';

abstract class UsersState extends Equatable {
  const UsersState();

  @override
  List<Object> get props => [];
}

class UsersInitial extends UsersState {}

class UsersLoading extends UsersState {}

class UsersLoaded extends UsersState {
  final List<UserModel> users;
  final bool hasReachedMax;
  final bool isLoadingMore;

  const UsersLoaded({
    required this.users,
    required this.hasReachedMax,
    this.isLoadingMore = false,
  });

  UsersLoaded copyWith({
    List<UserModel>? users,
    bool? hasReachedMax,
    bool? isLoadingMore,
  }) {
    return UsersLoaded(
      users: users ?? this.users,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
    );
  }

  @override
  List<Object> get props => [users, hasReachedMax, isLoadingMore];
}

class UsersError extends UsersState {
  final String message;

  const UsersError(this.message);

  @override
  List<Object> get props => [message];
}

// User Detail States
abstract class UserDetailState extends Equatable {
  const UserDetailState();

  @override
  List<Object> get props => [];
}

class UserDetailInitial extends UserDetailState {}

class UserDetailLoading extends UserDetailState {}

class UserDetailLoaded extends UserDetailState {
  final UserModel user;

  const UserDetailLoaded(this.user);

  @override
  List<Object> get props => [user];
}

class UserDetailError extends UserDetailState {
  final String message;

  const UserDetailError(this.message);

  @override
  List<Object> get props => [message];
}
