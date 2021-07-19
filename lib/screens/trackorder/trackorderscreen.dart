import 'package:flutter/material.dart';
import 'package:resturantapp/screens/myAddress/components/address_card.dart';

import 'components/body.dart';

class TrackorderScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return TrackorderScreenState();
  }

}

class TrackorderScreenState extends State<TrackorderScreen>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

        body:Body()
    );
  }

}


