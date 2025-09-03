import 'package:flutter/material.dart';
import 'package:tf3eel_task/features/users/data/model/user_model.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/constants/app_colors.dart';

class UserDetailCard extends StatelessWidget {
  final UserModel user;

  const UserDetailCard({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(AppDimensions.paddingLarge),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 80,
              backgroundImage: NetworkImage(user.avatar),
              backgroundColor: AppColors.divider,
            ),
            SizedBox(height: AppDimensions.paddingLarge),
            Text(
              user.fullName,
              style: Theme.of(context).textTheme.headlineLarge,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: AppDimensions.paddingSmall),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.email,
                  color: AppColors.primary,
                  size: AppDimensions.iconSize,
                ),
                SizedBox(width: AppDimensions.paddingSmall),
                Flexible(
                  child: Text(
                    user.email,
                    style: Theme.of(context).textTheme.bodyLarge,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            SizedBox(height: AppDimensions.paddingMedium),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.person,
                  color: AppColors.primary,
                  size: AppDimensions.iconSize,
                ),
                SizedBox(width: AppDimensions.paddingSmall),
                Text(
                  'ID: ${user.id}',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
