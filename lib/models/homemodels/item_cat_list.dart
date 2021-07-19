

import 'package:resturantapp/models/homemodels/commentmodel.dart';
import 'package:resturantapp/models/homemodels/vartentmodel.dart';



class ItemCatListModel{
  String id;
  String image;
  String itemid;
  String categoryname;
  String description;
  String price;
  bool islike;
  int size;
  int review;
  List<VarientModel> varients;
  List<CommentModel> comments;



  ItemCatListModel({this.id,this.image,this.itemid,this.categoryname,this.description,this.price,this.islike,this.comments,this.varients,this.size,this.review});

//  factory ItemCatListModel.fromJson(Map<String, dynamic> json) {
//    return ItemCatListModel(
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
}





