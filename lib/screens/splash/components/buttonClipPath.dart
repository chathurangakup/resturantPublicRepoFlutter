import 'package:flutter/material.dart';

class OnBoardingButtonClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    Path path =Path();
    path.moveTo(size.width, size.height);


    path.lineTo(40, size.height / 2 + 30);


    var controlPoint = Offset(5, size.height / 2);
    var endPoint = Offset(40, size.height / 2 - 30);


    path.quadraticBezierTo(
        controlPoint.dx, controlPoint.dy, endPoint.dx, endPoint.dy);


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