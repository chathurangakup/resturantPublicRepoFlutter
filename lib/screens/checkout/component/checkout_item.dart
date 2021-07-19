import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:resturantapp/config/size_config.dart';
import 'package:resturantapp/constants.dart';
import 'package:resturantapp/models/sqlite/varientssql.dart';
import 'package:resturantapp/screens/checkout/component/varientalert.dart';
import 'package:resturantapp/screens/components/qty_add_reduce.dart';

class CheckoutItem extends StatelessWidget{

  final String itemname;
  final String price;
  final String image;
  final double totprice;
  final int qty;
  final Function pressplus;
  final Function pressminus;
  final Function pressdelete;
  final List<Varient> varient;
  const CheckoutItem({
    Key key,
    this.price,
    this.image,
    this.itemname,
    this.qty,
    this.pressplus,
    this.pressminus,
    this.pressdelete,
    this.totprice,
    this.varient
  }):super(key:key);







  @override
  Widget build(BuildContext context) {


//    _showMaterialDialog(List<Varient> varient) {
//      showDialog(
//          context: context,
//          builder: (_) => new AlertDialog(
//        shape: RoundedRectangleBorder(
//            borderRadius:
//            BorderRadius.all(
//                Radius.circular(10.0))),
//        content: Builder(
//          builder: (context) {
//            // Get available height and width of the build area of this widget. Make a choice depending on the size.
//            var height = MediaQuery.of(context).size.height;
//            var width = MediaQuery.of(context).size.width;
//
//
//            return Container(
//              width: width,
//              height: height-width/2,
//              child: Column(
//                children: <Widget>[
//                  for(var i=0;i<varient.length;i++)
//                    VarientAlert(
//                      varientname: varient[i].varientname,
//                      varientprice: varient[i].price,
//                    )
//
//                ],
//              )
//
//
//
//
//            );
//          },
//        ),
//      )
//      );
//    }





  return   Container(

      child: Stack(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
              Padding(
      padding: new EdgeInsets.all(SizeConfig.imageSizemultiplier*2.8),
      child:
      AspectRatio(
        aspectRatio: 1.82,
        child: Container(
          padding: EdgeInsets.only(top: SizeConfig.imageSizemultiplier*0.0),
          decoration: BoxDecoration(
              color: kPrimaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10)
          ),
          child: Row(
            children: <Widget>[

              Expanded(
                flex: 1,
                child:Column(
                  children: <Widget>[
                    AspectRatio(
                      aspectRatio:0.71 ,
                      //   child: Container(
//                margin: EdgeInsets.only(bottom: 15),
//                padding: EdgeInsets.all(25),
//                decoration: BoxDecoration(
//                  color: kPrimaryColor.withOpacity(0.15),
//                  shape: BoxShape.circle,
//                ),
                      child:
//                      Image.asset(
//                        "assets/images/burger.png",
//                        fit:BoxFit.contain,
//                        alignment: Alignment.centerRight,
//
//                      ),

                      Image.network(image,
                        width: SizeConfig.imageSizemultiplier*11.18,
                        height:SizeConfig.heightMultiplier*15.18 ,

                      ),

                    ),



                  ],
                )





              ),



              Expanded(
                  flex: 2,
                  child: Padding(
                    padding: EdgeInsets.all(SizeConfig.heightMultiplier*2.5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Expanded(
                              flex: 2,
                              child:   Text(itemname,
                                style: TextStyle(fontWeight: FontWeight.w700,
                                  fontSize: SizeConfig.textMultiplier*2.3,
                                  color: Colors.black,

                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child:   Text( 'Rs: '+price,
                                style: TextStyle(
                                  fontSize: SizeConfig.textMultiplier*2.2,
                                  color: Colors.black,
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
                              child: varient.length!=0?
                              Text(varient[0].varientname,
                                style: TextStyle(
                                  fontSize: SizeConfig.textMultiplier*2.5,
                                  color: Colors.black,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ):
                             Text('')
                            ),
                            Expanded(
                              flex: 1,
                              child: varient.length!=0? Text('Rs: '+varient[0].price,
                                style: TextStyle(
                                  fontSize: SizeConfig.textMultiplier*2,
                                  color: Colors.black,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ):
                              Text('')
                            )
                          ],
                        ),
                        Divider(
                            color: Colors.white
                        ),


                        Row(
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child:
                              Text('Qty',
                                style: TextStyle(
                                  fontSize: SizeConfig.textMultiplier*2.5,
                                  color: Colors.black,
                                ),


                              ),
                            ),



                            QtyObj(
                              pressplus: pressplus,
                              pressminus: pressminus,
                              qty: qty,

                            ),

                          ],
                        ),

                        Row(
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child:   Text('Sub Totle',
                                style: TextStyle(
                                  fontSize: SizeConfig.textMultiplier*2.5,
                                  color: Colors.black,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child:   Text('Rs:'+totprice.toString(),
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            )
                          ],
                        ),


//                        Row(
//                          children: <Widget>[
//                            new Expanded (
//                              flex:1,
//                              child : Column(
//                                children: <Widget>[
//                                 Text('')
//                                ],
//                              ),),
//
//                            new Expanded (
//                              flex:1,
//                              child : Column(
//                                children: <Widget>[
//                                  IconButton(
//                                  icon: Icon(Icons.delete,size: 30,),
//                                  tooltip: 'Increase volume by 10',
//                                  onPressed:pressdelete
//                                ),
//                                ],
//                              ),),
//
//                          ],
//                        )




                      ],
                    ),
                  )



              ),


            ],
          ),
        ),
      ),
    ),





//      Container(
//
//      child:  Row(
//        children: <Widget>[
//          new
//          Expanded (
//            flex:2,
//            child : Column(
//              children: <Widget>[new    Text(itemname,style: TextStyle(fontSize: 15.0), ),],
//            ),),
//
//          Expanded (
//            flex:1,
//            child : Column(
//              children: <Widget>[new  Text(price.toString(),style: TextStyle(fontSize: 15.0), ),],
//            ),),
//
//
//
//          Expanded (
//            flex:1,
//            child : Column(
//              children: <Widget>[new  Text(totprice.toString(),style: TextStyle(fontSize: 15.0), ),],
//            ),),
//
//          Container(
//            child:
//            QtyObj(
//                pressplus: pressplus,
//                pressminus: pressminus,
//                qty: qty,
//
//            ),
//          ),
//
//          new Expanded (
//            flex:1,
//            child : Column(
//              children: <Widget>[ IconButton(
//                icon: Icon(Icons.ac_unit,size: 30,),
//                tooltip: 'Increase volume by 10',
//                onPressed: (){
//                  _showMaterialDialog(varient);
//                },
//              ),],
//            ),),
//
//          new Expanded (
//            flex:1,
//            child : Column(
//              children: <Widget>[ IconButton(
//                icon: Icon(Icons.delete,size: 30,),
//                tooltip: 'Increase volume by 10',
//                onPressed:pressdelete
//              ),],
//            ),),
//
//        ],
//      ),
//    );
              ],
            ),
          ),
          Positioned(
            top: -13.0,
            right: -5.0,

            child: FloatingActionButton(
              heroTag: Text("btn1"),
              child:

              SvgPicture.asset("assets/icons/close.svg",
                width:15,
              ),

                onPressed:pressdelete,

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(80),

              ),
              backgroundColor: Colors.white,
              mini: true,
              elevation: 5.0,
            ),
          ),
        ],

    )
  );




//    // TODO: implement build
//    return  Padding(
//      padding: new EdgeInsets.all(SizeConfig.imageSizemultiplier*2),
//      child:
//      AspectRatio(
//        aspectRatio: 1.65,
//        child: Container(
//          decoration: BoxDecoration(
//              color: Colors.orangeAccent,
//              borderRadius: BorderRadius.circular(10)
//          ),
//          child: Row(
//            children: <Widget>[
//
//              Expanded(
//                flex: 1,
//                child:Column(
//                  children: <Widget>[
//                    AspectRatio(
//                      aspectRatio:0.91 ,
//                      //   child: Container(
////                margin: EdgeInsets.only(bottom: 15),
////                padding: EdgeInsets.all(25),
////                decoration: BoxDecoration(
////                  color: kPrimaryColor.withOpacity(0.15),
////                  shape: BoxShape.circle,
////                ),
//                      child:
//                      Image.asset(
//                        "assets/images/burger.png",
//                        fit:BoxFit.contain,
//                        alignment: Alignment.centerRight,
//
//                      ),
//
//                    ),
//
//                    IconButton(
//                        icon: Icon(Icons.delete,size: 30,),
//                        onPressed:pressdelete
//                    ),
//                  ],
//                )
//
//
//
//
//
//              ),
//
//
//
//              Expanded(
//                  flex: 2,
//                  child: Padding(
//                    padding: EdgeInsets.all(SizeConfig.heightMultiplier*2.5),
//                    child: Column(
//                      crossAxisAlignment: CrossAxisAlignment.start,
//                      children: <Widget>[
//                        Row(
//                          children: <Widget>[
//                            Expanded(
//                              flex: 3,
//                              child:   Text(itemname,
//                                style: TextStyle(fontWeight: FontWeight.w700,
//                                  fontSize: SizeConfig.textMultiplier*2.5,
//                                  color: Colors.white,
//
//                                ),
//                                maxLines: 2,
//                                overflow: TextOverflow.ellipsis,
//                              ),
//                            ),
//                            Expanded(
//                              flex: 1,
//                              child:   Text( 'Rs:'+price,
//                                style: TextStyle(
//                                  fontSize: SizeConfig.textMultiplier*2.5,
//                                  color: Colors.white,
//                                ),
//                                maxLines: 2,
//                                overflow: TextOverflow.ellipsis,
//                              ),
//                            )
//
//
//                          ],
//                        ),
//
//
//                        Row(
//                          children: <Widget>[
//                            Expanded(
//                              flex: 3,
//                              child: varient.length!=0?
//                              Text(varient[0].varientname,
//                                style: TextStyle(
//                                  fontSize: SizeConfig.textMultiplier*2,
//                                  color: Colors.white,
//                                ),
//                                maxLines: 2,
//                                overflow: TextOverflow.ellipsis,
//                              ):
//                             Text('')
//                            ),
//                            Expanded(
//                              flex: 1,
//                              child: varient.length!=0? Text('Rs:'+varient[0].price,
//                                style: TextStyle(
//                                  fontSize: SizeConfig.textMultiplier*2.5,
//                                  color: Colors.white,
//                                ),
//                                maxLines: 2,
//                                overflow: TextOverflow.ellipsis,
//                              ):
//                              Text('')
//                            )
//                          ],
//                        ),
//                        Divider(
//                            color: Colors.white
//                        ),
//
//
//                        Row(
//                          children: <Widget>[
//                            Expanded(
//                              flex: 1,
//                              child:
//                              Text('Qty',
//                                style: TextStyle(
//                                  fontSize: SizeConfig.textMultiplier*2.5,
//                                  color: Colors.white,
//                                ),
//
//
//                              ),
//                            ),
//
//
//
//                            QtyObj(
//                              pressplus: pressplus,
//                              pressminus: pressminus,
//                              qty: qty,
//
//                            ),
//
//                          ],
//                        ),
//
//                        Row(
//                          children: <Widget>[
//                            Expanded(
//                              flex: 1,
//                              child:   Text('Sub Totle',
//                                style: TextStyle(
//                                  fontSize: SizeConfig.textMultiplier*3,
//                                  color: Colors.white,
//                                ),
//                                maxLines: 2,
//                                overflow: TextOverflow.ellipsis,
//                              ),
//                            ),
//                            Expanded(
//                              flex: 1,
//                              child:   Text('Rs:'+totprice.toString(),
//                                style: TextStyle(
//                                    fontSize: SizeConfig.textMultiplier*2.5,
//                                    color: Colors.white,
//                                    fontWeight: FontWeight.bold
//                                ),
//                                maxLines: 2,
//                                overflow: TextOverflow.ellipsis,
//                              ),
//                            )
//                          ],
//                        ),
//
//
////                        Row(
////                          children: <Widget>[
////                            new Expanded (
////                              flex:1,
////                              child : Column(
////                                children: <Widget>[
////                                 Text('')
////                                ],
////                              ),),
////
////                            new Expanded (
////                              flex:1,
////                              child : Column(
////                                children: <Widget>[
////                                  IconButton(
////                                  icon: Icon(Icons.delete,size: 30,),
////                                  tooltip: 'Increase volume by 10',
////                                  onPressed:pressdelete
////                                ),
////                                ],
////                              ),),
////
////                          ],
////                        )
//
//
//
//
//                      ],
//                    ),
//                  )
//
//
//
//              ),
//
//
//            ],
//          ),
//        ),
//      ),
//    );
//
//
//
//
//
////      Container(
////
////      child:  Row(
////        children: <Widget>[
////          new
////          Expanded (
////            flex:2,
////            child : Column(
////              children: <Widget>[new    Text(itemname,style: TextStyle(fontSize: 15.0), ),],
////            ),),
////
////          Expanded (
////            flex:1,
////            child : Column(
////              children: <Widget>[new  Text(price.toString(),style: TextStyle(fontSize: 15.0), ),],
////            ),),
////
////
////
////          Expanded (
////            flex:1,
////            child : Column(
////              children: <Widget>[new  Text(totprice.toString(),style: TextStyle(fontSize: 15.0), ),],
////            ),),
////
////          Container(
////            child:
////            QtyObj(
////                pressplus: pressplus,
////                pressminus: pressminus,
////                qty: qty,
////
////            ),
////          ),
////
////          new Expanded (
////            flex:1,
////            child : Column(
////              children: <Widget>[ IconButton(
////                icon: Icon(Icons.ac_unit,size: 30,),
////                tooltip: 'Increase volume by 10',
////                onPressed: (){
////                  _showMaterialDialog(varient);
////                },
////              ),],
////            ),),
////
////          new Expanded (
////            flex:1,
////            child : Column(
////              children: <Widget>[ IconButton(
////                icon: Icon(Icons.delete,size: 30,),
////                tooltip: 'Increase volume by 10',
////                onPressed:pressdelete
////              ),],
////            ),),
////
////        ],
////      ),
////    );
//

  }

}





