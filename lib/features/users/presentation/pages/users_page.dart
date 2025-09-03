import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/widgets/common/loading_widget.dart';
import '../../../../core/widgets/common/error_widget.dart';
import '../cubit/users_cubit.dart';
import '../cubit/users_state.dart';
import '../widgets/user_item.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({super.key});

  @override
  _UsersPageState createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
    context.read<UsersCubit>().fetchUsers();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent * 0.9) {
      context.read<UsersCubit>().loadMoreUsers();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppStrings.users)),
      body: BlocBuilder<UsersCubit, UsersState>(
        builder: (context, state) {
          if (state is UsersLoading) {
            return LoadingWidget();
          } else if (state is UsersError) {
            return CustomErrorWidget(
              message: state.message,
              onRetry: () => context.read<UsersCubit>().fetchUsers(),
            );
          } else if (state is UsersLoaded) {
            return ListView.builder(
              controller: _scrollController,
              itemCount: state.users.length + (state.isLoadingMore ? 1 : 0),
              itemBuilder: (context, index) {
                if (index >= state.users.length) {
                  return Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Center(child: CircularProgressIndicator()),
                  );
                }

                return UserItem(
                  user: state.users[index],
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/user-detail',
                      arguments: state.users[index].id,
                    );
                  },
                );
              },
            );
          }

          return Container();
        },
      ),
    );
  }
}
