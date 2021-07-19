import 'package:flutter/material.dart';

import '../../../constants.dart';


class BottomTab extends StatelessWidget{
  final String subtotprice;
  final Function changeStatus;
  final Function orderClick;
  final String status;
  const BottomTab({
    Key key,
    this.subtotprice,
    this.changeStatus,
    this.status,
    this.orderClick,

}):super(key:key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
          InkWell(
          child:Container(
            padding: EdgeInsets.symmetric(vertical: 20,horizontal: 30),
            decoration: BoxDecoration(
              color: kPrimaryColor.withOpacity(0.19),
              borderRadius: BorderRadius.circular(27),
            ),

            child:  Row(
              children: <Widget>[
                Container(
                  child: Text(
                      "Order Now"
                  ),

                ),
                SizedBox(width: 20,),
                Container(
                  child: Text(
                     'Rs: '+ subtotprice.toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold
                    ),
                  ),

                )

              ],
            ),

          ),

            onTap: orderClick
          ),

    GestureDetector(
    onTap:changeStatus,
    child:
        Container(
            padding: EdgeInsets.symmetric(vertical: 15,horizontal: 20),
            decoration: BoxDecoration(
              color: kPrimaryColor.withOpacity(0.19),
              borderRadius: BorderRadius.circular(30),
            ),
            child:
            Stack(
              alignment: Alignment.center,
              children: <Widget>[
               Container(
                      alignment: Alignment.center,
                      height: 30,
                      width: 90,

                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.refresh,
                            color: Colors.green,
                            size: 20.0,
                          ),
                          SizedBox(width: 5,),
                          Text(status),
                        ],
                      )


                  ,
                )

              ],
            )
        ),
    )
//              Container(
//                height: 75,
//                width: 100,
//                decoration: BoxDecoration(
//                  shape: BoxShape.circle,
//                  color: kPrimaryColor.withOpacity(0.26),
//                ),
//                child: Stack(
//                  alignment: Alignment.center,
//                  children: <Widget>[
//                    Container(
//                      height: 60,
//                        width: 60,
//                      decoration: BoxDecoration(shape: BoxShape.circle,color: kPrimaryColor),
//                    )
//                  ],
//                )
        //  )
      ],
    )
    ;
  }

}