import 'package:crud_provider/components/app_error.dart';
import 'package:crud_provider/components/app_loading.dart';
import 'package:crud_provider/components/user_list_row.dart';
import 'package:crud_provider/users_list/models/users_list_model.dart';
import 'package:crud_provider/users_list/view_models/users_view_models.dart';
import 'package:crud_provider/utils/navigation_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    UsersViewModels usersViewModels = context.watch<UsersViewModels>();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Users"),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
              onPressed: () async {
                openAddUser(context);
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: Container(
        child: Column(
          children: [_Ui(usersViewModels)],
        ),
      ),
    );
  }

  Widget _Ui(UsersViewModels usersViewModels) {
    if (usersViewModels.loading) {
      return const Center(
        child: AppLoading(), // returns loading indicator
      );
    }

    // Instead of checking for null, handle the userError directly
    if (usersViewModels.userError.code != 0) {
      return AppError(
        errortxt: usersViewModels.userError.message.toString(),
      ); // returns error message
    }

    return Expanded(
      child: ListView.separated(
        itemBuilder: (context, index) {
          UserModel userModel = usersViewModels.userList[index];
          return UserListRow(
            userModel: userModel,
            onTap: () async {
              print("got here");
              usersViewModels.setSelectedUser(userModel);
              openUserDetails(context);
            },
          );
        },
        separatorBuilder: (context, index) => const Divider(),
        itemCount: usersViewModels.userList.length,
      ),
    );
  }
}
