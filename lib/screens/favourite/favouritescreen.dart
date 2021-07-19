import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:resturantapp/constants.dart';
import 'package:resturantapp/models/sqlite/itemcatwithvarient.dart';
import 'package:resturantapp/screens/checkout/checkoutscreen.dart';
import 'package:resturantapp/screens/components/checkoutbutton.dart';
import 'package:resturantapp/screens/components/customshapeclipper.dart';
import 'package:resturantapp/screens/favourite/components/favourite_card.dart';
import 'package:resturantapp/utils/database_helper.dart';

import 'components/body.dart';
import 'components/favouritetoppart.dart';

class FavouriteScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return FavouriteScreenState();
  }

}

class FavouriteScreenState extends State<FavouriteScreen>{
  DatabaseHelper databaseHelper=DatabaseHelper();
  double subtotprice=0.00;
  int subqty=0;


@override
  void initState() {
    // TODO: implement initState
    super.initState();
    getallSqliteTavle();
  }


  void getallSqliteTavle() async{
    List<ItemCatVarientListModel> itemcatListData =await  databaseHelper.getWithItemcatVarientList();
    print("dhhdhdhd");
    for(int i=0;i<itemcatListData.length;i++){

      setState(() {
        subtotprice=itemcatListData[i].totprice+subtotprice;
      });
      setState(() {
        subqty=itemcatListData[i].qty+subqty;
      });

    }


  }


  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    // TODO: implement build
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text('Favourites'),
        elevation: 0,
        centerTitle: true,
      ),
        body:Body(),
      bottomNavigationBar:
      Container(
      color: Colors.white,
      child:  Padding(

        padding: EdgeInsets.all(10.0),
        child:
        CheckoutButton(
            totprice: subtotprice,
            totqty: subqty,
            size:size,
            press:(){
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                  CheckoutScreen()), (Route<dynamic> route) => false);
//                  MaterialPageRoute(builder: (context) =>
//                      CheckoutScreen()
//                  );
            }
        ),

      ),
    )
    );
  }


}



