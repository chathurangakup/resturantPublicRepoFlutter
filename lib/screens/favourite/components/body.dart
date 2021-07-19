import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_it/get_it.dart';
import 'package:resturantapp/config/size_config.dart';
import 'package:resturantapp/models/api_responce.dart';
import 'package:resturantapp/models/homemodels/item_cat_list.dart';
import 'package:resturantapp/models/homemodels/likesmodel/likesbodymodel.dart';
import 'package:resturantapp/screens/details/details_screen.dart';
import 'package:resturantapp/screens/favourite/components/favouritetoppart.dart';
import 'package:resturantapp/services/favourite_services.dart';
import 'package:resturantapp/services/item_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'favourite_card.dart';

class Body extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return BodyState();
  }

}

class BodyState extends State<Body>{
  FavouriteServeces get favouriteServices => GetIt.I<FavouriteServeces>();
  ItemServices get itemServices => GetIt.I<ItemServices>();
  ApiResponse<List<ItemCatListModel>> _apiResponceItemCat=null;
  String useridstr='';
  String accesstokenstr='';
  String textstr='';
  double ratingsum=0;
  double rating=0;

  final _focusNode = FocusNode();


  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }




  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _focusNode.addListener(() {
      print("Has focus: ${_focusNode.hasFocus}");
      if(_focusNode.hasFocus==false){
        getFavItemCatData(textstr, useridstr);
      }

    });

    _getresturantId() async{
      String userid=await returnUserId();
      String access_token=await returnAccesstoken();
      useridstr=userid;
      accesstokenstr=access_token;
      getData();
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

  void getData() async {
    getFavItemCatData('',useridstr);
  }

  Future<ApiResponse<List<ItemCatListModel>>> getFavItemCatData(String search,String userid) async {
    EasyLoading.show(status: 'loading...', maskType: EasyLoadingMaskType.black,);
    try{
      await favouriteServices.getFavouriteItems(search, userid).then((response){
        setState(() {
          _apiResponceItemCat=response;
        });
        if(response==null){
          EasyLoading.dismiss();
        }else {
          print("_apiResponce.data[0].itemName ");
          print("_apiResponceItemCat.data");
          print(_apiResponceItemCat.data);
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



  void clickmenuCategory(id,itemid,image,categoryname,description,varients,comments,price,size,reviews) async{


    print(varients);



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
//        prefs.setString('itemcatname', categoryname);
//        prefs.setString('itemid', itemid);
//        prefs.setString('description', description);
    //  prefs.setStringList('varients', varients);
//        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
//            DetailsScreen()), (Route<dynamic> route) => false);
    Navigator.push(
        context,
        // Create the SelectionScreen in the next step.
        MaterialPageRoute(builder: (context) =>
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
              screentype: 2,


            )));
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
          getFavItemCatData('',useridstr);
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
    Size size=MediaQuery.of(context).size;
    String text='';



    return
      SingleChildScrollView(
        child:Column(
          children: <Widget>[
            SingleChildScrollView(
              physics: NeverScrollableScrollPhysics(),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: MediaQuery.of(context).size.width,
                  minHeight: MediaQuery.of(context).size.height/2,
                ),
                child: IntrinsicHeight(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Container(
                        // height:size.height,
                        //static non scrollable container
                        child: Column(
                          children: [
                            FavouriteTopPart(
                              text: textstr,
                              focusnode:_focusNode,
                              onChange: (val){
                                  textstr=val;
                                   print(val);
                              },
                              clickClose: (){
                                setState(() {
                                  textstr='';
                                });
                                getFavItemCatData('', useridstr);
                              },
                              clickSearch: (){
                                  getFavItemCatData(text, useridstr);
                              },
                            ),
                          ],
                        ),
                      ),


                      _apiResponceItemCat!=null ?


                      Container(
                        //Scrollable container
                        //Please adjust height and width yourself
                        //You can use media query parameters to make it respons

                        height:size.height-size.height/2.0,
                        child: SingleChildScrollView(
                          //You can also change the scroll direction
                          child: Column(
                            children: <Widget>[

                              for(var item in _apiResponceItemCat.data )
                                FavouriteCard(
                                  itemname: item.categoryname,
                                  desc: item.description,
                                  price: item.price,
                                  islike: item.islike,
                                  image: item.image,

                                  presssLikes:(){
                                     clickLikes(item.id,item.itemid);
                                  },
                                  press: (){
                                     clickmenuCategory(item.id,item.itemid,item.image,item.categoryname,item.description,item.varients,item.comments,item.price,item.size,item.review);
                                  },
                                ),


                            ],

                          ),
                        ),
                      )

                          :

                      new Container(
                        child: Text('No item found'),
                      ),





                    ],
                  ),
                ),
              ),
//            child: Column(
//              children: [
//
//
//              ],
//            ),
            )
          ],
        )
      );



  }

}
