
import 'package:flutter/material.dart';

class ItemCategory{
  int _id;
  String _catid;
  String _categoryname;
  String _price;
  double _totprice;
  int _qty;
  String _img;

  ItemCategory(this._catid,this._categoryname,this._price,this._totprice,this._qty,this._img);
  ItemCategory.withId(this._id,this._catid,this._categoryname,this._price,this._totprice,this._qty,this._img);

  int get id=>_id;
  String get catid=>_catid;
  String get categoryname=>_categoryname;
  String get price=>_price;
  double get totprice=>_totprice;
  int get qty=>_qty;
  String get img=>_img;


  set catid(String catId){
     this.catid=catId;
  }

  set price(String priceValue){
    this.price=priceValue;
  }

  set totprice(double totPrice){
    this.totprice=totPrice;
  }

  set categoryname(String categoryname){
    this.categoryname=categoryname;
  }

  set qty(int qtyVal){
    this.qty =qtyVal;
  }

  set img(String imgName){
    this.img =imgName;
  }


  //convert ItemCategory object to map object
    Map<String,dynamic> toMap(){
        var map=Map<String,dynamic>();
        if(id!=null){
            map['id']=_id;
        }
        map['catid']=_catid;
        map['categoryname']=_categoryname;
        map['price']=_price;
        map['totprice']=_totprice;
        map['qty']=_qty;
        map['img']=_img;

        return map;
    }

    //Extract a Note object to map object
  ItemCategory.fromMpObject(Map<String,dynamic> map){
    this._id=map['id'];
    this._catid=map['catid'];
    this._categoryname=map['categoryname'];
    this._price=map['price'];
    this._totprice=map['totprice'];
    this._qty =map['qty'];
    this._img=map['img'];
  }



}