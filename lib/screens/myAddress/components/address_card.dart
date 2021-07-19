import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:resturantapp/config/size_config.dart';

import '../../../constants.dart';

class AddressCard extends StatelessWidget{
  final String addressname;
  final Function presssSetDefault;
  final Function presssDelete;

  AddressCard({
    Key key,
    this.addressname,
    this.presssDelete,
    this.presssSetDefault

  }):super(key:key);



  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;



    // TODO: implement build
    return Material(
        color: Colors.transparent,
        child: InkWell(
            onTap: (){},
            child:Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 120.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)
                        ),
                        border: Border.all(color: Colors.grey)
                    ),
                    child: Column(

                      children: <Widget>[
                        Row(

                          children: <Widget>[
//                            new Expanded (
//                              flex:1,
//                              child :  Container(
//                                margin: EdgeInsets.all(2),
//                                padding: EdgeInsets.all(15),
//                                decoration: BoxDecoration(
//                                  color: kPrimaryColor.withOpacity(0.15),
//                                  shape: BoxShape.circle,
//                                ),
//                                child: SvgPicture.asset("assets/icons/fast-food.svg",
//                                  width: size.width* 0.20,
//                                ),
//                              ),
//                            ),

                            new Expanded (
                              flex:3,
                              child: Container(
                                  padding: EdgeInsets.all(10),
                                  child:Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[


                                      Text(
                                        addressname,
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            fontSize: SizeConfig.textMultiplier*2.5,
                                            fontWeight: FontWeight.normal
                                        ),
                                      ),


                                    ],
                                  )
                              ),
                            ),

                            new Expanded (
                                flex:1,
                                child : Column(
                                  children: <Widget>[
                                    SizedBox(height: 20,),
                                    InkWell(
                                      onTap:presssSetDefault,
                                      child:
                                      Container(
                                          child:Text('Set Default',style: TextStyle(fontWeight: FontWeight.bold),)

                                      ),
                                    ),

                                    SizedBox(height: 30,),

                                    InkWell(
                                      onTap:presssDelete,
                                      child:
                                      Container(
                                          child:
                                          Icon(
                                            Icons.delete,
                                            color: Colors.orange,
                                            size: 24.0,
                                            semanticLabel: 'Text to announce in accessibility modes',
                                          ),
                                      ),
                                    )

                                  ],
                                )





                            ),

                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            )



        )
    );



  }

}

