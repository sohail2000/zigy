// ignore: file_names
import 'package:flutter/material.dart';
import 'package:zigy/api_services/api_status.dart';
import 'package:zigy/api_services/users_post_service.dart';
import 'package:zigy/models/users_post_model.dart';

class UserPostNotifier extends ChangeNotifier {
  UserPostNotifier() {
    getpost();
  }

  bool _loading = false;
  List<Datum> _usersPostList = [];

  bool get loading => _loading;
  List<Datum> get usersPostList => _usersPostList;

  setLoading(bool loading) async {
    _loading = loading;
    notifyListeners();
  }

  setusersPostList(List<Datum> usersPostList) {
    _usersPostList = usersPostList;
  }

  getpost() async {
    setLoading(true);
    var res = await UserPostService.getPosts();
    if (res is Success) {
      UsersPostModel usersPostModel = res.response as UsersPostModel;
      List<Datum> usersPost = usersPostModel.data;
      setusersPostList(usersPost);
    }
    setLoading(false);
  }
}
