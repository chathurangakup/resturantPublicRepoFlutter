
import 'package:resturantapp/models/sqlite/varientssql.dart';



class ItemCatVarientListModel{
  final int id;
  final String catid;
  final String categoryname;
  final String price;
  final String image;
  final double totprice;
  final  int qty;
  final List<Varient> varients;

  ItemCatVarientListModel({this.id,this.catid,this.categoryname,this.price,this.image,this.totprice,this.qty,this.varients});

  factory ItemCatVarientListModel.fromJson(Map<String, dynamic> parsedJson){
    return ItemCatVarientListModel(
        id:parsedJson['id'],
        catid:parsedJson['catid'],
        categoryname:parsedJson['categoryname'],
        price:parsedJson['catid'],
        image:parsedJson['image'],
        totprice:parsedJson['totprice'],
        qty:parsedJson['qty'],
        varients:parsedJson['varients'],

    );
  }


  Map<String,dynamic> toJson(){
    return{
      "id":id,
      "catid":catid,
      "categoryname":categoryname,
      "price":price,
      "image":image,
      "totprice":totprice,
      "qty":qty,
      "varients":varients

    };
  }


  static List<Varient> parseiVarient(varientJson){
    var list=varientJson['varients'] as List;
    List<Varient> varienttList=
    list.map((data)=>Varient.fromMpObject(data)).toList();
    return varienttList;
  }


//  factory ItemCatVarientListModel.fromJson(Map<String, dynamic> json) {
//    return ItemCatVarientListModel(
//        id: json["id"] as String,
//        image: json["image"] as String,
//        plantname: json["plantname"] as String,
//        description: json["description"] as String,
//        date: json["date"] as String,
//        ispublish: json["ispublish"] as bool,
//        islike: json["islike"] as bool,
//        likedusercount: json["likedusercount"] as int,
//        commentusercount: json["commentusercount"] as int,
//        varients:json['listmodel'] as List<VarientModel>,
//
//        users: UserScreenModel.fromJson(json['users'])
//    );
//  }

//  Map<String,dynamic> toJson() {
//    return {
//      "id":id,
//      "catid":catid,
//      "categoryname":categoryname,
//      "price":price,
//      "image":image,
//      "totprice":totprice,
//      "qty":qty,
//      "varients":varients,
//
//    };
//  }

  //Extract a Note object to map object
//  ItemCatVarientListModel.fromJson(Map<String,dynamic> map){
//    this.id=map['id'];
//    this.catid=map['catid'];
//    this.categoryname=map['categoryname'];
//    this.price=map['price'];
//    this.totprice=map['totprice'];
//    this.qty =map['qty'];
//    this.varients=map['varients'];
//  }




}




class ItemCatVarientListModel1{
int id;
String catid;
String categoryname;
String price;
String image;
double totprice;
int qty;
Varient varients;


ItemCatVarientListModel1({this.id,this.catid,this.categoryname,this.price,this.image,this.totprice,this.qty,this.varients});

factory ItemCatVarientListModel1.fromJson(Map<String, dynamic> parsedJson){
    return ItemCatVarientListModel1(
    id:parsedJson['id'],
    catid:parsedJson['catid'],
    categoryname:parsedJson['categoryname'],
    price:parsedJson['catid'],
    image:parsedJson['image'],
    totprice:parsedJson['totprice'],
    qty:parsedJson['qty'],
    varients: parsedJson['varients']

    );
}


Map<String,dynamic> toJson(){
  return{
    "id":id,
    "catid":catid,
    "categoryname":categoryname,
    "price":price,
    "image":image,
    "totprice":totprice,
    "qty":qty,
    "varient":varients

  };
}


//  factory ItemCatVarientListModel.fromJson(Map<String, dynamic> json) {
//    return ItemCatVarientListModel(
//        id: json["id"] as String,
//        image: json["image"] as String,
//        plantname: json["plantname"] as String,
//        description: json["description"] as String,
//        date: json["date"] as String,
//        ispublish: json["ispublish"] as bool,
//        islike: json["islike"] as bool,
//        likedusercount: json["likedusercount"] as int,
//        commentusercount: json["commentusercount"] as int,
//        varients:json['listmodel'] as List<VarientModel>,
//
//        users: UserScreenModel.fromJson(json['users'])
//    );
//  }

//  Map<String,dynamic> toJson() {
//    return {
//      "id":id,
//      "catid":catid,
//      "categoryname":categoryname,
//      "price":price,
//      "image":image,
//      "totprice":totprice,
//      "qty":qty,
//      "varients":varients,
//
//    };
//  }

//Extract a Note object to map object
//  ItemCatVarientListModel.fromJson(Map<String,dynamic> map){
//    this.id=map['id'];
//    this.catid=map['catid'];
//    this.categoryname=map['categoryname'];
//    this.price=map['price'];
//    this.totprice=map['totprice'];
//    this.qty =map['qty'];
//    this.varients=map['varients'];
//  }




}







