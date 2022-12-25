import 'dart:convert';


import 'package:http/http.dart' as http;
import 'package:resturantapp/models/api_responce.dart';
import 'package:resturantapp/models/datetimemodel/datetimemodel.dart';


class DateTimeServeces {
  static const API = '';



  Future<ApiResponse<List<DateTimeModel>>> getDateTime() {

    return http.get(API + '/datetime/alldatetime',
//      headers: {
//        "Authorization":"Bearer "+$accesstoken
//      },
    ).then((data) {
      final jsonDate = json.decode(data.body);
      final listview = <DateTimeModel>[];

      for (var item in jsonDate['users']) {

        print("item._id");
          print(item['_id']);
        final dateTimemodelResult= DateTimeModel(
          id:item['_id'],
          dayname :item['dayname'],
//          openhours:item['openhours'],
//          closehour :item['closehour'],
          status:item['status'],

        );
        listview.add(dateTimemodelResult);
      }



      return ApiResponse<List<DateTimeModel>>(
          data: listview
      );
    }).catchError((e) =>
        ApiResponse<DateTimeModel>(
            error: true,
            errormessage: e
        )
    );
  }



}