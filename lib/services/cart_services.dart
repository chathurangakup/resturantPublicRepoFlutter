
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:resturantapp/models/api_responce.dart';
import 'package:resturantapp/models/cartmodel/cartModel.dart';
import 'package:resturantapp/models/cartmodel/cartbodymodel.dart';
import 'package:resturantapp/models/cartmodel/getItemCategoryModel.dart';
import 'package:resturantapp/models/homemodels/vartentmodel.dart';
import 'package:resturantapp/models/profilemodels/profileUpdateBodyModel.dart';
import 'package:resturantapp/models/profilemodels/profileupdateModel.dart';

class CartServeces {
  static const API = '';



  //add likes
  Future<ApiResponse<CartModel>> addtocart(String accesstoken,CartbodyModel item){
     print(item.toJson());

    return http.post(API + '/cart/addtocart',
        headers: {
          "Content-Type":"application/json",
          "Authorization": "bearer $accesstoken"
        },
        body:json.encode(item.toJson()
         )

    ).then((data){


        final jsonDate = json.decode(data.body);
         print(jsonDate);
        final cartresult = CartModel(
            result: jsonDate['result'],
          );
        return ApiResponse<CartModel>(
            data: cartresult
        );

    }).catchError((e)=>
        ApiResponse<CartModel>(
            error: true,
            errormessage: e
        )
    );
  }



  //get cat items
  Future<ApiResponse<List<getItemCategory>>> gettracorders(String accesstoken,
      String userid,String type) {

    var url = API + '/cart/gettypes/$type/userid/$userid';
    return http.get(url,
      headers: {
        "Content-Type":"application/json",
        "Authorization":"bearer $accesstoken"
      },
    ).then((data) {
      final jsonDate = json.decode(data.body);
      print(jsonDate['types']);

      final listview = <getItemCategory>[];

      for (var item in jsonDate['types']) {
        final cartitemslistview = <CartItems>[];
        for (var itemc in item['type_result']['cartitems']) {

          final varientslistview = <Varients>[];
          for (var itemv in itemc['varients']) {
            final varintitems = Varients(
              id: itemv['id'],
              varid: itemv['varid'],
              catid: itemv['catid'],
              varientname: itemv['varientname'],
              price: itemv['price'],
            );
            varientslistview.add(varintitems);
          }//end varient obj

          final cartitems = CartItems(
            id: itemc['id'],
            catid: itemc['catid'],
            categoryname: itemc['categoryname'],
            price: itemc['price'],
            image: itemc['image'],
            totprice: itemc['totprice'],
            qty: itemc['qty'],
            varients: varientslistview
          );
          cartitemslistview.add(cartitems);

        }//end carditems

          final getItemCategoryResult = getItemCategory(
          id: item['type_result']['_id'],
          userid: item['type_result']['userid'],
          status: item['type_result']['status'],
          type: item['type_result']['type'],
          date:item['type_result']['date'],
          time: item['type_result']['time'],
          ordertime: item['type_result']['ordertime'],
          address: item['type_result']['address'],
          randomid: item['type_result']['randomid'],
           totalprice: item['type_result']['totalprice'],
          carttiems:  cartitemslistview
        );

        listview.add(getItemCategoryResult);
      }

      return ApiResponse<List<getItemCategory>>(
          data: listview
      );
    }).catchError((e) =>
        ApiResponse<getItemCategory>(
            error: true,
            errormessage: e
        )
    );
  }



}