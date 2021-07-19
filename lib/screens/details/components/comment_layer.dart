import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:resturantapp/config/size_config.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

import '../../../constants.dart';



class CommentLayer extends StatelessWidget{
  final String commentid;
   final String name;
   final String date;
   final double rating;
   final String comment;
   final bool isdelete;
   final custonFunction;

  const CommentLayer({
    this.commentid,
    this.name,
    this.date,
    this.isdelete,
    this.rating,
    this.comment,
    this.custonFunction,
    Key key
}):super(key:key);

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return  Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[

              Expanded(
                  flex:2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(name,style:TextStyle(fontSize: SizeConfig.textMultiplier*2)),
                      Text(date,style:TextStyle(fontSize: SizeConfig.textMultiplier*1.2))
                    ],
                  )
              ),
              Expanded(
                flex:1,

                child:  SmoothStarRating(
                  borderColor: kPrimaryColor,
                  color:kPrimaryColor ,
                  isReadOnly: true,
                  size:SizeConfig.textMultiplier*1.5,
                  rating: rating,
                ),
              ),

              isdelete==true?
              Expanded(
                  flex:1,
                  child:
                RaisedButton(
                  child: new  SvgPicture.asset("assets/icons/delete.svg",
                    width: size.width* 0.07,
                  ),
                  onPressed: (){
                    custonFunction(commentid);
                  },
                )

              )
              :
            Text(''),


            ],
          ),
          Text(comment,textAlign: TextAlign.left,style:TextStyle(color: Colors.grey,fontSize: SizeConfig.textMultiplier*2)),
          Divider(
              color: Colors.black
          )
        ],
      ),
    );
  }

}