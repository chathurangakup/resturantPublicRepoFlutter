import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:resturantapp/config/size_config.dart';

import '../../../constants.dart';

class ItemCard2 extends StatelessWidget{
  final String title;
  final String image;
  final String desc;
  final String img;
  final String price;
  final String itemcatid;
  final bool islike;
  final Function press;
  final  Function pressLikes;
  const ItemCard2({
    Key key,
    this.title,
    this.image,
    this.itemcatid,
    this.islike,
    this.desc,
    this.img,
    this.price,
    this.press,
    this.pressLikes
  }):super(key:key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Size size=MediaQuery.of(context).size;
    return InkWell(
       onTap:press ,
      child:  Container(
        margin: EdgeInsets.only(left: 10),
        height: 400,
        width: 280,
        child: Stack(
          children: <Widget>[
            Positioned(
              right: 0,
              bottom: 0,
              child: Container(
                height: 380,
                width: 260,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(34),
                  color: kPrimaryColor.withOpacity(0.06),
                ),
              ),
            ),

            Positioned(
              left: -10,
              top:0,
              child: Container(
                width: 201,
                height: 181,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: kPrimaryColor.withOpacity(0.15),

                ),
              ),
            ),

            Positioned(
                top: 20,
                left: 25,
                child: Container(
                  height: 130,
                  width: 130,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(image),

                      )
                  ),
                )
            ),
            Positioned(
              right: 20,
              top:80,
              child:  Text(
                '\Rs:$price',
                style:Theme.of((context)).textTheme
                    .title
                    .copyWith(color: kPrimaryColor),
              ),
            ),
            Positioned(
                top:221,
                left:40,
                child: Container(
                  width: 210,
                  child:  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(title,
                          style:Theme.of(context).textTheme.title),
                      Text(desc,
                          maxLines: 4,
                          style:TextStyle(
                              color: kTextColor.withOpacity(0.9)
                          ))
                    ],
                  ),
                )

            ),

        Positioned(
          top:331,
          left:120,
          child:  InkWell(
            onTap:pressLikes,
            child:
            Container(
                padding: new EdgeInsets.only(left: 80),
                child: islike==false ?
                new  SvgPicture.asset("assets/icons/heartdesect.svg",
                  width: size.width* 0.07,
                  color: Colors.red,
                )
                    :
                new  SvgPicture.asset("assets/icons/heart.svg",
                  width: size.width* 0.07,
                  color: Colors.red,
                )

            ),
          )
          ,
        )


          ],
        ),

      ),
    );



  }


}




