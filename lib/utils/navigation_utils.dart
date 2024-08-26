import 'package:crud_provider/users_list/views/add_user_screen.dart';
import 'package:crud_provider/users_list/views/user_details_screen.dart';
import 'package:flutter/material.dart';

void openUserDetails(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => const UserDetailsScreen(),
    ),
  );
}

void openAddUser(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => const AddUserScreen(),
    ),
  );
}
