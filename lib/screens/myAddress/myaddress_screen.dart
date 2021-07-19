import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:resturantapp/screens/TabNavigatorScreen.dart';
import 'package:resturantapp/screens/checkout/checkoutscreen.dart';
import 'package:resturantapp/screens/myAddress/components/myaddressheader.dart';
import 'package:resturantapp/screens/profile/profilescreen.dart';

import '../../constants.dart';
import 'components/address_card.dart';
import 'components/addressbtn.dart';
import 'components/body.dart';

class MyAddressScreen extends StatelessWidget{
  final String addressnav;
  const MyAddressScreen({
    Key key,
    this.addressnav
}):super(key:key);

  clickNav(context){
    if(addressnav!='checkout'){
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) =>
              TabNavigatorScreen(currenttabid:3)), (Route<dynamic> route) => false);
    }else{
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) =>
              CheckoutScreen()), (Route<dynamic> route) => false);
    }



  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () =>this.clickNav(context)


        ),
        title: Text('My Address'),
        elevation: 0,
        centerTitle: true,
      ),
       body: Body()


    );
  }
}

