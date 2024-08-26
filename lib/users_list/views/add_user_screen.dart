import 'package:crud_provider/users_list/view_models/users_view_models.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddUserScreen extends StatelessWidget {
  const AddUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    UsersViewModels usersViewModels = context.watch<UsersViewModels>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add User'),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () async {
              var userAdded = await usersViewModels.addUser();
              if (!userAdded) {
                return;
              }
              Navigator.pop(context);
            },
          )
        ],
      ),
      body: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const SizedBox(
                height: 20.0,
              ),
              TextFormField(
                decoration: const InputDecoration(hintText: 'Name'),
                onChanged: (val) async {
                  usersViewModels.addingUser.name = val;
                },
              ),
              const SizedBox(
                height: 20.0,
              ),
              TextFormField(
                decoration: const InputDecoration(hintText: 'Email'),
                onChanged: (val) async {
                  usersViewModels.addingUser.email = val;
                },
              )
            ],
          )),
    );
  }
}
