import 'dart:math';


import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:resturantapp/config/size_config.dart';
import 'package:resturantapp/models/api_responce.dart';
import 'package:resturantapp/models/commonmodels/addcommentboymodel.dart';
import 'package:resturantapp/models/homemodels/commentmodel.dart';
import 'package:resturantapp/models/homemodels/item_cat_list.dart';
import 'package:resturantapp/models/homemodels/vartentmodel.dart';
import 'package:resturantapp/models/profilemodels/UserDetailsModel.dart';
import 'package:resturantapp/screens/details/components/comment_layer.dart';
import 'package:resturantapp/screens/details/components/item_image.dart';
import 'package:resturantapp/screens/details/components/item_info.dart';
import 'package:resturantapp/screens/details/components/title_price_rating.dart';
import 'package:resturantapp/services/item_services.dart';
import 'package:resturantapp/services/profile_services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

import '../../../constants.dart';

class Body extends StatefulWidget{
  final String itemcatname;
  final String description;
  final String image;
  final double rating;
  final int reviewsize;
  final String price;
  final String itemcatid;
//  final Function clickorderbtn;
  final List<VarientModel> varints;
  final List<CommentModel> comments;
  const Body({
    Key key,
    this.itemcatname,
    this.description,
    this.varints,
    this.comments,
    this.rating,
    this.reviewsize,
    this.price,
    this.itemcatid,
    this.image
//    this.clickorderbtn
  }):super(key:key);


  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return BodyState();
  }
}



class BodyState extends State<Body>{
  ItemServices get itemServices => GetIt.I<ItemServices>();
  ProfileServeces get prodileServices => GetIt.I<ProfileServeces>();
  ApiResponse<UderDetailsModel> _apiResponce;
  ApiResponse<ItemCatListModel> _apiResponceItemCat;
  String itemname,description,price,image,itemcatid;
  String commentstate='';
  String username;
  double rating=0;
  double ratingsum=0;
  int reviewsize=0;
  double changedrating=0.0;
  List<VarientModel> varints;
  List<CommentModel> comments;





  @override
  void initState() {
    // TODO: implement initState
//    getData();

    getInitData();
  }


  getInitData(){

    print(widget.comments.length.toString()+'klkl');
      itemname=widget.itemcatname;
      description=widget.description;
      price=widget.price;
      rating=widget.rating;
      image=widget.image;
      itemcatid=widget.itemcatid;
      varints=widget.varints;
      comments=widget.comments;

      reviewsize=widget.comments.length;
  }


  clickAddComment() async{
    Navigator.pop(context);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userid = prefs.getString('userid');
    String access_token = prefs.getString('access_token');

    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd').format(now);
    EasyLoading.show(status: 'loading...', maskType: EasyLoadingMaskType.black,);

    if(changedrating==0){

    }else if(commentstate==''){

    }else{

      EasyLoading.show(status: 'loading...', maskType: EasyLoadingMaskType.black,);
      try{

        SharedPreferences prefs = await SharedPreferences.getInstance();
        String token = prefs.getString('access_token');
        String userid = prefs.getString('userid');

        await prodileServices.getUserDetails(token, userid).then((response){

          print(response);
          if(response==null){
             EasyLoading.dismiss();
          }else{
            print("_apiResponce.data[0].itemName ");
            setState(() {
              _apiResponce=response;
              username=response.data.firstname+' '+response.data.lastName;
              _storeAccess() async{
                final addcomment = AddCommentbodyModel(
                  userid: userid,
                  username: username,
                  date: formattedDate,
                  comment: commentstate,
                  rating: changedrating.toString(),
                );

                try {
                  await itemServices.addCommentsservices(access_token,itemcatid,addcomment).then((response) {
                                      print(response.data.result);
                          if(response.data.result=="success"){

                            getData();
                            EasyLoading.dismiss();
                          }


                  });

                }on Exception catch (_) {
                   EasyLoading.dismiss();
                  print(_);
                }

              }
              _storeAccess();


            });
            EasyLoading.dismiss();
          }

          return _apiResponce;
        });
      }on Exception  catch (_) {

      }
    }
  }



  _showMaterialDialog() async{
    showDialog(
        context: context,
        builder: (_) => new AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius:
              BorderRadius.all(
                  Radius.circular(10.0))),
          content: Builder(
            builder: (context) {
              // Get available height and width of the build area of this widget. Make a choice depending on the size.
              var height = MediaQuery.of(context).size.height;
              var width = MediaQuery.of(context).size.width;


              return SingleChildScrollView(
//                  width: width,
//                  height: height-width/2,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding:EdgeInsets.only(bottom: 40),
                        child: Text("Add new Comment"),
                      ),
                      SmoothStarRating(
                        borderColor: kPrimaryColor,
                        color:kPrimaryColor ,
                        rating: changedrating,
                        onRated: (value) {
                          setState(() {
                            changedrating=value;
                          });
                          print("rating value -> $value");
                          // print("rating value dd -> ${value.truncate()}");
                        },
                      ),

                      Card(
                          color: Colors.white70,
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: TextField(
                              onChanged: (text) {
                                setState(() {
                                  commentstate=text;
                                });
                              },
                              maxLines: 8,
                              decoration: InputDecoration.collapsed(hintText: "Enter your text here"),
                            ),
                          )
                      ),

                      SizedBox(height: 30),
                      FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.red)),
                        color: Colors.white,
                        textColor: Colors.red,
                        padding: EdgeInsets.all(8.0),
                        onPressed: () {
                          this.clickAddComment();
                        },
                        child: Text(
                          "Add New Comment".toUpperCase(),
                          style: TextStyle(
                            fontSize: 14.0,
                          ),
                        ),
                      ),


                      SizedBox(height: 10),
                      FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.white)),
                        color: Colors.white,
                        textColor: Colors.black,
                        padding: EdgeInsets.all(8.0),
                        onPressed: () {Navigator.pop(context);},
                        child: Text(
                          "Cancel".toUpperCase(),
                          style: TextStyle(
                            fontSize: 14.0,
                          ),
                        ),
                      )
                    ],
                  )

              );
            },
          ),
        )
    );
  }

void clickDelete(id) async{
  Navigator.pop(context);
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String token = prefs.getString('access_token');
  String userid = prefs.getString('userid');
  EasyLoading.show(status: 'loading...', maskType: EasyLoadingMaskType.black,);
  try{
    await itemServices.deleteCommentsservices(token,itemcatid,id).then((response){

      if(response==null){
        EasyLoading.dismiss();
      }else{
        print(response);
         getData();
         EasyLoading.dismiss();


      }


      // print(_apiResponce.data[0].itemName );

      return _apiResponceItemCat;
    });
  }on Exception  catch (_) {

  }

}

  _showMaterialDialogList() async{
    Size size=MediaQuery.of(context).size;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('access_token');
    String userid = prefs.getString('userid');
    showDialog(
        context: context,
        builder: (_) => new AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius:
              BorderRadius.all(
                  Radius.circular(10.0))),
          content: Builder(
            builder: (context) {
              // Get available height and width of the build area of this widget. Make a choice depending on the size.
              var height = MediaQuery.of(context).size.height;
              var width = MediaQuery.of(context).size.width;


              return SingleChildScrollView(
//                  width: width,
//                  height: height-width/2,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding:EdgeInsets.only(bottom: 40),
                        child: Text("Comments"),
                      ),

                      Container(
                        //Scrollable container
                        //Please adjust height and width yourself
                        //You can use media query parameters to make it respons

                        height:size.height-size.height/2.0,
                        child: SingleChildScrollView(
                          //You can also change the scroll direction
                          child: Column(
                            children: <Widget>[



                              for(var item in comments )
                            item.userid==userid?
                              CommentLayer(
                                isdelete:true,
                                commentid: item.commentid,
                                name:item.username,
                                date:item.date,
                                comment: item.comment,
                                rating: double.parse(item.rating),
                                custonFunction: clickDelete,
                              )
                                :
                              CommentLayer(
                                isdelete:false,
                              commentid: item.commentid,
                              name:item.username,
                              date:item.date,
                              comment: item.comment,
                              rating: double.parse(item.rating),
                              custonFunction: clickDelete,
                              ),






                            ],

                          ),
                        ),
                      ),




                      SizedBox(height: 10),
                      FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.white)),
                        color: Colors.white,
                        textColor: Colors.black,
                        padding: EdgeInsets.all(8.0),
                        onPressed: () {Navigator.pop(context);},
                        child: Text(
                          "Cancel".toUpperCase(),
                          style: TextStyle(
                            fontSize: 14.0,
                          ),
                        ),
                      )
                    ],
                  )

              );
            },
          ),
        )
    );
  }


  double roundDouble(double value, int places){
    double mod = pow(10.0, places);
    return ((value * mod).round().toDouble() / mod);
  }

  void getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('access_token');
    String userid = prefs.getString('userid');
//    var itemcatname = prefs.getString('itemcatname');


    try{
    await itemServices.getUniqueItemCatrgory(token,itemcatid).then((response){
      print(response.data.comments);
      if(response==null){

      }else{
        print(response);
        ratingsum=0;
        if(response.data.comments.length!=0){
          for(var i=0;i<response.data.comments.length;i++){
            print(response.data.comments[i].rating);
            ratingsum=double.parse(response.data.comments[i].rating)+ratingsum;
          }



          setState(() {
            rating=roundDouble(ratingsum/response.data.comments.length,1);
          });
          print(rating.toString()+"dhdshdh");
        }



        setState(() {
          _apiResponceItemCat=response;
          itemname=response.data.categoryname;
          description=response.data.description;
          price=response.data.price;
          reviewsize=response.data.comments.length!=0 ?response.data.comments.length:0;
          image=response.data.image;
          itemcatid=response.data.id;
          rating=roundDouble(ratingsum/response.data.comments.length,1);
          varints=response.data.varients;
          comments=response.data.comments;
        });

       // EasyLoading.dismiss();
      }


      // print(_apiResponce.data[0].itemName );

      return _apiResponceItemCat;
    });
  }on Exception  catch (_) {

  }



  }



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Size size=MediaQuery.of(context).size;
    return  SingleChildScrollView(
        child:  Column(
          children: <Widget>[
            Image.network(widget.image,
              width: SizeConfig.imageSizemultiplier*45.18,
              height:SizeConfig.heightMultiplier*30.18 ,



            ),

            Container(
              child: ItemInfo(
                itemcatid:itemcatid,
                itemcatname:itemname,
                description:description,
                rating:rating,
                price: price,
                varints: varints,
                reviews: reviewsize.toString() +' reviews',
                clickAddReview:(){_showMaterialDialog();},
                clickReview:(){_showMaterialDialogList();},


              ),
            )
          ],
        )
    );

  }

}