import 'package:crud_provider/components/app_title.dart';
import 'package:crud_provider/users_list/models/users_list_model.dart';
import 'package:flutter/material.dart';

class UserListRow extends StatelessWidget {
  final UserModel userModel;
  final Function onTap;
  const UserListRow({
    super.key,
    required this.userModel,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppTitle(title: userModel.name!),
            Text(
              userModel.email!,
              style: const TextStyle(color: Colors.black),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
