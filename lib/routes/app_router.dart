import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tf3eel_task/core/di/injection_container.dart';
import 'package:tf3eel_task/features/users/presentation/cubit/users_cubit.dart';
import 'package:tf3eel_task/routes/route_constants.dart';
import '../features/users/presentation/pages/users_page.dart';
import '../features/users/presentation/pages/user_detail_page.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteConstants.home:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => UsersCubit(sl())..fetchUsers(),
            child: UsersPage(),
          ),
        );

      case RouteConstants.userDetail:
        final userId = settings.arguments as int;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => UserDetailCubit(sl())..fetchUserById(userId),
            child: UserDetailPage(userId: userId),
          ),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
