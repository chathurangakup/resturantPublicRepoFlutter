import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resturantapp/config/size_config.dart';
import 'package:resturantapp/constants.dart';
import 'package:resturantapp/screens/components/borderclipper.dart';

import 'components/body.dart';
import 'components/form.dart';
import 'components/lohinheader.dart';


class LoginScreen extends StatefulWidget{
  static final String id='login_screen';
  @override
  @override
  State<StatefulWidget> createState() {
    return _LoginScreenState();
  }

}


class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

class _LoginScreenState extends State<LoginScreen>{



  @override
  void initState() {
    super.initState();
   // print('Login');
  }





  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return Scaffold(

      resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        body:Body()
    );
  }

}











