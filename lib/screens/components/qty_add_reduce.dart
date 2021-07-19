import 'package:flutter/material.dart';
import 'package:resturantapp/constants.dart';

class QtyObj extends StatelessWidget{

  final Function pressplus;
  final Function pressminus;

  final int qty;
  const QtyObj({
    Key key,
    this.pressplus,
    this.pressminus,
    this.qty,

  }):super(key:key);


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        alignment: Alignment.centerRight,
        child: Padding(
          padding: EdgeInsets.only(left: 10),
          child:  Row(
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.remove_circle,size: 30,color: Colors.grey,),
                tooltip: 'Increase volume by 10',
                onPressed:pressminus,
              ),

              SizedBox(width: 0,),

              Text(qty.toString(),style: TextStyle(color: Colors.black,fontSize: 20),),
              SizedBox(width: 0,),
              IconButton(
                icon: Icon(Icons.add_circle,size: 30,color: Colors.grey,),
                tooltip: 'Increase volume by 10',
                onPressed: pressplus,
              ),


            ],
          ),
        )


    );
  }

}

