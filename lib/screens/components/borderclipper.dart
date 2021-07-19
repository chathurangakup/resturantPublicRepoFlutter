import 'package:flutter/material.dart';

class BorderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    Path path =Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(12, size.height-38, 40, size.height-48);
    path.lineTo(size.width-40, size.height-140);
    path.quadraticBezierTo(size.width, size.height-145, size.width, size.height-212);
    path.lineTo(size.width, 0);



//    double ignoreheight=20;
//    path.lineTo(0, size.height-ignoreheight);
//    path.lineTo(size.width/2, size.height);
//    path.lineTo(size.width, size.height-ignoreheight);
//    path.lineTo(size.width, 0);
//    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }

}