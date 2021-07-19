import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:resturantapp/config/size_config.dart';
import 'package:resturantapp/constants.dart';
import 'package:resturantapp/models/api_responce.dart';
import 'package:resturantapp/models/commonmodels/addressbodymodel.dart';
import 'package:resturantapp/models/loginmodels/loginbodymodel.dart';
import 'package:resturantapp/models/signupmodels/signupbody.dart';
import 'package:resturantapp/models/signupmodels/signupmodel.dart';
import 'package:resturantapp/screens/TabNavigatorScreen.dart';
import 'package:resturantapp/screens/components/formtxtinput.dart';
import 'package:resturantapp/screens/components/passwordtextInput.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:resturantapp/services/address_services.dart';
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
  StartupServeces get signupServices => GetIt.I<StartupServeces>();
  AddressServeces get addressServices => GetIt.I<AddressServeces>();
  ApiResponse<SignUpModel> result;
  final _formkey=GlobalKey<FormState>();
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();
  String email,password,confirmpassword,firstname,lastname,address,phoneno;
  bool isLoading =false;
  bool  passwordVisible =false;
  bool  conpasswordVisible =false;


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


  _clickSignup() async {

    if (_formkey.currentState.validate()) {
      _formkey.currentState.save();

       final DateTime now = DateTime.now();
       final DateFormat formatter = DateFormat('yyyy/MM/dd');
      final String formatted = formatter.format(now);

      final signupbody = SignupbodyModel(
        firstName: firstname,
        lastName: lastname,
        phoneno: phoneno,
        password: password,
        email: email,
        date: formatted


      );
      EasyLoading.show(status: 'loading...', maskType: EasyLoadingMaskType.black,);

      try {
        await signupServices.signupFromEmail(signupbody).then((response) {
          print(response.data.userid);
          if(response.data.status=='exists'){
            EasyLoading.dismiss();
          }else{




              _addressApi() async{
                final addressbody = AddressbodyModel(
                    userid: response.data.userid,
                    address: address
                );
                try {
                  await addressServices.addAddress(addressbody).then((response) {
                        print(response.data);
                          if(response.data.result=="Success"){

                            _loginApi() async{
                              try {
                                final loginbody = LoginbodyModel(
                                  email: email,
                                  password: password,
                                );
                                await signupServices.userLogin(loginbody).then((response) {
                                  print(response.data.result);
                                  if(response.data.result=='error'){
                                    print(response.data.result);
                                    EasyLoading.dismiss();
                                  }else{
                                    print(response.data.result);
                                    EasyLoading.dismiss();
                                    _save(response.data.token,response.data.userid);
                                  }
                                  //EasyLoading.dismiss();
                                });
                              } on Exception catch (_) {
                                EasyLoading.dismiss();
                              }

                            }
                            _loginApi();

                          }





                  });


                }on Exception catch (_) {
                  EasyLoading.dismiss();
                }
              }
              _addressApi();




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
    return  Form(
      key:_formkey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
//          isLoading ?
//          Center(child:CircularProgressIndicator(
//            valueColor: new AlwaysStoppedAnimation<Color>(Colors.green),
//          ))
//              :
//          SizedBox.shrink(),

          FormTextInput(
            lblText: "First Name",
            validator: (input){
              if(input.isEmpty){
                return  'Please enter first name';
              }
              return null;
            },
            onSave: (input)=> firstname = input,


          ),



          FormTextInput(
            lblText: "Last Name",
            validator: (input){
              if(input.isEmpty){
                return  'Please enter ladt name';
              }
              return null;
            },
            onSave: (input)=> lastname = input,


          ),


          FormTextInput(
            lblText: "Address",
            validator: (input){
              if(input.isEmpty){
                return  'Please enter address';
              }
              return null;

            },
            onSave: (input)=> address = input,


          ),



          FormTextInput(
            lblText: "Email",

            textinputtype:TextInputType.emailAddress,
            validator: (input){
              if(input.isEmpty || !input.contains('@')){
                return  'Please enter valid email';
              }
              return null;
            },
            onSave: (input)=> email = input,


          ),



          FormTextInput(
            textinputtype:TextInputType.number,
            lblText: "Phone no",
            validator: (input){
              if(input.isEmpty){
                return  'Please enter phone no';
              }
              return null;
            },

            onSave: (input)=> phoneno = input,


          ),


          PasswordTextInput(

            controller: _pass,
            passwordVisible: passwordVisible,
            lblName: "Password",
            OnSaved: (input) =>  password = input,
            OnPress: () {
              setState(() {
                this.passwordVisible = !this.passwordVisible;
              });
            },
            validation: (input){
              if(input.length<6){
                return "Please enter more 6";
              }
              return null;
            },

          ),


          PasswordTextInput(
            passwordVisible: conpasswordVisible,
            lblName: "Confirm Password",

            OnSaved: (input) =>  confirmpassword = input,
            OnPress: (){
              setState(() {
                this.conpasswordVisible = !this.conpasswordVisible;
              });
            },
            validation: (input){
              if(input.length<6){
                return "Please enter more 6";
              }else if(input != _pass.text){
                return "password not match";
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
                _clickSignup();
              },
              shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(18.0),
                  side: BorderSide(color: kPrimaryColor)
              ),
              color: kPrimaryColor,
              child: Text('Sign Up',
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
                  Text('Already have an account',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.black,
                    ),),


                  FlatButton(
                    onPressed: ()=>
                    { print('jjj')},
                    child: Text('Login',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.black,


                      ),),
                    textColor: Colors.white,

                  ),
                ],
              )


          ),

          SizedBox(height:  1.5 * SizeConfig.textMultiplier),

        ],
      ),
    );
  }

}

