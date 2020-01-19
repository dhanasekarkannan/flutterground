import 'dart:convert';

import 'package:http/http.dart' as http;

import '../data/strings_data.dart';
import '../model/user.dart';

class FormsProvider {
  Future<void> submitUserData(UserDetail userDetail) async {
    try {
      final response = await http.post(StringsData.userDB,
          body: json.encode({
            "username": userDetail.username,
            "password": userDetail.password,
            "dob": userDetail.dob,
            "mobileNo": userDetail.mobileNo,
            "emailId": userDetail.emailId
          }));
          print(response.body);
    } catch (error) {
      print("error " + error);
      throw error;
    }
  }
}
