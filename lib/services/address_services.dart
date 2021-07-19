import 'dart:convert';


import 'package:http/http.dart' as http;
import 'package:resturantapp/models/addressmodels/addressUpdateModel.dart';
import 'package:resturantapp/models/addressmodels/addressmodels.dart';
import 'package:resturantapp/models/api_responce.dart';
import 'package:resturantapp/models/commonmodels/addressbodymodel.dart';
import 'package:resturantapp/models/commonmodels/addressmodel.dart';

class AddressServeces{
  static const API = 'https://resturant123newapp.herokuapp.com';


  Future<ApiResponse<AddressModel>> addAddress(AddressbodyModel item){
    // print(item.toJson());
    const headers={'Content-Type':'application/json'};
    return http.post(API + '/address/addAddress',  body: item.toJson()).then((data){
      final jsonDate = json.decode(data.body);
      print(jsonDate);

      final signupresult = AddressModel(
          result: jsonDate['result'],

      );
      return ApiResponse<AddressModel>(
          data: signupresult
      );

    }).catchError((e)=>
        ApiResponse<AddressModel>(
            error: true,
            errormessage: e
        )
    );
  }




  Future<ApiResponse<List<GetAllAddressModel>>> getAllAddress(String $accesstoken,String userid) {

    return http.get(API + '/address/getAllAddress/$userid',
      headers: {
        "Authorization":"Bearer "+$accesstoken
      },
    ).then((data) {
      final jsonDate = json.decode(data.body);
      print(jsonDate);
      final listview = <GetAllAddressModel>[];
      for (var item in jsonDate['result']) {
        print(item['_id']);
        print(item['address']);
        print(item['isdefault']);
        final userDetailsResult= GetAllAddressModel(
            addressid:item['_id'],
            userid:item['userid'],
            address:item['address'],
            isdefault:item['isdefault'],

      );
        listview.add(userDetailsResult);
      }



      return ApiResponse<List<GetAllAddressModel>>(
          data: listview
      );
    }).catchError((e) =>
        ApiResponse<GetAllAddressModel>(
            error: true,
            errormessage: e
        )
    );
  }



  Future<ApiResponse<AddressUpdateModel>> updateDefault(String $accesstoken,String $userid,String $addressid) {

    return http.get(API + '/address/updateDefault/userid/'+$userid+'/addressid/'+$addressid,
      headers: {
        "Authorization":"Bearer "+$accesstoken
      },
    ).then((data) {
      final jsonDate = json.decode(data.body);
      print(jsonDate);

      final userDetaddressUpdateResult= AddressUpdateModel(
          result:jsonDate['result'],
          message:jsonDate['message'],


        );

      return ApiResponse<AddressUpdateModel>(
          data: userDetaddressUpdateResult
      );
    }).catchError((e) =>
        ApiResponse<AddressUpdateModel>(
            error: true,
            errormessage: e
        )
    );
  }



  Future<ApiResponse<AddressUpdateModel>> deleteAddress(String $accesstoken,String $addressid) {

    return http.get(API + '/address/deleteAddress/'+$addressid,
      headers: {
        "Authorization":"Bearer "+$accesstoken
      },
    ).then((data) {
      final jsonDate = json.decode(data.body);
      print(jsonDate);

      final deleteaddressUpdateResult= AddressUpdateModel(
        result:jsonDate['result'],
        message:jsonDate['message'],


      );

      return ApiResponse<AddressUpdateModel>(
          data: deleteaddressUpdateResult
      );
    }).catchError((e) =>
        ApiResponse<AddressUpdateModel>(
            error: true,
            errormessage: e
        )
    );
  }







}