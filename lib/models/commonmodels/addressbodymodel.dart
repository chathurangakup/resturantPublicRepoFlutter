import 'package:flutter/cupertino.dart';

class AddressbodyModel{
  String userid;
  String address;


  AddressbodyModel({
    @required  this.userid,
    @required  this.address,

  });

  Map<String,dynamic> toJson() {
    return {
      "userid":userid,
      "address":address,

    };
  }
}