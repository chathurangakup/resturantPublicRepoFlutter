import 'package:flutter/cupertino.dart';

class LikesbodyModel{
  String itemcategoryid;
  String userid;

  LikesbodyModel({
    @required  this.itemcategoryid,
    @required  this.userid,

  });

  Map<String,dynamic> toJson() {
    return {
      "itemcategoryid":itemcategoryid,
      "userid":userid,

    };
  }
}