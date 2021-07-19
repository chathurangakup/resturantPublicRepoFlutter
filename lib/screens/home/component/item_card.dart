import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:resturantapp/config/size_config.dart';

import '../../../constants.dart';

class ItemCard extends StatelessWidget{
  final String title;
  final String image;
  final String desc;
  final String img;
  final String price;
  final String itemcatid;
  final bool islike;
  final Function press;
  final  Function pressLikes;
  const ItemCard({
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
    return Container(
        margin: EdgeInsets.only(left: 15,right: 10,top:0,bottom:20),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow:[
              BoxShadow(
                  offset: Offset(0,4),
                  blurRadius: 20,
                  color: kPrimaryColor.withOpacity(0.14)
              )
            ]
        ),
        child:Material(
          color: Colors.transparent,
          child: InkWell(
              onTap: press,
              child:Padding(
                padding: const EdgeInsets.all(3.0),
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(bottom: SizeConfig.heightMultiplier*2),
                      padding: EdgeInsets.all(25),
                      decoration: BoxDecoration(
                        color: kPrimaryColor.withOpacity(0.15),
                        shape: BoxShape.circle,
                      ),
                      child: Image.network(image,
                        width: SizeConfig.imageSizemultiplier*25.18,
                        height:SizeConfig.heightMultiplier*13.18 ,
                      )
                    ),
                    Text(title,
                      style: new TextStyle(
                      fontSize: 12.0,
                      fontFamily: 'Roboto',
                      color: new Color(0xFF212121),
                      fontWeight: FontWeight.bold,
                     ),
                    ),
                    SizedBox(height: 10.0,),
//                   Row(
//                     children: <Widget>[
//                       Expanded(
//                         flex: 0,
//                         child:
//                       ),
//                       Expanded(
//                         flex: 0,
//                         child:
//
//                       ),
//
//                     ],
//                   )
                    new Container(
                      padding: new EdgeInsets.only(right: 13.0),
                      child: new Text(
                        desc.length > 20 ? '${desc.substring(0, 20)}...' : desc,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 5,
                        style: new TextStyle(
                          fontSize: 12.0,

                        ),
                      ),
                    ),
                    SizedBox(height: 10.0,),
                    new Container(
                       alignment: Alignment.centerLeft,
                       child:Padding(
                         padding: new EdgeInsets.only(right: SizeConfig.imageSizemultiplier*15),
                         child: new Text(
                           'Rs: '+ price,
                           overflow: TextOverflow.ellipsis,
                           maxLines: 5,
                           style: new TextStyle(
                             fontSize: SizeConfig.textMultiplier*2.5,

                           ),
                         ),
                       )


                    ),

            InkWell(
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

                  ],
                ),

              )
          ),
        )

    );
  }


}
