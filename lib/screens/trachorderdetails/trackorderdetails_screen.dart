import 'package:flutter/material.dart';
import 'package:resturantapp/models/cartmodel/getItemCategoryModel.dart';
import 'package:resturantapp/screens/TabNavigatorScreen.dart';
import 'package:resturantapp/screens/trachorderdetails/components/trackorderCard.dart';
import 'package:resturantapp/screens/trachorderdetails/components/trackorderheader.dart';
import 'package:resturantapp/screens/trackorder/trackorderscreen.dart';
import 'dart:io' show Platform;

import '../../constants.dart';


class TrackOrderDetails extends StatelessWidget{
  final List<CartItems> carltlist;


  const TrackOrderDetails({
    Key key,
    this.carltlist,

  }):super(key:key);



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
          appBar: AppBar(
            backgroundColor: kPrimaryColor,
            title: Text('Order Details'),
            elevation: 0,
            centerTitle: true,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,

              ),
              onPressed: (){

               // Navigator.pop(context1);
              //  Navigator.of(context, rootNavigator: true).pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) { return TabNavigatorScreen(currenttabid: 1,);}));
//                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
//                    TabNavigatorScreen(currenttabid: 1,)), (Route<dynamic> route) => false);


              },
            ),
          ),
          body: Container(
            child: Column(
              children: <Widget>[
               // TrackorderHeader(),




                Expanded(
                  child:  Padding(
                    padding: const EdgeInsets.all(10),
                    child:GridView.builder(
                      itemCount: carltlist.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          mainAxisSpacing: 15,
                          childAspectRatio:Platform.isAndroid?  1.95:1.65
                      ),
                      itemBuilder: (context,index)=> TrackOrderCard(
                        name: carltlist[index].categoryname,
                         mainprice:carltlist[index].price,
                          image:carltlist[index].image,
                        varientname:  carltlist[index].varients.length==0? '': carltlist[index].varients[0].varientname,
                          varientprice: carltlist[index].varients.length==0? '': carltlist[index].varients[0].price,
                        qty: carltlist[index].qty,
                        subtotle: carltlist[index].totprice,

                      ),
                    ),
                  ),
                )




              ],
            ),
          ),
    );
  }

}