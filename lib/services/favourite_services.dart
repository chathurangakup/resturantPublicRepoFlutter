import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:resturantapp/models/api_responce.dart';
import 'package:resturantapp/models/homemodels/commentmodel.dart';
import 'package:resturantapp/models/homemodels/item_cat_list.dart';
import 'package:resturantapp/models/homemodels/vartentmodel.dart';

class FavouriteServeces {
  static const API = '';

//get item ctegory
  Future<ApiResponse<List<ItemCatListModel>>> getFavouriteItems(String search,
      String userid) {
    var url = API + '/itemscategory/getalllikesitems/userid/$userid/search/$search';
    print(url);
    return http.get(url,
      headers: {
        "Authorization": ""},
    ).then((data) {
      final jsonDate = json.decode(data.body);
      print("jsonDate");
      print(jsonDate);
      final listview = <ItemCatListModel>[];
      // list.map((i) => projectDetails.fromJson(i)).toList()
      for (var item in jsonDate['result']) {
        print(item['categoryname']);
        if (item['likes'].length == 0) {
          final itemresult = ItemCatListModel(
            id: item['_id'],
            image: item['image'],
            itemid: item['itemid'],
            categoryname: item['categoryname'],
            description: item['description'],
            price: item['price'],
            size: item['size'],
            review: item['review'],
            islike: false,
            varients: (item['varients'] as List).map((i) =>
                VarientModel.fromJson(i)).toList(),
            comments: (item['comments'] as List).map((i) =>
                CommentModel.fromJson(i)).toList(),


          );
          listview.add(itemresult);
        } else {
          final itemresult = ItemCatListModel(
            id: item['_id'],
            image: item['image'],
            itemid: item['itemid'],
            categoryname: item['categoryname'],
            description: item['description'],
            price: item['price'],
            size: item['size'],
            review: item['review'],
            islike: item['likes'][0]['islike'],
            varients: (item['varients'] as List).map((i) =>
                VarientModel.fromJson(i)).toList(),
            comments: (item['comments'] as List).map((i) =>
                CommentModel.fromJson(i)).toList(),
          );
          listview.add(itemresult);
        }
      }

      return ApiResponse<List<ItemCatListModel>>(
          data: listview
      );
    }).catchError((e) =>
        ApiResponse<ItemCatListModel>(
            error: true,
            errormessage: e
        )
    );
  }

}
