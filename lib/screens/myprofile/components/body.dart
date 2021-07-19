import 'package:flutter/material.dart';
import 'package:resturantapp/config/size_config.dart';
import 'package:resturantapp/screens/components/formtxtinput.dart';
import 'package:resturantapp/screens/components/passwordtextInput.dart';
import 'package:resturantapp/screens/myprofile/components/form.dart';
import 'package:resturantapp/screens/myprofile/components/myprofileheader.dart';

import '../../../constants.dart';

class Body extends StatelessWidget{
  @override
  Widget build(BuildContext context) {




    return
   SingleChildScrollView(
     physics: ClampingScrollPhysics(),
     child:Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
             MyProfileHeader(),
             FormPart()
          ],
        ),
    );

//    Column(
//      children: <Widget>[
//
////            Container(
////            child:
////               MyProfileHeader(),
////            ),
//
//        Container(
//          height: 500,
//          child:
//            SingleChildScrollView(
//              child:FormPart() ,
//            )
//
//        ),
//      ],
//    );




  }

}