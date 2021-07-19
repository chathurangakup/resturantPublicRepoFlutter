import 'package:flutter/material.dart';
import 'package:resturantapp/screens/splash/components/buttonClipPath.dart';

import '../../../constants.dart';

class OnBoardingButton extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ClipPath(
      clipper: OnBoardingButtonClipper(),
      child:Container(
        width: 135,
        height: 155,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  ksecndryColor,
                  kPrimaryColor,


                ],
                stops: [
                  0.4,
                  1.0
                ]
            )
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(left: 45),
            child: Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
            ),
          ),
        ),
      ) ,
    );




  }

}