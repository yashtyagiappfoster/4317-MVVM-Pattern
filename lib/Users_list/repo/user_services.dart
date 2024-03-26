import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:mvvm_one/Users_list/models/users_model.dart';
import 'package:mvvm_one/Users_list/repo/api_status.dart';
import 'package:mvvm_one/utils/constants.dart';

class UserServices {
  static Future<Object> getUsers() async {
    try {
      var response = await http.get(Uri.parse(users_api));
      if (response.statusCode == success) {
        return Success(
            code: success, response: usersListModelFromJson(response.body));
      }
      return Failure(
          code: user_invalid_response, errorresponse: 'Invalid Response');
    } on HttpException {
      return Failure(
          code: no_internet, errorresponse: 'No Internet Connection');
    } on SocketException {
      return Failure(
          code: no_internet, errorresponse: 'No Internet Connectrion');
    } on FormatException {
      return Failure(code: invalid_format, errorresponse: 'Invalid Format');
    } catch (e) {
      return Failure(code: unknown_error, errorresponse: 'Unknown Error');
    }
  }
}
