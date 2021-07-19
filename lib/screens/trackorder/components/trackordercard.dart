import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:resturantapp/config/size_config.dart';
import 'dart:io' show Platform;

import '../../../constants.dart';
import 'dart:io' show Platform;

class TrackOrderDeliveryMainCard extends StatelessWidget{
  final String itemname;
  final String address;
  final String price;
  final String status;
  final String date;
  final String ordertime;

//  final Function presssLikes;
  final Function press;
  TrackOrderDeliveryMainCard({
    Key key,
    this.itemname,
    this.address,
    this.price,
    this.status,
    this.date,
    this.ordertime,

//    this.presssLikes,
    this.press
  }):super(key:key);



  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;



    // TODO: implement build
    return Material(
        color: Colors.transparent,
        child: InkWell(
            onTap: press,

            child:Padding(
              padding: EdgeInsets.all(5),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: <Widget>[
                  Container(
                    height:Platform.isAndroid ? SizeConfig.heightMultiplier*22.4:SizeConfig.heightMultiplier*16   ,
                    // color: Colors.pink,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10),
                      ),
                      border: Border.all(color: Colors.white),
                      color:kPrimaryColor.withOpacity(.1),
                      
                    ),
                    child: Column(

                      children: <Widget>[
                        Row(

                          children: <Widget>[
//                            new Expanded (
//                              flex:1,
//                              child :  Container(
//                                margin: EdgeInsets.all(2),
//                                padding: EdgeInsets.all(15),
//                                decoration: BoxDecoration(
//                                  color: kPrimaryColor.withOpacity(0.15),
//                                  shape: BoxShape.circle,
//                                ),
//                                child: SvgPicture.asset("assets/icons/fast-food.svg",
//                                  width: size.width* 0.20,
//                                ),
//                              ),
//                            ),

                            new Expanded (
                              flex:2,
                              child: Container(
                                  padding: EdgeInsets.all(SizeConfig.imageSizemultiplier*4),
                                  child:Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Text(
                                           date,
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.black

                                            ),
                                          ),
                                          SizedBox(width: 10,),
                                          Text(
                                            ordertime,
                                            textAlign: TextAlign.right,
                                            style: TextStyle(
                                                fontSize:12,
                                                color: Colors.black,
                                              fontWeight: FontWeight.bold
                                            ),
                                          ),

                                        ],
                                      ),


                                      Row(
                                        children: <Widget>[
                                          Text(
                                            "OrderId: ",
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.black

                                            ),
                                          ),
                                          Text(
                                            itemname,
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              fontSize: Platform.isAndroid ?SizeConfig.textMultiplier*2.5: SizeConfig.textMultiplier*2,
                                                color: Colors.black
                                            ),
                                          ),

                                        ],
                                      ),

                                      SizedBox(height: 5,),

                                      Row(
                                        children: <Widget>[
                                          Text(
                                            "Address: ",
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              fontSize: 14,
                                                color: Colors.black
                                            ),
                                          ),
                                          Container(
                                            width: SizeConfig.imageSizemultiplier*35,
                                            child:  new Text(
                                                address,
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 2,
                                                style: new TextStyle(
                                                  fontSize: Platform.isAndroid ?SizeConfig.textMultiplier*2.5: SizeConfig.textMultiplier*2,
                                                    color: Colors.black
                                                )
                                            ),
                                          )


                                        ],
                                      ),


                                      SizedBox(height: 5,),

                                      Row(
                                        children: <Widget>[
                                          Text(
                                            'Totle Price: ',
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              fontSize: 14,
                                                color: Colors.black
                                            ),
                                          ),
                                          Text(
                                           'Rs: ' +price,
                                            style: TextStyle(
                                                fontSize: Platform.isAndroid ?SizeConfig.textMultiplier*2.5: SizeConfig.textMultiplier*2,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black
                                            ),
                                          ),

                                        ],
                                      ),



                                    ],
                                  )
                              ),
                            ),

                            new Expanded (
                                flex:1,
                                child :  InkWell(
                                  onTap:(){},
                                  child:
                                  Container(

                                      child:
                                      status=='Pending'?
                                           Text(status,
                                             style: TextStyle(
                                                 fontSize: SizeConfig.textMultiplier*2.5,
                                                 color: Colors.amber
                                             ),

                                           )
                                          :
                                      status=='Delivered'?
                                      Text(status,
                                        style: TextStyle(
                                            fontSize: SizeConfig.textMultiplier*2.5,
                                            color: Colors.green
                                        ),

                                      )
                                          :
                                      Text(status,
                                        style: TextStyle(
                                            fontSize: SizeConfig.textMultiplier*2.5,
                                            color: Colors.red
                                        ),

                                      )

                                  ),
                                )

                            ),

                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            )



        )
    );



  }

}

