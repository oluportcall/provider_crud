import 'dart:io';
import 'package:crud_provider/users_list/models/users_list_model.dart';
import 'package:crud_provider/users_list/repo/api_status.dart';
import 'package:crud_provider/utils/constants.dart';
import 'package:http/http.dart' as http;

class UserServices {
  static Future<Object> getUsers() async {
    try {
      var response = await http.get(Uri.parse(USERS_LIST));
      if (SUCCESS == response.statusCode) {
        return Success(
            code: SUCCESS, response: userListModelFromJson(response.body));
      }
      return Failure(
          code: USER_INVALID_RESPONSE, errorResponse: 'Invalid Response');
    } on HttpException {
      return Failure(
          code: NO_INTERNET, errorResponse: 'No Internet Connection');
    } on SocketException {
      return Failure(
          code: NO_INTERNET, errorResponse: 'No Internet Connection');
    } on FormatException {
      return Failure(code: INVALID_FORMAT, errorResponse: 'Invalid Format');
    } catch (e) {
      return Failure(code: UNKNOWN_ERROR, errorResponse: 'Unknown Error');
    }
  }
}
