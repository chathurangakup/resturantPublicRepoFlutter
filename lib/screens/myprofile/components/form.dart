import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_it/get_it.dart';
import 'package:resturantapp/config/size_config.dart';
import 'package:resturantapp/models/api_responce.dart';
import 'package:resturantapp/models/profilemodels/UserDetailsModel.dart';
import 'package:resturantapp/models/profilemodels/profileUpdateBodyModel.dart';
import 'package:resturantapp/screens/components/formtxtinput.dart';
import 'package:resturantapp/screens/components/passwordtextInput.dart';
import 'package:resturantapp/services/profile_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constants.dart';

class FormPart extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return FormPartState();
  }
}


class FormPartState extends State<FormPart>{
  ProfileServeces get prodileServices => GetIt.I<ProfileServeces>();
  ApiResponse<UderDetailsModel> _apiResponce;
  final _formkey=GlobalKey<FormState>();
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();
  String email,password,confirmpassword,firstname,lastname,address,phoneno;
  bool isLoading =false;
  bool  passwordVisible =false;
  bool  conpasswordVisible =false;






  Future<ApiResponse<UderDetailsModel>> getData() async {
//      ItemCategory itemCategory=ItemCategory("hh",'sds','dad',67,7);
    EasyLoading.show(status: 'loading...', maskType: EasyLoadingMaskType.black,);
    try{

      SharedPreferences prefs = await SharedPreferences.getInstance();
      String token = prefs.getString('access_token');
      String userid = prefs.getString('userid');

      await prodileServices.getUserDetails(token, userid).then((response){

        print(response);
        if(response==null){
          EasyLoading.dismiss();
        }else{
          print("_apiResponce.data[0].itemName ");
          setState(() {
            _apiResponce=response;
            email=response.data.email;
            firstname=response.data.firstname;
            lastname=response.data.lastName;
            address=response.data.addresses;
            phoneno=response.data.phoneno;
          });
          EasyLoading.dismiss();
        }

        return _apiResponce;
      });
    }on Exception  catch (_) {

    }
  }



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    setState(() {
      _apiResponce=_apiResponce;
    });
  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }


  _clickUpdate() async{
    print(firstname);
    print(lastname);
    print(phoneno);

    if (_formkey.currentState.validate()) {
      _formkey.currentState.save();

      SharedPreferences prefs = await SharedPreferences.getInstance();
      String token = prefs.getString('access_token');
      String userid = prefs.getString('userid');


       try{
         final profileupdatebody = ProfileUpdatebodyModel(
           userid:userid,
           firstName: firstname,
           lastName: lastname,
           phoneno: phoneno,
           password: password,
         );
         EasyLoading.show(status: 'loading...', maskType: EasyLoadingMaskType.black,);

         await prodileServices.updateProfile( token,  profileupdatebody).then((response) {

          if (response.data.result == 'success') {
            getData();
            EasyLoading.dismiss();
          } else {

            EasyLoading.dismiss();
           }
          });
       }on Exception catch (_) {
                EasyLoading.dismiss();
       }




          }



          //EasyLoading.dismiss();



  }


  @override
  Widget build(BuildContext context) {


    return   Form(
      key:_formkey,
      child: Column(
        // mainAxisSize: MainAxisSize.min,
        children: <Widget>[

          FormTextInput(
            lblText: "First Name",
            initialValue: _apiResponce!=null?  _apiResponce.data.firstname:'',
            isenable:true,
            validator: (input){
              if(input.isEmpty){
                return  'Please enter first name';
              }
              return null;
            },
            onSave: (input)=> firstname = input,
            onChange:(input)=>firstname=input,
          ),



          FormTextInput(
            lblText: "Last Name",
            isenable:true,
            initialValue: _apiResponce!=null? _apiResponce.data.lastName:'',
            validator: (input){
              if(input.isEmpty){
                return  'Please enter ladt name';
              }
              return null;
            },
            onSave: (input)=> lastname = input,
            onChange:(input)=>lastname=input,

          ),


          FormTextInput(
            lblText: "Address",
            isenable:false,
            initialValue:_apiResponce!=null? _apiResponce.data.addresses:'' ,
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
            isenable:false,
            textinputtype:TextInputType.emailAddress,
            initialValue:_apiResponce!=null?  _apiResponce.data.email:'',
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
            isenable:true,
            initialValue:_apiResponce!=null?  _apiResponce.data.phoneno:'hh',
            validator: (input){
              if(input.isEmpty){
                return  'Please enter phone no';
              }
              return null;
            },

            onChange:(input)=>phoneno=input,
            onSave: (input)=> phoneno = input,


          ),


          PasswordTextInput(

            controller: _pass,
            passwordVisible: passwordVisible,
            lblName: "Password",
            onChange:(input)=>password=input,
            OnSaved: (input) =>  password = input,
            OnPress: () {
//                       setState(() {
//                         this.passwordVisible = !this.passwordVisible;
//                       });
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
            onChange:(input)=>confirmpassword=input,
            OnSaved: (input) =>  confirmpassword = input,
            OnPress: (){
//                       setState(() {
//                         this.conpasswordVisible = !this.conpasswordVisible;
//                       });
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
                 _clickUpdate();
              },
              shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(18.0),
                  side: BorderSide(color: kPrimaryColor)
              ),
              color: kPrimaryColor,
              child: Text('Update',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                ),),
              textColor: Colors.white,
            ),
          ),

          // SizedBox(height: 30.5 * SizeConfig.textMultiplier),


        ],
      ),
    );
  }

}