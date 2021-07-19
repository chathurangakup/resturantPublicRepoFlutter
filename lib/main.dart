
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_it/get_it.dart';
import 'package:resturantapp/screens/TabNavigatorScreen.dart';
import 'package:resturantapp/screens/details/details_screen.dart';
import 'package:resturantapp/screens/home/homescreen.dart';
import 'package:resturantapp/screens/login/loginscreen.dart';
import 'package:flutter/material.dart';
import 'package:resturantapp/screens/signup/signupscreen.dart';
import 'package:resturantapp/screens/splash/splashscreen.dart';
import 'package:resturantapp/services/address_services.dart';
import 'package:resturantapp/services/cart_services.dart';
import 'package:resturantapp/services/datetime_services.dart';
import 'package:resturantapp/services/favourite_services.dart';
import 'package:resturantapp/services/item_services.dart';
import 'package:resturantapp/services/profile_services.dart';
import 'package:resturantapp/services/startup_services.dart';

import 'config/size_config.dart';

void setupLocator(){
  GetIt.instance.registerLazySingleton(() => ItemServices());
  GetIt.instance.registerLazySingleton(() => StartupServeces());
  GetIt.instance.registerLazySingleton(() => AddressServeces());
  GetIt.instance.registerLazySingleton(() => FavouriteServeces());
  GetIt.instance.registerLazySingleton(() => ProfileServeces());
  GetIt.instance.registerLazySingleton(() => DateTimeServeces());
  GetIt.instance.registerLazySingleton(() => CartServeces());

}


void main(){
    setupLocator();
    runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return   LayoutBuilder(
        builder: (context,constraints){
          return OrientationBuilder(
              builder: (context,orientation){
                SizeConfig().init(constraints, orientation);
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  title:"Mithuruthuru",
                  home:SplashScreen(),
                  builder: EasyLoading.init(),
                  routes: {


                      SplashScreen.id: (context)=>SplashScreen(),
                      LoginScreen.id: (context)=>LoginScreen(),
                      SignupScreen.id: (context) => SignupScreen(),
//                    FogetPasswordScreen.id: (context) => FogetPasswordScreen(),
//                    VefifictionCodeScreen.id: (context) => VefifictionCodeScreen(),
//                    CreatePasswordScreen.id: (context) => CreatePasswordScreen(),

                      //   TabNavigatorScreen.id: (context) => TabNavigatorScreen(),

                  },



                );

              }

          );


        }
    );



//    return MaterialApp(
//      title: 'Flutter Demo',
//      theme: ThemeData(
//        primarySwatch: Colors.blue,
//      ),
//      home: WorkListScreen(),
//    );
  }
}

