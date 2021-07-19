import 'package:flutter/material.dart';

import '../../constants.dart';
import '../TabNavigatorScreen.dart';
import 'components/body.dart';

class MyProfileScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyProfileScreenState();
  }


}

class MyProfileScreenState extends State<MyProfileScreen>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text('My Profile'),
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,

          ),
          onPressed: (){
            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                TabNavigatorScreen(currenttabid: 3,)), (Route<dynamic> route) => false);

          },
        ),
      ),
      body: Body(),
    );
  }

}