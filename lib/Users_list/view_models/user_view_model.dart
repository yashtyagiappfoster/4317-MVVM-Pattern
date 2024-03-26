import 'package:flutter/material.dart';
import 'package:mvvm_one/Users_list/models/user_error.dart';
import 'package:mvvm_one/Users_list/models/users_model.dart';
import 'package:mvvm_one/Users_list/repo/api_status.dart';
import 'package:mvvm_one/Users_list/repo/user_services.dart';

class UserViewModel with ChangeNotifier {
  bool _loading = false;
  List<UsersModel> _usersList = [];
  UserError? _userError;

  bool get loading => _loading;
  List<UsersModel> get usersList => _usersList;
  UserError? get userError => _userError;

  UserViewModel() {
    getUsers();
  }

  setLoading(bool loading) {
    _loading = loading;
    notifyListeners();
  }

  setUsersList(List<UsersModel> list) {
    _usersList = list;
    notifyListeners();
  }

  setUserError(UserError error) {
    _userError = error;
    notifyListeners();
  }

  getUsers() async {
    setLoading(true);
    var response = await UserServices.getUsers();
    if (response is Success) {
      setUsersList(response.response as List<UsersModel>);
    }
    if (response is Failure) {
      UserError userError = UserError(
        code: response.code,
        message: response.errorresponse.toString(),
      );
      setUserError(userError);
    }
    notifyListeners();
    setLoading(false);
  }
}
