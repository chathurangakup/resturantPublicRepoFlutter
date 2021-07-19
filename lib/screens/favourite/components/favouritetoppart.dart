import 'package:flutter/material.dart';
import 'package:resturantapp/constants.dart';
import 'package:resturantapp/screens/components/customshapeclipper.dart';

class FavouriteTopPart extends StatelessWidget{
  final String text;
  final Function onChange;
  final Function clickClose;
  final Function clickSearch;
  final FocusNode focusnode;
  FavouriteTopPart({
    Key key,
    this.text,
    this.onChange,
    this.clickClose,
    this.clickSearch,
    this.focusnode
}):super(key:key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Size size=MediaQuery.of(context).size;

    return Stack(
      children: <Widget>[
        ClipPath(
          clipper: CustomShapeClipper(),
          child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [kPrimaryColor,kPrimaryColor])
              ),
              height: size.height/6,
              child:Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32.0),
                    child: Material(
                      elevation: 5.0,
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      child:Focus(
                      onFocusChange:(val){print(val);},
                      child:   TextField(
                        controller: TextEditingController(text: text),
                        onChanged: onChange,
                        focusNode: focusnode,
                        cursorColor: kTextColor,
                        style: TextStyle(color: Colors.black ,fontSize: 16),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(horizontal: 32,vertical: 14),

                          hintText: "Search Favourite Items",
                          suffixIcon: Material(
                              elevation: 2.0,
                              borderRadius: BorderRadius.all(Radius.circular(30.0)),
                              child: text==''?
                              new IconButton(
                                icon: new  Icon(Icons.search,color: Colors.black),
                                highlightColor: Colors.pink,
                                onPressed:clickSearch,
                              )

                                  :
                              new IconButton(
                                icon: new  Icon(Icons.close,color: Colors.black),
                                highlightColor: Colors.pink,
                                onPressed:clickClose,
                              )
                          ),

                        ),
                      ),

                      )



                    ),
                  ),
                ],
              )
          ),
        ),

      ],
    );
  }

}