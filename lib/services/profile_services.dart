import 'dart:convert';


import 'package:http/http.dart' as http;
import 'package:resturantapp/models/api_responce.dart';
import 'package:resturantapp/models/profilemodels/UserDetailsModel.dart';
import 'package:resturantapp/models/profilemodels/profileUpdateBodyModel.dart';
import 'package:resturantapp/models/profilemodels/profileupdateModel.dart';



class ProfileServeces {
  static const API = 'https://resturant123newapp.herokuapp.com';


  Future<ApiResponse<UderDetailsModel>> getUserDetails(String $accesstoken,String userid) {

    return http.get(API + '/users/usrdetails/$userid',
      headers: {
        "Authorization":"Bearer "+$accesstoken
      },
    ).then((data) {
      final jsonDate = json.decode(data.body);
      print(jsonDate['result'][0]);

      final userDetailsResult= UderDetailsModel(
            userid:jsonDate['result'][0]['_id'],
            firstname :jsonDate['result'][0]['firstName'],
            lastName:jsonDate['result'][0]['lastName'],
            phoneno :jsonDate['result'][0]['phoneno'],
            email:jsonDate['result'][0]['email'],
            addresses :jsonDate['result'][0]['addresses'][0],
      );

      return ApiResponse<UderDetailsModel>(
          data: userDetailsResult
      );
    }).catchError((e) =>
        ApiResponse<UderDetailsModel>(
            error: true,
            errormessage: e
        )
    );
  }




  //add likes
  Future<ApiResponse<ProfileUpdateModel>> updateProfile(String accesstoken,ProfileUpdatebodyModel item){
    // print(item.toJson());
    const headers={'Content-Type':'application/json'};
    return http.post(API + '/users/updateuserdetails',
        headers: {
          "Authorization": "bearer $accesstoken"
        },
        body: item.toJson()).then((data){
      final jsonDate = json.decode(data.body);
      print(jsonDate);

      final profileupdateresult = ProfileUpdateModel(
        result: jsonDate['result'],
        message: jsonDate['message'],

      );
      return ApiResponse<ProfileUpdateModel>(
          data: profileupdateresult
      );

    }).catchError((e)=>
        ApiResponse<ProfileUpdateModel>(
            error: true,
            errormessage: e
        )
    );
  }



}