import 'package:flutter/material.dart';
import 'package:resturantapp/screens/components/customshapeclipper.dart';

import '../../constants.dart';
import 'components/body.dart';

class ProfileScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ProfileScreenState();
  }

}

class ProfileScreenState extends State<ProfileScreen>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          title: Text('Profile'),
          elevation: 0,
          centerTitle: true,
        ),
       body: Body()

    );
  }

}


