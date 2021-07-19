import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:resturantapp/config/size_config.dart';
import 'package:resturantapp/screens/components/customshapeclipper.dart';
import 'package:resturantapp/screens/login/loginscreen.dart';
import 'package:resturantapp/screens/myAddress/myaddress_screen.dart';
import 'package:resturantapp/screens/myprofile/myprofile.dart';
import 'package:resturantapp/screens/profile/components/profileheader.dart';
import 'package:resturantapp/utils/database_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';


import '../../../constants.dart';

class Body extends StatelessWidget{
  DatabaseHelper databaseHelper=DatabaseHelper();


  pressLogout(context) async{
    int deleteItemTable =await databaseHelper.deleteItemCatTable();
    int deletevarTable =await databaseHelper.deleteVarientTable();
    print(deleteItemTable);
    print(deletevarTable);

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('access_token', '');
    prefs.setString('userid', '');

    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) =>
            LoginScreen()), (Route<dynamic> route) => false);
  }




  _showMaterialDialog(context) {
    showDialog(
        context: context,
        builder: (_) => new AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius:
              BorderRadius.all(
                  Radius.circular(10.0))),
          content: Builder(
            builder: (context) {
              // Get available height and width of the build area of this widget. Make a choice depending on the size.
              var height = MediaQuery.of(context).size.height;
              var width = MediaQuery.of(context).size.width;


              return SingleChildScrollView(
//                  width: width,
//                  height: height-width/2,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding:EdgeInsets.only(bottom: 40),
                        child: Text("Are you sure you want to logout?",style:TextStyle(fontSize: SizeConfig.textMultiplier*3)),
                      ),


                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[



                          FlatButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: BorderSide(color: Colors.white)),
                            color: Colors.white,
                            textColor: Colors.black,
                            padding: EdgeInsets.all(8.0),
                            onPressed: () {Navigator.pop(context);},
                            child: Text(
                              "Cancel".toUpperCase(),
                              style: TextStyle(
                                fontSize: 14.0,
                              ),
                            ),
                          ),
                          SizedBox(width: SizeConfig.imageSizemultiplier*10),
                          FlatButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: BorderSide(color: Colors.red)),
                            color: Colors.white,
                            textColor: Colors.red,
                            padding: EdgeInsets.all(8.0),
                            onPressed: () {
                              this.pressLogout(context);
                            },
                            child: Text(
                              "OK".toUpperCase(),
                              style: TextStyle(
                                fontSize: 14.0,
                              ),
                            ),
                          ),



                        ],
                      )



                    ],
                  )

              );
            },
          ),
        )
    );
  }



  @override
  Widget build(BuildContext context) {


    Size size=MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          ProfileHeader(),

          SizedBox(height: size.height/18,),
          ProfileItems(
            name:"My Profile",
            desc:"this is my profile",
            onPress:(){
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) =>
                      MyProfileScreen()), (Route<dynamic> route) => false);
            },
            icon:Icon(AntDesign.user),
          ),
          SizedBox(height: size.height/18,),
          ProfileItems(
            name:"My Address",
            desc:"this is my profile",
            onPress:(){
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) =>
                      MyAddressScreen()), (Route<dynamic> route) => false);
            },
            icon:Icon(AntDesign.mail),
          ),
          SizedBox(height: size.height/18,),
          ProfileItems(
            name:"Logout",
            desc:"this is my profile",
            onPress:(){
               // this.pressLogout(context);
                this._showMaterialDialog(context);
            },
            icon:Icon(AntDesign.logout),
          )



        ],
      ),
    );
  }

}


class ProfileItems extends StatelessWidget{
  final Widget icon;
  final String name;
  final String desc;
  final Function onPress;
  ProfileItems({
    Key key,
    this.icon,
    this.name,
    this.desc,
    this.onPress
}):super(key:key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new GestureDetector(
        onTap:onPress,
      child: Column(
        children: <Widget>[
          Container(
            child: Row(
              children: <Widget>[
                new Expanded (
                  flex:1,
                  child :icon,
                ),

                new Expanded (
                  flex:2,
                  child :Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(name,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),),
                      Text(desc)
                    ],
                  ),
                ),

                new Expanded (
                  flex:1,
                  child :    Icon(Icons.arrow_forward_ios,color: Colors.black),
                ),

              ],
            ) ,
          ),
          Padding(
            padding: EdgeInsets.only(left: 15,right: 15),
            child: Divider(
                color: Colors.black
            ),
          )
        ],
      ),
    );





  }

}

