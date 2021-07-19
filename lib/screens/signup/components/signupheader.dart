import 'package:flutter/material.dart';
import 'package:resturantapp/config/size_config.dart';
import 'package:resturantapp/screens/components/borderclipper.dart';

import '../../../constants.dart';

class HeaderSignUpScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child:  Stack(
        children: <Widget>[
          ClipPath(
            clipper: BorderClipper(),
            child: Container(
              width: double.infinity,
              height: 35.5 * SizeConfig.heightMultiplier,
              child: Stack(
                children: <Widget>[

                  Positioned(
                    left: -40,
                    top:-0,
                    bottom:0,
                    child:
                    Image.asset(
                      "assets/images/banner2.png",
                      fit: BoxFit.cover,
                      width: 700,
                      height: 400,

                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Container(

                      width: double.infinity,
                      height: 340,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                                kPrimaryColor.withOpacity(0.8),
                                kPrimaryColor.withOpacity(0.05),

                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter
                          )
                      ),
                    ),
                  ),

                ],
              ),
            ) ,
          ),
          Positioned(
            bottom: 0,
            right: 40,
            child: Text(
              'SIGNUP',
              style: TextStyle(
                  fontSize: 40,
                  color: kgrayColor,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w900
              ),
            ),
          ),

        ],
      ),

    );
  }

}
