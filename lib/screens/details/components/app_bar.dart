

import 'package:flutter/material.dart';
import 'package:resturantapp/constants.dart';
import 'package:resturantapp/screens/home/homescreen.dart';


//class AppBarobj extends StatelessWidget{
//
//}
AppBar buildAppBar() {
  return AppBar(
    elevation: 0,
    backgroundColor: kPrimaryColor,
    leading: IconButton(
      icon: Icon(
        Icons.arrow_back,
        color: Colors.white,

      ),
      onPressed: (){
//        Navigator.of().pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
//            HomeScreen()), (Route<dynamic> route) => false);
      },
    ),
    actions: <Widget>[

    ],
  );
}