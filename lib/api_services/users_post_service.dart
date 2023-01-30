import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:zigy/api_services/api_status.dart';
import 'package:zigy/utils/api_constants.dart';
import '../models/users_post_model.dart';

class UserPostService {
  static Future<Object> getPosts() async {
    try{
      var url = Uri.parse(postUrl);
      var response = await http.get(url);
      if (response.statusCode == getSuccessCode) {
        return Success(code: getSuccessCode,
        response: usersPostModelFromJson(response.body));
      }
      return Failure(code: invalidResponse, errorMessage: 'Invalid Response');
    } on HttpException {
      return Failure(code: noInternet, errorMessage: 'No Internet');
    } on FormatException {
      return Failure(code: invalidFormat, errorMessage: 'Invalid Format');
    } catch (e) {
      return Failure(code: unknownError, errorMessage: e.toString());
    }
  }
}