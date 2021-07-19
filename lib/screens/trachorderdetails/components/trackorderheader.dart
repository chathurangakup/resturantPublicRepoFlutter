import 'package:flutter/material.dart';
import 'package:resturantapp/screens/components/customshapeclipper.dart';

import '../../../constants.dart';

class TrackorderHeader extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Size size=MediaQuery.of(context).size;
    return Stack(
      children: <Widget>[
        ClipPath(
          clipper: CustomShapeClipper(),
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [kPrimaryColor,kPrimaryColor])
            ),
            height: size.height/8,
            width: size.width,

          ),
        ),

      ],
    );;
  }

}