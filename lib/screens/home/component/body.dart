import 'dart:developer';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:resturantapp/constants.dart';
import 'package:resturantapp/models/api_responce.dart';
import 'package:resturantapp/models/homemodels/item_cat_list.dart';
import 'package:resturantapp/models/homemodels/item_list.dart';
import 'package:resturantapp/models/homemodels/likesmodel/likesbodymodel.dart';
import 'package:resturantapp/models/sqlite/itemcategory.dart';
import 'package:resturantapp/models/sqlite/itemcatwithvarient.dart';
import 'package:resturantapp/models/sqlite/varientssql.dart';
import 'package:resturantapp/screens/details/details_screen.dart';
import 'package:resturantapp/screens/home/component/category_item.dart';
import 'package:resturantapp/screens/home/component/discount_card.dart';
import 'package:resturantapp/screens/home/component/item_card.dart';
import 'package:resturantapp/screens/home/component/item_card2.dart';
import 'package:resturantapp/services/item_services.dart';
import 'package:resturantapp/utils/database_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Body extends StatefulWidget{


  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return BodyState();
  }

}


class BodyState extends State<Body>{
  ItemServices get itemServices => GetIt.I<ItemServices>();
  ApiResponse<List<ItemList>> _apiResponce;
  ApiResponse<List<ItemCatListModel>> _apiResponceItemCat;
  String isActiverowdata;
  String useridstr='';
  String accesstokenstr='';
  double ratingsum=0;
  double rating=0;

  DatabaseHelper databaseHelper=DatabaseHelper();
  List<ItemCategory> itemcatList;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getData();
    _getresturantId() async{
      String userid=await returnUserId();
      String access_token=await returnAccesstoken();
      useridstr=userid;
      accesstokenstr=access_token;
    }
    _getresturantId();
  }

  Future<String> returnUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userid = prefs.getString('userid');
    print(userid);
    print("userid");
    return userid;
  }

  Future<String> returnAccesstoken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String access_token = prefs.getString('access_token');

    return access_token;
  }



  Future<ApiResponse<List<ItemList>>> getData() async {
//      ItemCategory itemCategory=ItemCategory("hh",'sds','dad',67,7);
      EasyLoading.show(status: 'loading...', maskType: EasyLoadingMaskType.black,);
    try{

//      databaseHelper.getLastItemCatData();
//       Future<int> itemcatList =  databaseHelper.insertItemCat(itemCategory);
//       itemcatList.then((itemList){
//         print(itemList);
//       });
//      // print(itemcatList);
//        print("itemcatList");
//      //

//       List<Varient> itemcatListData =await databaseHelper.getVarientList();
//      print("itemcatListData");
//       print(itemcatListData);
//
//         for(int i=0;i<itemcatListData.length;i++) {
//           print(itemcatListData[i].catid);
//           print(itemcatListData[i].varid);
//           print(itemcatListData[i].varientname);
//           print("malaa");
//         }


    List<ItemCategory> itemcat=await databaseHelper.getItemCatList();
    print("itemcat");
    print(itemcat);
             for(int i=0;i<itemcat.length;i++) {
             print(itemcat[i].img);

           print("malaa");
         }


       //  await databaseHelper.getWithItemcatVarientList();



      await itemServices.getItemList().then((response){
        setState(() {
          _apiResponce=response;
        });
        if(response==null){

        }else{
          print("_apiResponce.data[0].itemName ");
          print(_apiResponce.data[0].itemName);

          setState(() {
            isActiverowdata=_apiResponce.data[0].itemId;
          });

          getItemCatData(_apiResponce.data[0].itemId,useridstr);

          EasyLoading.dismiss();
        }


       // print(_apiResponce.data[0].itemName );

        return _apiResponce;
      });
    }on Exception  catch (_) {

    }
  }





  Future<ApiResponse<List<ItemCatListModel>>> getItemCatData(String itemid,String userid) async {
    EasyLoading.show(status: 'loading...', maskType: EasyLoadingMaskType.black,);
    try{
      await itemServices.getItemCatrgory(itemid, userid).then((response){

        if(response==null){
          EasyLoading.dismiss();
        }else {
          print("_apiResponce.data[0].itemName ");
          print("_apiResponceItemCat.data");
         // print( _apiResponceItemCat.data.toString());
          setState(() {
            _apiResponceItemCat=response;
          });
          EasyLoading.dismiss();
        }

        return _apiResponceItemCat;
      });
    }on Exception  catch (_) {

    }
  }

  double roundDouble(double value, int places){
    double mod = pow(10.0, places);
    return ((value * mod).round().toDouble() / mod);
  }


  void clickmenuCategory(id,itemid,image,categoryname,description,varients,comments,price) async{
        SharedPreferences prefs = await SharedPreferences.getInstance();

        print(varients);
//        prefs.setString('itemcatname', categoryname);
//        prefs.setString('itemid', itemid);
//        prefs.setString('description', description);
      //  prefs.setStringList('varients', varients);
//        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
//            DetailsScreen()), (Route<dynamic> route) => false);
//                Navigator.pushReplacement(
////                context,
////                // Create the SelectionScreen in the next step.
////                MaterialPageRoute(builder: (context) =>
////                    DetailsScreen(
////                      itemcatid: itemid,
////                      itemcatname: categoryname,
////                      price:price,
////                      image:image,
////                      description: description,
////                      rating: 4,
////                      varients:varients,
////                      screentype: 0,
////                )));

    ratingsum=0;
    rating=0;

    if(comments.length!=0){
      for(var i=0;i<comments.length;i++){
        print(comments[i].rating);
        ratingsum=double.parse(comments[i].rating)+ratingsum;
      }

      setState(() {
        rating=roundDouble(ratingsum/comments.length,1);
      });
      print(rating.toString()+"dhdshdh");
    }


                Navigator
                .push(
              context,
              new MaterialPageRoute(builder: (context) =>
        DetailsScreen(

                      itemcatid: id,
                      itemcatname: categoryname,
                      price:price,
                      image:image,
                      description: description,
                      rating:rating ,
                      reviewsize:comments.length,
                      varients:varients,
                      comments: comments,
                      screentype: 0,
                )
              ),
            );


  }



  void clickLikes(String itemcategoryid,String itemid) async{
    EasyLoading.show(status: 'loading...', maskType: EasyLoadingMaskType.black,);

    final loginbody = LikesbodyModel(
      userid: useridstr,
      itemcategoryid: itemcategoryid,

    );

    try{
      await itemServices.addlikes( accesstokenstr,loginbody).then((response){

        if(response.data.result=='Success'){
          getItemCatData(itemid,useridstr);
          EasyLoading.dismiss();
        }
        print(response.data);




      });
    }on Exception  catch (_) {

    }
  }



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SingleChildScrollView(
      child:Column(
        children: <Widget>[

          _apiResponce!=null?

          SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child:  Row(
                children: <Widget>[

                  for(var item in _apiResponce.data )
                    CategoryItem(
                        title: item.itemName,
                        isActive:item.itemId==isActiverowdata,
                        press:(){
                          setState(() {
                            isActiverowdata=item.itemId;
                          });

                          getItemCatData(item.itemId,useridstr);


                        }
                    ),




                ],
              )
          )

          :
        new Container(
          alignment: Alignment.center,
          child: Text('No item found'),
        ),


          _apiResponceItemCat!=null ?


          SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: <Widget>[

                  for(var item in _apiResponceItemCat.data )
//                          ItemCard(
//                          image: item.image,
//                          title:item.categoryname,
//                          desc:item.description,
//                          islike:item.islike,
//                          price: item.price,
//                          itemcatid:item.id,
//                          pressLikes:(){
//                            clickLikes(item.id,item.itemid);
//                          },
//                          press: (){
//                              clickmenuCategory(item.id,item.itemid,item.image,item.categoryname,item.description,item.varients,item.comments,item.price);
//                            },
//                          ),


                    ItemCard2(
                      image: item.image,
                      title:item.categoryname,
                      desc:item.description,
                      islike:item.islike,
                      price: item.price,
                      itemcatid:item.id,
                      pressLikes:(){
                        clickLikes(item.id,item.itemid);
                      },
                      press: (){
                        clickmenuCategory(item.id,item.itemid,item.image,item.categoryname,item.description,item.varients,item.comments,item.price);
                      },
                    ),


                ],
              )
          )

          :

          new Container(
            alignment: Alignment.center,
            child: Text('No item found'),
          ),


         // DiscountCard()
        ],

      ) ,
    );



  }





}











