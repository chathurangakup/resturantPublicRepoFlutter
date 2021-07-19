import 'package:flutter/cupertino.dart';

class ProfileUpdatebodyModel{
  String userid;
  String firstName;
  String lastName;
  String phoneno;
  String password;

  ProfileUpdatebodyModel({
    @required  this.userid,
    @required  this.firstName,
    @required  this.lastName,
    @required  this.phoneno,
    @required  this.password,

  });

  Map<String,dynamic> toJson() {
    return {
      "userid":userid,
      "firstName":firstName,
      "lastName":lastName,
      "phoneno":phoneno,
      "password":password,

    };
  }
}