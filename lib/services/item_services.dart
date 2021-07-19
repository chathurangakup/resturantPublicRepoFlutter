import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:resturantapp/models/api_responce.dart';
import 'package:resturantapp/models/commonmodels/addcommentModel.dart';
import 'package:resturantapp/models/commonmodels/addcommentboymodel.dart';
import 'package:resturantapp/models/homemodels/commentmodel.dart';
import 'package:resturantapp/models/homemodels/item_cat_list.dart';
import 'package:resturantapp/models/homemodels/item_list.dart';
import 'package:http/http.dart' as http;
import 'package:resturantapp/models/homemodels/likesmodel/likesbodymodel.dart';
import 'package:resturantapp/models/homemodels/likesmodel/likesmodel.dart';
import 'package:resturantapp/models/homemodels/vartentmodel.dart';

class ItemServices{
  static const API = 'https://resturant123newapp.herokuapp.com';

  Future<ApiResponse<List<ItemList>>> getItemList(){
    // print(item.toJson());
    return http.get(API + '/items/allmenuitems',
      headers: {
        "Authorization": ""},
    ).then((data){
      final jsonDate = json.decode(data.body);
      print(jsonDate['items']);
      final listview =<ItemList>[];
      // list.map((i) => projectDetails.fromJson(i)).toList()
      for (var item in jsonDate['items']){
       // print(item['menuItemsId']);
        final itemresult= ItemList(
          itemId: item['menuItemsId'],
          itemName: item['menuItemsName'],
        );
        listview.add(itemresult);
      }

      return ApiResponse<List<ItemList>>(
          data:listview
      );


    }).catchError((e)=>
        ApiResponse<ItemList>(
            error: true,
            errormessage: e
        )
    );
  }



//get item ctegory
  Future<ApiResponse<List<ItemCatListModel>>> getItemCatrgory(String itemid,String userid){
      var url=API + '/itemscategory/getmenucategory/$itemid/userid/$userid';
     print(url);
    return http.get(url,
      headers: {
        "Authorization": ""},
    ).then((data){
      final jsonDate = json.decode(data.body);
      print("jsonDate");
      print(jsonDate);
      final listview =<ItemCatListModel>[];
      // list.map((i) => projectDetails.fromJson(i)).toList()
      for (var item in jsonDate['result']){
         print(item['categoryname']);
if(item['likes'].length==0){

  final itemresult= ItemCatListModel(
    id: item['_id'],
    image: item['image'],
    itemid:item['itemid'],
    categoryname:item['categoryname'],
    description:item['description'],
    price:item['price'],
    islike:false,
    varients: (item['varients'] as List).map((i) => VarientModel.fromJson(i)).toList(),
    comments: (item['comments'] as List).map((i) => CommentModel.fromJson(i)).toList(),


  );
  listview.add(itemresult);
}else{
  final itemresult= ItemCatListModel(
    id: item['_id'],
    image: item['image'],
    itemid:item['itemid'],
    categoryname:item['categoryname'],
    description:item['description'],
    price:item['price'],
     islike:item['likes'][0]['islike'],
    varients: (item['varients'] as List).map((i) => VarientModel.fromJson(i)).toList(),
    comments: (item['comments'] as List).map((i) => CommentModel.fromJson(i)).toList(),


  );
  listview.add(itemresult);
}

     }

      return ApiResponse<List<ItemCatListModel>>(
          data:listview
      );


    }).catchError((e)=>
        ApiResponse<ItemCatListModel>(
            error: true,
            errormessage: e
        )
    );
  }



  //get item ctegory
  Future<ApiResponse<ItemCatListModel>> getUniqueItemCatrgory(String accesstoken,String menuitemid){
    var url=API + '/itemscategory/getuniqueitemcat/$menuitemid';
    print(url);
    return http.get(url,
      headers: {
      'Content-Type':'application/json',
        "Authorization": "bearer $accesstoken"
      },
    ).then((data){
      final jsonDate = json.decode(data.body);
          print(jsonDate['result']);
          final itemresult= ItemCatListModel(
            id: jsonDate['result'][0]['_id'],
            image: jsonDate['result'][0]['image'],
            itemid:jsonDate['result'][0]['itemid'],
            categoryname:jsonDate['result'][0]['categoryname'],
            description:jsonDate['result'][0]['description'],
            price:jsonDate['result'][0]['price'],
            islike:false,
            varients: (jsonDate['result'][0]['varients'] as List).map((i) => VarientModel.fromJson(i)).toList(),
            comments: (jsonDate['result'][0]['comments'] as List).map((i) => CommentModel.fromJson(i)).toList(),


          );
         // listview.add(itemresult);




      return ApiResponse<ItemCatListModel>(
          data:itemresult
      );




    }).catchError((e)=>
        ApiResponse<ItemCatListModel>(
            error: true,
            errormessage: e
        )
    );
  }




  //add comments
  Future<ApiResponse<AddcommentModel>> addCommentsservices(String accesstoken,String menuitemid,AddCommentbodyModel item){

     print(item.toJson());
     print(accesstoken);

    const headers={'Content-Type':'application/json'};
    var url=API + '/itemscategory/addcomment/$menuitemid';
     //var url = API + '/itemscategory/getalllikesitems/userid/$userid/search/$search';
    print(url);
    return http.post(url,
        headers: {

          "Authorization": "Bearer $accesstoken"
        },
        body:  item.toJson()).then((data){
         final jsonDate = json.decode(data.body);
         print(jsonDate);

      final signupresult = AddcommentModel(
        result: jsonDate['result'],


      );
      return ApiResponse<AddcommentModel>(
          data: signupresult
      );

    }).catchError((e)=>
        ApiResponse<AddcommentModel>(
            error: true,
            errormessage: e
        )
    );
  }




  //delete comment
  //add comments
  Future<ApiResponse<AddcommentModel>> deleteCommentsservices(String accesstoken,String menuitemid,String commentid){


    print(accesstoken);

    const headers={'Content-Type':'application/json'};
    var url=API + '/itemscategory/deletecomment/$menuitemid/commentid/$commentid';
    //var url = API + '/itemscategory/getalllikesitems/userid/$userid/search/$search';
    print(url);
    return http.get(url,
        headers: {

          "Authorization": "Bearer $accesstoken"
        },
       ).then((data){
      final jsonDate = json.decode(data.body);
      print(jsonDate);

      final signupresult = AddcommentModel(
        result: jsonDate['result'],


      );
      return ApiResponse<AddcommentModel>(
          data: signupresult
      );

    }).catchError((e)=>
        ApiResponse<AddcommentModel>(
            error: true,
            errormessage: e
        )
    );
  }



//add likes
  Future<ApiResponse<LikesModel>> addlikes(String accesstoken,LikesbodyModel item){
    // print(item.toJson());
    const headers={'Content-Type':'application/json'};
    return http.post(API + '/likes/addlikes',
        headers: {
          "Authorization": "bearer $accesstoken"
        },
        body: item.toJson()).then((data){
      final jsonDate = json.decode(data.body);
      print(jsonDate);

      final signupresult = LikesModel(
          result: jsonDate['result'],
          message: jsonDate['message'],

      );
      return ApiResponse<LikesModel>(
          data: signupresult
      );

    }).catchError((e)=>
        ApiResponse<LikesModel>(
            error: true,
            errormessage: e
        )
    );
  }





}