import 'package:flutter/cupertino.dart';
import 'package:resturantapp/models/sqlite/itemcatwithvarient.dart';

class CartbodyModel{
  String userid;
  List<ItemCatVarientListModel> cartitems;
  String type;
  String address;
  String totalprice;
  String date;
  String time;
  String ordertime;


  CartbodyModel({
    @required  this.userid,
    @required  this.cartitems,
    @required  this.type,
    @required  this.address,
    @required  this.totalprice,
    @required  this.date,
    @required  this.time,
    @required  this.ordertime,



  });


  factory CartbodyModel.fromJson(Map<String, dynamic> parsedJson){
    return CartbodyModel(
        userid:parsedJson['userid'],
        cartitems:parseitemCat(parsedJson),
        type:parsedJson['type'],
        address:parsedJson['address'],
        totalprice:parsedJson['totalprice'],
        date:parsedJson['date'],
        time:parsedJson['time'],
        ordertime:parsedJson['ordertime'],

    );
  }



  Map<String,dynamic> toJson() {
    return {
      "userid":userid,
      "cartitems":cartitems,
      "type":type,
      "address":address,
      "totalprice":totalprice,
      "date":date,
      "time":time,
      "ordertime":ordertime
    };
  }


  static List<ItemCatVarientListModel> parseitemCat(itemcatJson){
    var list=itemcatJson['cartitems'] as List;
    List<ItemCatVarientListModel> itemCatList=
        list.map((data)=>ItemCatVarientListModel.fromJson(data)).toList();
    return itemCatList;
  }

}