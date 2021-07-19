
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:resturantapp/constants.dart';
import 'package:resturantapp/models/homemodels/commentmodel.dart';
import 'package:resturantapp/models/homemodels/item_cat_list.dart';
import 'package:resturantapp/models/homemodels/vartentmodel.dart';
import 'package:resturantapp/models/sqlite/itemcategory.dart';
import 'package:resturantapp/screens/TabNavigatorScreen.dart';
import 'package:resturantapp/screens/details/components/body.dart';
import 'package:resturantapp/screens/details/components/item_info.dart';
import 'package:resturantapp/screens/home/homescreen.dart';
import 'package:resturantapp/utils/database_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

import 'components/app_bar.dart';
import 'components/item_image.dart';
import 'components/order_button.dart';
import 'components/title_price_rating.dart';

class DetailsScreen extends StatefulWidget{
  final List<VarientModel> varients;
  final List<CommentModel> comments;
//  final Function launchFunction;
  final String itemcatid;
  final String image;
  final String itemcatname;
  final String description;
  final double rating;
  final String price;
  final int screentype;
  final int reviewsize;


  DetailsScreen({
    this.itemcatid,
    this.image,
    this.itemcatname,
    this.description,
    this.varients,
    this.rating,
    this.reviewsize,
    this.price,
    this.screentype,
    this.comments,


    Key key
  }): super(key: key);//add also..example this.abc,this...
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return DetailsScreenState();
  }
}


class DetailsScreenState extends State<DetailsScreen>{
  DatabaseHelper databaseHelper=DatabaseHelper();

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDate();
  }

void getDate(){
  print(widget.varients);
}

//  void insertTableItem(catid,catname,price,qty){
//      ItemCategory itemCategory=ItemCategory(catid,catname,price,qty);
//       Future<int> itemcatList =  databaseHelper.insertItemCat(itemCategory);
//       itemcatList.then((itemList){
//         print(itemList);
//       });
//      // print(itemcatList);
//        print("itemcatList");
//  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Size size=MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: kPrimaryColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: kPrimaryColor,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,

            ),
            onPressed: (){



            Navigator.push(
                context,
               // Navigator.pop(context, 'Yep!');
                // Create the SelectionScreen in the next step.
                MaterialPageRoute(builder: (context) => TabNavigatorScreen(currenttabid:widget.screentype)));


            },
          ),
          actions: <Widget>[

          ],
        ),
        body:

        Body(
          itemcatid:widget.itemcatid,
          itemcatname:widget.itemcatname,
          description: widget.description,
          rating: widget.rating,
          price: widget.price,
          varints: widget.varients,
          comments: widget.comments,
          reviewsize:widget.reviewsize,
          image:widget.image
        ),

        bottomNavigationBar:
        Container(
          color: Colors.white,
          child:  Padding(

            padding: EdgeInsets.all(10.0),
            child:
            OrderButton(
                size:size,
                press:(){
                    ItemInfoState.foo(widget.itemcatid,widget.itemcatname,widget.price,widget.image,widget.screentype,context);

                }
            ),

          ),
        )


    );;
  }



}


//class test {
//  static void foo() {
//    print("1234");
//  }
//}










