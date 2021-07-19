import 'package:flutter/material.dart';

import '../../../constants.dart';

AppBar homeAppbar(BuildContext context){
 return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    title:new Center(child:
    RichText(
      text: TextSpan(
          style:Theme.of(context)
              .textTheme
              .title
              .copyWith(fontWeight: FontWeight.bold),
          children: [
            TextSpan(
                text: "Punk",
                style:TextStyle(color: kTextColor )
            ),
            TextSpan(
                text: "Food",
                style:TextStyle(color: ksecndryColor )
            )
          ]
      ),
    ),
    ),
  );


}

