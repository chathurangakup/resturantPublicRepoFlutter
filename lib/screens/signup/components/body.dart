import 'package:flutter/material.dart';
import 'package:resturantapp/screens/signup/components/form.dart';
import 'package:resturantapp/screens/signup/components/signupheader.dart';


class Body extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SingleChildScrollView(

      child: Column(
        children: <Widget>[
          HeaderSignUpScreen(),
          FormPart()


        ],
      ),
    )
    ;
  }

}