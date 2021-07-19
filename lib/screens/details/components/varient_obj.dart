import 'package:flutter/material.dart';

class VarientObj extends StatelessWidget{
  final String checkboxname;
  final String price;
  final Function onChange;
  final bool isActivecheckbox;
  final int qty;
  final int groupvalue;
  final int value;
  const VarientObj({
    Key key,
    this.checkboxname,
    this.price,
    this.onChange,
    this.isActivecheckbox,
    this.qty,
    this.groupvalue,
    this.value,


  }):super(key:key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Container(
        child:Padding(
            padding: const EdgeInsets.only(top: 0.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[

                Column(

                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        SizedBox(width: 10,),
                        new Expanded (
                          flex:1,
                          child : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              new
                             Text(checkboxname,style: TextStyle(fontSize: 15.0), ),],
                          ),),


                        new Expanded (
                          flex:1,
                          child : Column(
                            children: <Widget>[new  Text("\Rs "+ price,style: TextStyle(fontSize: 15.0), ),],
                          ),),


                        new Expanded(
                          flex :1,
                          child: Column(
                            children: <Widget>[
//                              Checkbox(
//                                checkColor: Colors.greenAccent,
//                                activeColor: Colors.red,
//                                value:isActivecheckbox,
//                                onChanged: onChange,
//                              ),

                              Radio(
                                value:value,
                                groupValue: groupvalue,
                                onChanged: onChange
                              ),

                            ],
                          ),)

                      ],
                    ),

                  ],
                )
              ],
            )
        )
    );


  }

}