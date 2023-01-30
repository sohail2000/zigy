import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:zigy/api_services/api_status.dart';
import 'package:zigy/models/user_model.dart';
import 'package:zigy/utils/api_constants.dart';

class UserService {
  static Future<Object> getUsers() async{
    try{
      var url = Uri.parse(usersUrl);
      var response = await http.get(url);
      if (response.statusCode == getSuccessCode) {
        return Success(code: getSuccessCode,
        response: usersModelFromJson(response.body));
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