// ignore: file_names
import 'package:flutter/material.dart';
import 'package:zigy/api_services/api_status.dart';
import 'package:zigy/api_services/user_service.dart';

import '../models/user_model.dart';

class UserNotifier extends ChangeNotifier {
  UserNotifier() {
    getUsers();
  }
  bool _loading = false;
  List<Datum> _usersList = [];

  bool get loading => _loading;
  List<Datum> get usersList => _usersList;

  setLoading(bool loading) async {
    _loading = loading;
    notifyListeners();
  }

  setUsersList(List<Datum> usersList) {
    _usersList = usersList;
  }

  getUsers() async {
    setLoading(true);
    var res = await UserService.getUsers();
    if (res is Success) {
      UsersModel usersModel = res.response as UsersModel;
      List<Datum> users = usersModel.data;
      setUsersList(users);
    }
    setLoading(false);
  }
}
