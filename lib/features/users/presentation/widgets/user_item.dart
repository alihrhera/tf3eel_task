import 'package:flutter/material.dart';
import 'package:tf3eel_task/features/users/data/model/user_model.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/constants/app_colors.dart';

class UserItem extends StatelessWidget {
  final UserModel user;
  final VoidCallback onTap;

  const UserItem({super.key, required this.user, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(
        horizontal: AppDimensions.paddingMedium,
        vertical: AppDimensions.paddingSmall,
      ),
      child: ListTile(
        onTap: onTap,
        leading: CircleAvatar(
          radius: AppDimensions.avatarSize / 2,
          backgroundImage: NetworkImage(user.avatar),
          backgroundColor: AppColors.divider,
        ),
        title: Text(
          user.fullName,
          style: Theme.of(
            context,
          ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
        ),
        subtitle: Text(
          user.email,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          size: AppDimensions.iconSize,
          color: AppColors.textSecondary,
        ),
      ),
    );
  }
}
