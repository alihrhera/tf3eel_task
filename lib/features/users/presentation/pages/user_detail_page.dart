import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/widgets/common/loading_widget.dart';
import '../../../../core/widgets/common/error_widget.dart';
import '../cubit/users_cubit.dart';
import '../cubit/users_state.dart';
import '../widgets/user_detail_card.dart';

class UserDetailPage extends StatelessWidget {
  final int userId;

  const UserDetailPage({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppStrings.userDetails)),
      body: BlocBuilder<UserDetailCubit, UserDetailState>(
        builder: (context, state) {
          if (state is UserDetailLoading) {
            return LoadingWidget();
          } else if (state is UserDetailError) {
            return CustomErrorWidget(
              message: state.message,
              onRetry: () =>
                  context.read<UserDetailCubit>().fetchUserById(userId),
            );
          } else if (state is UserDetailLoaded) {
            return Padding(
              padding: EdgeInsets.all(AppDimensions.paddingMedium),
              child: UserDetailCard(user: state.user),
            );
          }
          return Container();
        },
      ),
    );
  }
}
