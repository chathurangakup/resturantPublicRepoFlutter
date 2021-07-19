import 'package:flutter/cupertino.dart';

class LoginbodyModel{

  String email;
  String password;

  LoginbodyModel({

    @required  this.email,
    @required  this.password,
  });

  Map<String,dynamic> toJson() {
    return {

      "email":email,
      "password":password
    };
  }
}