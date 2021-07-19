import 'package:flutter/material.dart';
import 'package:resturantapp/config/size_config.dart';
import 'package:resturantapp/constants.dart';



class TrackOrderCard extends StatelessWidget{
  final String name;
  final String mainprice;
  final String image;
  final String varientname;
  final String varientprice;
  final int qty;
  final int subtotle;

  const TrackOrderCard({
    Key key,
    this.name,
    this.mainprice,
    this.image, this.varientname, this.varientprice, this.qty, this.subtotle,

  }):super(key:key);


  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return AspectRatio(
      aspectRatio: 0.95,
      child: Container(
        decoration: BoxDecoration(
            color: kPrimaryColor.withOpacity(0.7),
            borderRadius: BorderRadius.circular(10)
        ),
        child: Row(

          children: <Widget>[
            Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.all(SizeConfig.heightMultiplier*3),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Expanded(
                            flex: 2,
                            child:   Text(name,
                              style: TextStyle(fontWeight: FontWeight.w700,
                                fontSize: SizeConfig.textMultiplier*2.5,
                                color: Colors.white,

                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child:   Text(mainprice,
                              style: TextStyle(
                                fontSize: SizeConfig.textMultiplier*2.5,
                                color: Colors.white,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          )


                        ],
                      ),


                      Row(
                        children: <Widget>[
                          Expanded(
                            flex: 2,
                            child:   Text(varientname,
                              style: TextStyle(
                                fontSize: SizeConfig.textMultiplier*2,
                                color: Colors.white,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child:   Text(varientprice,
                              style: TextStyle(
                                fontSize: SizeConfig.textMultiplier*2.5,
                                color: Colors.white,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          )
                        ],
                      ),
                      Divider(
                          color: Colors.white
                      ),


                      Row(
                        children: <Widget>[
                          Expanded(
                            flex: 2,
                            child:   Text('Qty',
                              style: TextStyle(
                                fontSize: SizeConfig.textMultiplier*2.5,
                                color: Colors.white,
                              ),

                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child:   Text(qty.toString(),textAlign: TextAlign.right,
                              style: TextStyle(
                                fontSize: SizeConfig.textMultiplier*2.5,
                                color: Colors.white,
                              ),

                            ),
                          )
                        ],
                      ),

                      Row(
                        children: <Widget>[
                          Expanded(
                            flex: 2,
                            child:   Text('Sub Totle',
                              style: TextStyle(
                                fontSize: SizeConfig.textMultiplier*2.5,
                                color: Colors.white,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child:   Text(subtotle.toString(),
                              style: TextStyle(
                                  fontSize: SizeConfig.textMultiplier*2,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          )
                        ],
                      ),






                    ],
                  ),
                )



            ),



            AspectRatio(
              aspectRatio:0.70 ,
              //   child: Container(
//                margin: EdgeInsets.only(bottom: 15),
//                padding: EdgeInsets.all(25),
//                decoration: BoxDecoration(
//                  color: kPrimaryColor.withOpacity(0.15),
//                  shape: BoxShape.circle,
//                ),
              child:
              Image.network(image,
                width: SizeConfig.imageSizemultiplier*15.18,
                height:SizeConfig.heightMultiplier*10.18 ,
              )
//              Image(
//
//                fit:BoxFit.contain,
//                alignment: Alignment.centerLeft,
//
//              ),

            )



          ],
        ),
      ),
    );
  }

}