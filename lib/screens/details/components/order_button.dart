import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants.dart';

class OrderButton extends StatelessWidget{
  final Function press;
  const OrderButton({
    this.press,
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
                  SvgPicture.asset('assets/icons/bag.svg',width: 20,height: 20,color: Colors.white,),
                  SizedBox(width: 10,),
                  Text("Order Now",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),)
                ],
              ),
            )
          ),


        )

    );
  }



}

