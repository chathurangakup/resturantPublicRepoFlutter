import 'package:flutter/cupertino.dart';

class SignupbodyModel{
  String firstName;
  String lastName;
  String phoneno;
  String date;
  String email;
  String password;

  SignupbodyModel({
    @required  this.firstName,
    @required  this.lastName,
    @required  this.phoneno,
    @required  this.date,
    @required  this.email,
    @required  this.password,
  });

  Map<String,dynamic> toJson() {
    return {
      "firstName":firstName,
      "lastName":lastName,
      "phoneno":phoneno,
      "date":date,
      "email":email,
      "password":password
    };
  }
}