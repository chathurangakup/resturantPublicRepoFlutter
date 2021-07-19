import 'package:flutter/material.dart';

class PricerClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    Path path =Path();
    double ignoreheight=20;
    path.lineTo(0, size.height-ignoreheight);
    path.lineTo(size.width/2, size.height);
    path.lineTo(size.width, size.height-ignoreheight);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }

}