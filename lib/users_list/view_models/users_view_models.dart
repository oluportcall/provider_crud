//file talks to the users_list/models/user_list_model.dart

import 'package:crud_provider/users_list/models/user_error.dart';
import 'package:crud_provider/users_list/models/users_list_model.dart';
import 'package:crud_provider/users_list/repo/api_status.dart';
import 'package:crud_provider/users_list/repo/user_services.dart';
import 'package:flutter/material.dart';

class UsersViewModels extends ChangeNotifier {
  bool _loading = false;
  List<UserModel> _userListModel = [];
  UserError _userError = UserError(code: 0, message: '');
  UserModel _selectedUser;
  UserModel _addingUser = UserModel();

  bool get loading => _loading;
  List<UserModel> get userList => _userListModel;
  UserError get userError => _userError;
  UserModel get selectedUser => _selectedUser;
  UserModel get addingUser => _addingUser;

  UsersViewModels()
      : _selectedUser = UserModel(),
        _addingUser = UserModel(), // Initialize _addingUser
        super() {
    getUsers();
  }

  setLoading(bool loading) {
    _loading = loading;
    notifyListeners();
  }

  setUserListModel(List<UserModel> userListModel) {
    _userListModel = userListModel;
    notifyListeners();
  }

  addUser() {
    if (!isValid()) {
      return false;
    }
    _userListModel.add(addingUser);
    _addingUser = UserModel();
    notifyListeners();
    return true;
  }

  isValid() {
    if (addingUser.name == null || addingUser.name!.isEmpty) {
      return false;
    }
    if (addingUser.email == null || addingUser.email!.isEmpty) {
      return false;
    }
    return true;
  }

  setUserError(UserError userError) {
    _userError = userError;
    notifyListeners();
  }

  setSelectedUser(UserModel selected) {
    _selectedUser = selected;
  }

  getUsers() async {
    try {
      setLoading(true);
      final response = await UserServices.getUsers();
      if (response is Success) {
        setUserListModel(response.response as List<UserModel>);
      }

      if (response is Failure) {
        UserError userError =
            UserError(code: response.code, message: 'Invalid Response');
        setUserError(userError);
      }
      setLoading(false); //this set the loading will update the UI as expected
    } on Exception catch (e) {
      setLoading(false);
    }
  }
}
