import 'dart:convert';


import 'package:http/http.dart' as http;
import 'package:resturantapp/models/api_responce.dart';
import 'package:resturantapp/models/loginmodels/loginbodymodel.dart';
import 'package:resturantapp/models/loginmodels/loginmodel.dart';
import 'package:resturantapp/models/signupmodels/signupbody.dart';
import 'package:resturantapp/models/signupmodels/signupmodel.dart';


class StartupServeces{
  static const API = 'https://resturant123newapp.herokuapp.com';


  Future<ApiResponse<LoginModel>> userLogin(LoginbodyModel item){
   // print(item.toJson());
    return http.post(API + '/users/login',  body: item.toJson()).then((data){
        final jsonDate = json.decode(data.body);
        print(jsonDate);
        final loginresult= LoginModel(
            result:jsonDate['result'],
            token :jsonDate['token'],
            message :jsonDate['message'],
            userid :jsonDate['userId'],
//             email :jsonDate['email'],
//             image :jsonDate['image'],
//             usernamme: jsonDate['username']
        );
        return ApiResponse<LoginModel>(
            data:loginresult
        );

    }).catchError((e)=>
        ApiResponse<LoginModel>(
            error: true,
            errormessage: e
        )
    );
  }


  Future<ApiResponse<SignUpModel>> signupFromEmail(SignupbodyModel item){
    // print(item.toJson());
     const headers={'Content-Type':'application/json'};
     return http.post(API + '/users/signup',  body: item.toJson()).then((data){
      final jsonDate = json.decode(data.body);
      print(jsonDate);

        final signupresult = SignUpModel(
          result: jsonDate['result'],
          status: jsonDate['status'],
          message: jsonDate['message'],
            userid:jsonDate['createPro']['_id']
        );
        return ApiResponse<SignUpModel>(
            data: signupresult
        );

    }).catchError((e)=>
        ApiResponse<SignUpModel>(
            error: true,
            errormessage: e
        )
    );
  }



}