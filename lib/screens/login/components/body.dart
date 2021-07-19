import 'package:flutter/material.dart';
import 'package:resturantapp/screens/login/components/form.dart';
import 'package:resturantapp/screens/login/components/lohinheader.dart';

class Body extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SingleChildScrollView(

      child: Column(
        children: <Widget>[
          HeaderLoginScreen(),
          FormPart()


        ],
      ),
    )
    ;
  }

}