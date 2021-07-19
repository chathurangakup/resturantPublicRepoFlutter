import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_it/get_it.dart';
import 'package:resturantapp/config/size_config.dart';
import 'package:resturantapp/constants.dart';
import 'package:resturantapp/models/loginmodels/loginbodymodel.dart';
import 'package:resturantapp/screens/TabNavigatorScreen.dart';
import 'package:resturantapp/screens/components/formtxtinput.dart';
import 'package:resturantapp/screens/components/passwordtextInput.dart';
import 'package:resturantapp/screens/signup/signupscreen.dart';
import 'package:resturantapp/services/startup_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FormPart extends StatefulWidget{


  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return FormPartState();
  }

}


class FormPartState extends State<FormPart>{
  final _formkey=GlobalKey<FormState>();

  StartupServeces get startupServices => GetIt.I<StartupServeces>();
  String email,password;
  bool isLoading =false;
  bool  passwordVisible =false;


  _save(String token,String userId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('access_token', token);
    prefs.setString('userid', userId);

    if(token!=null){
      // Navigator.pushNamed(context, TabNavigatorScreen.id);
      EasyLoading.dismiss();
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
          TabNavigatorScreen(currenttabid: 0,)), (Route<dynamic> route) => false);
    }
  }

  _clickLogin() async {
    if (_formkey.currentState.validate()) {
       _formkey.currentState.save();

       final loginbody = LoginbodyModel(
           email: email,
           password: password,

       );
       EasyLoading.show(status: 'loading...', maskType: EasyLoadingMaskType.black,);


       try {
         print(loginbody.email);
         print(loginbody.password);
         await startupServices.userLogin(loginbody).then((response) {
           print(response.data.result);
           if(response.data.result=='error'){
             print(response.data.result);
//             _scaffoldKey.currentState.showSnackBar(
//                 SnackBar(
//                   content: new Text('Error:'),
//                   duration: new Duration(seconds: 10),
//                 )
//             );
             EasyLoading.dismiss();
           }else{
             _save(response.data.token,response.data.userid);
             print(response.data.result);

           }



           //EasyLoading.dismiss();
         });
       } on Exception catch (_) {
         EasyLoading.dismiss();
       }



  }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   //
    return  Form(
      key:_formkey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          isLoading ?
          Center(child:CircularProgressIndicator(
            valueColor: new AlwaysStoppedAnimation<Color>(Colors.green),
          ))
              :
          SizedBox.shrink(),
          FormTextInput(
            lblText: "Email",
            validator: (input){
              if(input.isEmpty || !input.contains('@')){
                return  'Please enter valid email';
              }
              return null;
            },
            onSave: (input)=> email = input,


          ),


          PasswordTextInput(
            passwordVisible: true,
            lblName: "Password",

            OnSaved: (input) =>  password = input,
            OnPress: (){

            },
            validation: (input){
              if(input.isEmpty){
                return "Empty password";
              }else if( input.length<6){
                return "Please enter more 6";
              }
              return null;
            },

          ),

          SizedBox(height: 2.5 * SizeConfig.textMultiplier),

          Container(
            width: 250.0,
            height: 6.5* SizeConfig.heightMultiplier,
            child:    FlatButton(
              onPressed: (){
                _clickLogin();
              },
              shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(18.0),
                  side: BorderSide(color: kPrimaryColor)
              ),
              color: kPrimaryColor,
              child: Text('Login',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                ),),
              textColor: Colors.white,
            ),
          ),

          //SizedBox(height:  1.5 * SizeConfig.textMultiplier),

          Container(

              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Do not have an account?',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.black,
                    ),),


                  FlatButton(
                    onPressed: ()=>
                    {
                      Navigator.of(context).push(_createRoute())
                    },
                    child: Text('Sign Up',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.black,


                      ),),
                    textColor: Colors.white,

                  ),
                ],
              )


          ),


          Container(
            width: 250.0,
            child:    FlatButton(
              onPressed: ()=> {},

              child: Text('Foget Password?',
                style: TextStyle(
                  fontSize:  2.5 * SizeConfig.textMultiplier,
                  color: Colors.black,


                ),
              ),
              textColor: Colors.black,

            ),
          ),

//          Container(
//            width: 250.0,
//            child:    FlatButton(
//              onPressed: ()=> {
//                Navigator.of(context).pushAndRemoveUntil(
//                    MaterialPageRoute(builder: (context) =>
//                        TabNavigatorScreen(currenttabid: 0,)), (Route<dynamic> route) => false)
//              },
//
//              child: Text('Guest Login',
//                style: TextStyle(
//                  fontSize:  2.5 * SizeConfig.textMultiplier,
//                  color: kPrimaryColor,
//
//
//                ),
//              ),
//              textColor: Colors.black,
//
//            ),
//          )


        ],
      ),
    );
  }

}//end




Route _createRoute() {
  return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => SignupScreen(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(0.0, 1.0);
      var end = Offset.zero;
      var tween = Tween(begin: begin, end: end);
      var offsetAnimation = animation.drive(tween);
      return child;
    },
  );
}