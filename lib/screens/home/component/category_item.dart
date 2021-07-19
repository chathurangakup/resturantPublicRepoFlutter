import 'package:flutter/material.dart';
import 'package:resturantapp/config/size_config.dart';

import '../../../constants.dart';

class CategoryItem extends StatelessWidget{
  final String title;
  final bool isActive;
  final Function press;
  const CategoryItem({
    Key key,
    this.title,
    this.isActive=false,
    this.press,
  }):super(key:key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: press,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 30.0),
        child: Column(
          children: <Widget>[
            Text(
              title,
              style:isActive?
              TextStyle(
                  color: ksecndryColor,
                  fontWeight: FontWeight.bold,
                  fontSize:SizeConfig.textMultiplier*2.8
              )
                  :
              TextStyle(
                  fontSize:SizeConfig.textMultiplier*2.5
              )

              ,
            ),
            if(isActive)
              Container(
                margin: EdgeInsets.symmetric(vertical: 5),
                height: 3,
                width: 22,
                decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(10.0)
                ),
              ),

          ],
        ),
      ),
    );
  }

}