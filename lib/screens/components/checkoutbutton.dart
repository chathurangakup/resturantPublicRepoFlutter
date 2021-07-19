import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants.dart';

class CheckoutButton extends StatelessWidget{
  final Function press;
   final double totprice;
   final int totqty;
  const CheckoutButton({
    this.press,
    this.totprice,
    this.totqty,
    Key key,
    @required this.size,
  }):super(key:key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Container(

        padding: EdgeInsets.all(10),
        width: size.width*0.7,
        decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.circular(10)
        ),
        child:Material(
          color: Colors.transparent,
          child:
          InkWell(
              onTap: press,
              child:Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(right: 30),
                    child: Text('Rs: '+ totprice.toString(),style: TextStyle(color: Colors.white),),
                  ),





                    Text('Checkout',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),

                    Padding(
                      padding: EdgeInsets.only(left: 30),
                      child: Text(totqty.toString(),style: TextStyle(color: Colors.white),),
                    ),

                  ],
                ),
              )
          ),


        )

    );
  }



}

