import 'dart:convert';

import 'package:http/http.dart' as http;


import '../data/strings_data.dart' ;
import '../model/user.dart';


class FormsProvider {

  Future<void> submitUserData( UserDetail userDetail){
    return  http.post(StringsData.userDB, body: json.encode({
      "username" : userDetail.username,
      "password" : userDetail.password,
      "dob" : userDetail.dob,
      "mobileNo" : userDetail.mobileNo,
      "emailId" : userDetail.emailId

    })).then( ( response ){
      print("success" + StringsData.userDB);
      print( json.decode(response.body));
    }).catchError((e) {
      print(e);
    });
  }

}