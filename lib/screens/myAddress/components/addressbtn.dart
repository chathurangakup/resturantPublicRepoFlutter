import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

import '../../../constants.dart';

class AddAddressBtn extends StatelessWidget{
  final Function press;
  const AddAddressBtn({
    Key key,
    this.press
  }):super(key:key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Row(
      children: <Widget>[
        Expanded(
            flex: 1,

            child:Container()
        ),
        Expanded(
            flex: 1,
            child:
            Padding(
              padding: EdgeInsets.only(right: 15),
              child: SizedBox(
                width: 120,
                child: FlatButton(

                  child: Row(
                    children: [

                      Text(
                        "Add Address",
                        style: TextStyle(fontSize: 13.0, fontFamily: "Raleway"),
                      ),
//                         Image.asset(
//                           "images/notesicon.png",
//                           width: 20.0,
//                           height: 20.0,
//                         )
                      SizedBox(width: 15,),
                      Icon(AntDesign.google)
                    ],
                  ),
                  onPressed:press,
                  textColor: Colors.white,
                  color: kTextColor,
                  shape: OutlineInputBorder(
                      borderSide: BorderSide(
                          style: BorderStyle.solid, width: 1.0, color: kTextColor),
                      borderRadius: new BorderRadius.circular(20.0)),
                ),
              ) ,
            )

        ),



      ],
    );
  }

}