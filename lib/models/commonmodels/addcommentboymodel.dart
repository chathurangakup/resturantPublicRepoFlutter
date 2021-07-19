import 'dart:ffi';

import 'package:flutter/cupertino.dart';

class AddCommentbodyModel{
  String userid;
  String username;
  String date;
  String comment;
  String rating;


  AddCommentbodyModel({
    @required  this.userid,
    @required  this.username,
    @required  this.date,
    @required  this.comment,
    @required  this.rating,

  });

  Map<String,dynamic> toJson() {
    return {
      "userid":userid,
      "username":username,
      "date":date,
      "comment":comment,
      "rating":rating,

    };
  }
}