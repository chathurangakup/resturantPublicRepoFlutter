import 'package:flutter/material.dart';


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

Color kPrimaryColor= HexColor('FF5733');
//Color kPrimaryColor= HexColor('9f3aa1');
//Color ksecndryColor=HexColor('b3cccc');
Color ksecndryColor=HexColor('FFA500');
Color kwhiteColor=HexColor('ffffff');
Color korangeColor=HexColor('ff9933');
Color kgrayColor=HexColor('777777');
Color kTextColor=HexColor('666699');
Color kTextLightColor=HexColor('FF5733');

