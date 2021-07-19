import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:resturantapp/config/size_config.dart';
import 'package:resturantapp/screens/checkout/checkoutscreen.dart';
import 'package:resturantapp/screens/ordercomplete/components/ordercompletebtn.dart';
import 'package:resturantapp/screens/ordercomplete/components/orderheader.dart';

import '../../constants.dart';
import '../TabNavigatorScreen.dart';

class OrderCompleteScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Size size=MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          title: Text('Order Complete'),
          elevation: 0,
          centerTitle: true,


        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              OrderHeader(),

              Container(

                child:  SvgPicture.asset("assets/icons/shoppingcart.svg",
                  width: size.width* 0.7,

                )

              ),

              Container(
                padding: EdgeInsets.all(SizeConfig.heightMultiplier*5),
                child: Column(
                  children: <Widget>[
                    Text('Your order is completed!',style:TextStyle(fontSize: SizeConfig.textMultiplier*4)),
                    Text('we ll deliver your order immediately,'),
                    Text('make sure your order put on the doorstep')
                  ],
                )


              )





            ],
          ),
        ),
        bottomNavigationBar:
        Container(
          color: Colors.white,
          child:  Padding(

            padding: EdgeInsets.all(10.0),
            child:
            OrderCompleteButton(

                size:size,
                press:(){


                  Navigator
                      .push(
                    context,
                    new MaterialPageRoute(builder: (context) =>  TabNavigatorScreen(currenttabid: 0,)),
                  );
                }
            ),

          ),
        )


    );;
  }

}