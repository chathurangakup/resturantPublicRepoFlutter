import 'package:flutter/material.dart';
import 'package:resturantapp/screens/details/components/priceclipper.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

import '../../../constants.dart';
import '../details_screen.dart';


class TitlepriceRating extends StatelessWidget{
  final String itemCatname;
  final double rating;
  final String price;
  final String reviews;
  final Function clickReview;
  final Function clickAddReview;
  const TitlepriceRating({
    Key key,
    this.itemCatname,
    this.rating,
    this.price,
    this.reviews,
    this.clickReview,
    this.clickAddReview
  }):super(key:key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  itemCatname,
                  style: Theme.of(context).textTheme.bodyText1,
                ),

                Row(
                  children: <Widget>[
                    SmoothStarRating(
                      borderColor: kPrimaryColor,
                      color:kPrimaryColor ,
                      isReadOnly: true,
                      rating: rating,
                    ),
                    SizedBox(width: 10,),
                  new GestureDetector(
                    onTap: clickReview,
                    child:  Text(reviews),
                  ),



                  ],
                ),
                new GestureDetector(
                  onTap: clickAddReview,
                  child:  Text('Add reviews'),
                ),

              ],
            ),
          ),
          ClipPath(
              clipper: PricerClipper(),
              child:  Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical: 5),
                height: 65,
                width: 65,
                color: kPrimaryColor,
                child: Text('\Rs'+ price,
                  style: Theme.of(context).textTheme.subtitle1.copyWith(
                    color: Colors.white,fontWeight: FontWeight.bold,
                    fontSize: 15
                ),),
              )
          )
        ],
      ),
    );
  }

}

