import 'package:flutter/material.dart';
import 'package:resturantapp/models/sqlite/itemcategory.dart';
import 'package:resturantapp/models/sqlite/itemcatwithvarient.dart';
import 'package:resturantapp/screens/checkout/checkoutscreen.dart';
import 'package:resturantapp/screens/details/components/order_button.dart';
import 'package:resturantapp/screens/components/checkoutbutton.dart';
import 'package:resturantapp/utils/database_helper.dart';

import '../../constants.dart';
import 'component/app-bar.dart';
import 'component/body.dart';

class HomeScreen extends StatefulWidget{


  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomeScreenState();
  }


}

class HomeScreenState extends State<HomeScreen>{

  DatabaseHelper databaseHelper=DatabaseHelper();
  double subtotprice=0.00;
  int subqty=0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("lll");
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
        appBar: homeAppbar(context),
        body: Body(),
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
//                  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
//                      CheckoutScreen()), (Route<dynamic> route) => false);
////                  MaterialPageRoute(builder: (context) =>
////                      CheckoutScreen()
////                  );

                  Navigator
                      .push(
                    context,
                    new MaterialPageRoute(builder: (context) =>  CheckoutScreen()),
                  );
                }
            ),

          ),
        )


    );;
  }

}


