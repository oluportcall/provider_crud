import 'package:crud_provider/components/app_title.dart';
import 'package:crud_provider/users_list/view_models/users_view_models.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserDetailsScreen extends StatelessWidget {
  const UserDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    UsersViewModels usersViewModels = context.watch<UsersViewModels>();

    return Scaffold(
      appBar: AppBar(
        title: Text(usersViewModels.selectedUser.name!),
      ),
      body: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppTitle(
                title: usersViewModels.selectedUser.name!,
              ),
              Text(
                usersViewModels.selectedUser.email!,
                style: const TextStyle(color: Colors.black),
              )
            ],
          )),
    );
  }
}
