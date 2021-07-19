
import 'package:flutter/cupertino.dart';

class SizeConfig {
  static double _screenwidth;
  static double _screenhight;
  static double _blockSizeHorizontal=0;
  static double _blockSizeVertical=0;

  static double textMultiplier;
  static double imageSizemultiplier;
  static double heightMultiplier;


  void init(BoxConstraints constraints,Orientation orientation){
    if(orientation==Orientation.portrait){
        _screenwidth=constraints.maxWidth;
        _screenhight=constraints.maxHeight;

    }else{
      _screenwidth=constraints.maxHeight;
      _screenhight=constraints.maxWidth;
    }

    _blockSizeHorizontal=_screenwidth/100;
    _blockSizeVertical=_screenhight/100;

    textMultiplier=_blockSizeVertical;
    imageSizemultiplier=_blockSizeHorizontal;
    heightMultiplier=_blockSizeVertical;



    print(_blockSizeVertical);
    print(_blockSizeHorizontal);

  }

}


//import 'package:flutter/material.dart';
//
//class SizeConfig{
//   static MediaQueryData _mediaQueryData;
//   static double screenWidth;
//   static double screenHeight;
//   static double defaultSize;
//   static Orientation orientation;
//
//   void init(BuildContext context){
//     _mediaQueryData=MediaQuery.of(context);
//     screenWidth=_mediaQueryData.size.width;
//     screenHeight=_mediaQueryData.size.height;
//     orientation=_mediaQueryData.orientation;
//
//
//     defaultSize=orientation==Orientation.landscape
//         ? screenHeight* 0.024
//         : screenWidth* 0.024;
//
//   }
//}