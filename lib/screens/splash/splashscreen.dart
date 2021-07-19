
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:resturantapp/config/size_config.dart';
import 'package:resturantapp/screens/login/loginscreen.dart';
import 'package:resturantapp/screens/signup/signupscreen.dart';
import 'package:resturantapp/screens/splash/components/onBoardingButton.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants.dart';
import '../TabNavigatorScreen.dart';
import '../components/borderclipper.dart';
//import 'package:mithuruthuru/screens/LoginScreen.dart';
//import 'package:mithuruthuru/screens/TabNavigatorScreen.dart';
//import 'package:shared_preferences/shared_preferences.dart';
//import 'package:firebase_admob/firebase_admob.dart';


//const String testDevice = '57A5D9EE66FB39259A55A5EE83395188';


class SplashScreen extends StatefulWidget {
  static final String id='splash_screen';


  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isconnected=false;

//  static const MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
//    testDevices: testDevice != null ? <String>[testDevice] : null,
//    keywords: <String>['foo', 'bar'],
//   // contentUrl: 'http://foo.com/bar.html',
//    childDirected: true,
//    nonPersonalizedAds: true,
//  );
//
//  BannerAd _bannerAd;
////  NativeAd _nativeAd;
//  InterstitialAd _interstitialAd;
////  int _coins = 0;
////
//  BannerAd createBannerAd() {
//    return BannerAd(
//      adUnitId: 'ca-app-pub-1538436350920374/7051051679',
//      size: AdSize.banner,
//      targetingInfo: targetingInfo,
//      listener: (MobileAdEvent event) {
//        print("BannerAd event $event");
//      },
//    );
//  }
//
//  InterstitialAd createInterstitialAd() {
//    return InterstitialAd(
//      adUnitId: 'ca-app-pub-1538436350920374/3168481135',
//      targetingInfo: targetingInfo,
//      listener: (MobileAdEvent event) {
//        print("InterstitialAd event $event");
//      },
//    );
//  }
//
//  NativeAd createNativeAd() {
//    return NativeAd(
//      adUnitId: NativeAd.testAdUnitId,
//      factoryId: 'adFactoryExample',
//      targetingInfo: targetingInfo,
//      listener: (MobileAdEvent event) {
//        print("$NativeAd event $event");
//      },
//    );
//  }

  @override
  void initState() {
    super.initState();
//    FirebaseAdMob.instance.initialize(appId: 'ca-app-pub-1538436350920374~9868786706');
//    _bannerAd = createBannerAd()..load()..show();

//    RewardedVideoAd.instance.listener =
//        (RewardedVideoAdEvent event, {String rewardType, int rewardAmount}) {
//      print("RewardedVideoAd event $event");
//      if (event == RewardedVideoAdEvent.rewarded) {
//        setState(() {
//          _coins += rewardAmount;
//        });
//      }
    //   };

    //   WidgetsBinding.instance.addPostFrameCallback((_)=>print('jjj'));
    // checkinternet();


  }

  checkinternet() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print('connected');
        setState(() {
          isconnected=true;
        });
      }
    } on SocketException catch (_) {
      print('not connected');
      setState(() {
        isconnected=false;
      });
    }
  }

//  @override
//  void dispose() {
//    _bannerAd?.dispose();
//   // _nativeAd?.dispose();
//    _interstitialAd?.dispose();
//    super.dispose();
//  }






  getaccestoken() async {
    EasyLoading.show(status: 'loading...', maskType: EasyLoadingMaskType.black,);
    print(isconnected);
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print('connected');
        print('jjj');
        SharedPreferences prefs = await SharedPreferences.getInstance();
        //Return String
        print('jjj');
        String stringValue = prefs.getString('access_token');
        if (stringValue == null) {
          EasyLoading.dismiss();
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) =>
                  LoginScreen()), (Route<dynamic> route) => false);
        } else if (stringValue == '') {
          EasyLoading.dismiss();
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) =>
                  LoginScreen()), (Route<dynamic> route) => false);
        } else {
          EasyLoading.dismiss();
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) =>
                  TabNavigatorScreen(currenttabid: 0,)), (Route<dynamic> route) => false);
        }
      }
    } on SocketException catch (_) {
      print('not connected');
      EasyLoading.dismiss();
      showDialog(
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return AlertDialog(
            title: new Text("Internet Problum"),
            content: new Text('Please check your internet connection'),
            actions: <Widget>[
              // usually buttons at the bottom of the dialog
              new FlatButton(
                child: new Text("Close"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        body:Column(
          children: <Widget>[
            ClipPath(
              clipper: BorderClipper(),
              child: Container(
                width: double.infinity,
                height: 75.5 * SizeConfig.heightMultiplier,
                child: Stack(
                  children: <Widget>[

                    Positioned(
                      left: -40,
                      top:-0,
                      bottom:0,
                      child:
                      Image.asset(
                        "assets/images/banner2.png",
                        fit: BoxFit.cover,
                        width: 700,
                        height: 400,

                      ),
                    ),
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: Container(
                        width: double.infinity,
                        height: 340,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [
                                  kPrimaryColor.withOpacity(0.8),
                                  kPrimaryColor.withOpacity(0.05),

                                ],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter
                            )
                        ),
                      ),
                    ),
                    Positioned(
                      top:40*SizeConfig.heightMultiplier,
                      right: 40,
                      child: Text(
                        'NXT',
                        style: TextStyle(
                          fontSize: 50,
                          color: Colors.white,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w900
                        ),
                      ),
                    ),
                    Positioned(
                      top:46*SizeConfig.heightMultiplier,
                      right: 40,
                      child: Text(
                        'FOOD',
                        style: TextStyle(
                            fontSize: 50,
                            color: Colors.white,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w900
                        ),
                      ),
                    )


                  ],
                ),
              ) ,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 32.0),
                  child:   RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text:"Food",
                            style: TextStyle(
                                fontSize: 33,
                                color: Colors.black,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w900
                            )

                        ),
                        TextSpan(
                            text:" Express",
                            style: TextStyle(
                                fontSize: 26,
                                color: Colors.black,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w300
                            )

                        )
                      ],

                    ),

                  ),
                ),
                GestureDetector(
                  onTap: (){
                    getaccestoken();
                    //Navigator.of(context).push(_createRoute());
                  },
                  child:  OnBoardingButton(),
                )

              ],
            )

          ],
        )

    );

  }


}


Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => LoginScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(0.0, 1.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween = Tween(begin: begin, end: end);
        var curvedAnimation = CurvedAnimation(
          parent: animation,
          curve: curve,
        );

        return SlideTransition(
          position: tween.animate(curvedAnimation),
          child: child,
        );
      }
  );
}

