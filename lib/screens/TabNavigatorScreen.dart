
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:resturantapp/constants.dart';
import 'package:resturantapp/screens/details/details_screen.dart';
import 'package:resturantapp/screens/favourite/favouritescreen.dart';
import 'package:resturantapp/screens/home/component/app-bar.dart';
import 'package:resturantapp/screens/profile/profilescreen.dart';
import 'package:resturantapp/screens/trackorder/trackorderscreen.dart';

import 'home/homescreen.dart';


class TabNavigatorScreen extends StatefulWidget {
  static final String id='tabnavigator_screen';

  final int currenttabid;
  TabNavigatorScreen({
    this.currenttabid,
    Key key,
  }):super(key:key);

  @override
  _TabNavigatorScreenState createState() => _TabNavigatorScreenState();
}

class _TabNavigatorScreenState extends State<TabNavigatorScreen> {
  bool canback = false;
  int index;
  int _currentTab;
  PageController _pageController;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController(
        initialPage: widget.currenttabid,
        keepPage: false,
        viewportFraction: 1.0
    );
    this.setState((){
        _currentTab=widget.currenttabid;
    });

  }




  Future<bool> _onWillPop() async {

    if (canback == true) {
      SystemChannels.platform.invokeMethod('SystemNavigator.pop');
    }else{
      setState(() {
        index=0;
      });
    }

    Timer(Duration(seconds: 2), () {
      setState(() {
        canback = false;
      });
    });
    canback = true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
    child:  Scaffold(

      body: PageView(
        physics: NeverScrollableScrollPhysics(),
       controller: _pageController,

        children: <Widget>[
          HomeScreen(),
          TrackorderScreen(),
          FavouriteScreen(),
          ProfileScreen(),

        ],
        onPageChanged: (int index){
          setState(() {
            _currentTab = index;
          });
        },
      ),

      bottomNavigationBar: CupertinoTabBar(
        currentIndex: _currentTab,
        backgroundColor: Colors.white,
        onTap: (int index){
          setState(() {
            _currentTab = index;
          });
          _pageController.animateToPage(
              index,
              duration: Duration(microseconds: 200),
              curve: Curves.easeIn
          );

        },
        activeColor: kPrimaryColor,

        items: [
          BottomNavigationBarItem(
            title: Text('Home'),
              icon: Icon(
                Icons.home,
                size: 32.0,
              )
          ),
          BottomNavigationBarItem(
              title: Text('TrackOrder'),
              icon: Icon(
                Icons.healing,
                size: 32.0,
              )
          ),
          BottomNavigationBarItem(
              title: Text('Favourite'),
              icon: Icon(AntDesign.heart)
          ),
          BottomNavigationBarItem(
              title: Text('Profile'),
              icon: Icon(
                Icons.account_circle,
                size: 32.0,
              )
          ),

        ],
      ),
    ),
    );


  }
}
