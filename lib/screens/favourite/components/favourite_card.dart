import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants.dart';

class FavouriteCard extends StatelessWidget{
  final String itemname;
  final String desc;
  final String price;
  final String image;
  final bool islike;
  final Function presssLikes;
  final Function press;
  FavouriteCard({
    Key key,
    this.itemname,
    this.desc,
    this.price,
    this.image,
    this.islike,
    this.presssLikes,
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
              padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 10),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: <Widget>[
                  Container(
                    height: 130.0,
                   // color: Colors.pink,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10),

                        ),
                        border: Border.all(color: Colors.white),
                        color: kPrimaryColor.withOpacity(0.1),
                    ),
                    child: Column(

                      children: <Widget>[
                        Row(

                          children: <Widget>[
                            new Expanded (
                              flex:1,
                              child :  Container(
                                margin: EdgeInsets.all(2),
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: kPrimaryColor.withOpacity(0.15),
                                  shape: BoxShape.circle,
                                ),
                                child:  Image.network(image,

                                )
                              ),
                            ),

                            new Expanded (
                              flex:2,
                              child: Container(
                                  padding: EdgeInsets.all(5),
                                  child:Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[

                                      Text(
                                        itemname,
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold
                                        ),
                                      ),
                                      SizedBox(height: 5,),
                                      new Text(
                                        desc.length > 60 ? '${desc.substring(0, 60)}...' : desc,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 5,
                                        style: new TextStyle(
                                          fontSize: 12.0,

                                        ),
                                      ),
                                      SizedBox(height: 5,),
                                      Text(
                                        'Rs'+price,
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold
                                        ),
                                      ),
                                    ],
                                  )
                              ),
                            ),

                            new Expanded (
                                flex:1,
                                child :  InkWell(
                                  onTap:presssLikes,
                                  child:
                                  Container(

                                      child:
                                      new  SvgPicture.asset("assets/icons/heart.svg",
                                        width: size.width* 0.07,
                                        color: Colors.red,
                                      )
//                                  :
//                              new  SvgPicture.asset("assets/icons/heart.svg",
//                                width: size.width* 0.07,
//                                color: Colors.red,
//                              )

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

