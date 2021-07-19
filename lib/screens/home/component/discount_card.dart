import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants.dart';

class DiscountCard extends StatelessWidget{

  const DiscountCard({
    Key key,

  }):super(key:key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Size size=MediaQuery.of(context).size;
    return Padding(

      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Offers & Discounts",
            style: TextStyle(fontWeight: FontWeight.bold,color: kTextColor),
          ),
          Container(
            width: double.infinity,
            height: 166,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image:AssetImage('assets/images/unnamed.png')
                )
            ),
            child: DecoratedBox(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                      colors: [
                        kTextColor.withOpacity(0.7),
                        kPrimaryColor.withOpacity(0.7)
                      ]
                  )
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: SvgPicture.asset("assets/icons/mcdonalds.svg",width: 100,height: 100,),
                  ),
                  Expanded(
                    child: RichText(
                        text: TextSpan(
                          style:TextStyle(color: Colors.white),
                          children: [
                            TextSpan(
                                text:"Get a discount of  \n",
                                style:TextStyle(fontSize: 16)
                            ),
                            TextSpan(
                                text:"30%  \n",
                                style:TextStyle(fontSize: 43,fontWeight: FontWeight.bold)
                            ),
                            TextSpan(
                                text:"You can get your order  \n",
                                style:TextStyle(fontSize: 16,fontWeight: FontWeight.bold)
                            ),
                          ],
                        )

                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),

    );
  }


}
