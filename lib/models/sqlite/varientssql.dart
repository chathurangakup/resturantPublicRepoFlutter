
import 'package:flutter/material.dart';

class Varient{
  int _id;
  String _varid;
  int _catid;
  String _varientname;
  String _price;


  Varient(this._varid,this._catid,this._varientname,this._price);
  Varient.withId(this._id,this._varid,this._catid,this._varientname,this._price);



  int get id=>_id;
  String get varid=>_varid;
  int get catid=>_catid;
  String get varientname=>_varientname;
  String get price=>_price;



  set varid(String varId){
    this.varid=varId;
  }

  set catid(int catId){
    this.catid=catId;
  }

  set price(String priceValue){
    this.price=priceValue;
  }

  set varientname(String varientname){
    this.varientname=varientname;
  }




  //convert ItemCategory object to map object
  Map<String,dynamic> toMap(){
    var map=Map<String,dynamic>();
    if(id!=null){
      map['id']=_id;
    }

    map['varid']=_varid;
    map['catid']=_catid;
    map['varientname']=_varientname;
    map['price']=_price;


    return map;
  }

  //Extract a Note object to map object
  Varient.fromMpObject(Map<String,dynamic> map){
    this._id=map['id'];
    this._varid=map['varid'];
    this._catid=map['catid'];
    this._varientname=map['varientname'];
    this._price=map['price'];

  }





  Map<String,dynamic> toJson(){
    return{
      "id":id,
      "varid":varid,
      "catid":catid,
      "varientname":varientname,
      "price":price,


    };
  }


//  factory Varient.fromJson(Map<String, dynamic> parsedJson){
//    return Varient(
//      id:parsedJson['id'],
//      varid:parsedJson['varid'],
//      catid:parsedJson['catid'],
//      price:parsedJson['catid'],
//
//
//    );
//  }



}