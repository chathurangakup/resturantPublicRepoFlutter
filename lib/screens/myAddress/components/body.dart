import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_it/get_it.dart';
import 'package:resturantapp/models/addressmodels/addressmodels.dart';
import 'package:resturantapp/models/api_responce.dart';
import 'package:resturantapp/models/commonmodels/addressbodymodel.dart';
import 'package:resturantapp/screens/myAddress/components/address_card.dart';
import 'package:resturantapp/screens/myAddress/components/address_card_default.dart';
import 'package:resturantapp/screens/myAddress/components/addressbtn.dart';
import 'package:resturantapp/screens/myAddress/components/myaddressheader.dart';
import 'package:resturantapp/services/address_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  AddressServeces get addressServices => GetIt.I<AddressServeces>();
  ApiResponse<List<GetAllAddressModel>> _apiResponce=null;
  String address;




  void getData() async {
//      ItemCategory itemCategory=ItemCategory("hh",'sds','dad',67,7);
    EasyLoading.show(status: 'loading...', maskType: EasyLoadingMaskType.black,);
    try{

      SharedPreferences prefs = await SharedPreferences.getInstance();
      String token = prefs.getString('access_token');
      String userid = prefs.getString('userid');

      await addressServices.getAllAddress(token, userid).then((response){

        print(response);
        if(response==null){
          EasyLoading.dismiss();
        }else{
          print("_apiResponce.data[0].itemName ");
          setState(() {
            _apiResponce=response;
          });

          EasyLoading.dismiss();
        }


      });
    }on Exception  catch (_) {

    }
  }



  _addressApi() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userid = prefs.getString('userid');
    final addressbody = AddressbodyModel(
        userid: userid,
        address: address
    );
    EasyLoading.show(status: 'loading...', maskType: EasyLoadingMaskType.black,);
    try {
      await addressServices.addAddress(addressbody).then((response) {
        print(response.data);
        if(response.data.result=="Success"){

          getData();
          EasyLoading.dismiss();
        }


      });

    }on Exception catch (_) {
      EasyLoading.dismiss();
    }
  }


  pressDefault(addressid) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('access_token');
    String userid = prefs.getString('userid');

    EasyLoading.show(status: 'loading...', maskType: EasyLoadingMaskType.black,);
    try {
      await addressServices.updateDefault(token,userid,addressid).then((response) {
        print(response.data);
        if(response.data.result=="success"){

          getData();
          EasyLoading.dismiss();
        }


      });

    }on Exception catch (_) {
      EasyLoading.dismiss();
    }

  }

  pressDelete(addressid) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('access_token');

    EasyLoading.show(status: 'loading...', maskType: EasyLoadingMaskType.black,);
    try {
      await addressServices.deleteAddress(token,addressid).then((response) {
        print(response.data);
        if(response.data.result=="success"){

          getData();
          EasyLoading.dismiss();
        }


      });

    }on Exception catch (_) {
      EasyLoading.dismiss();
    }

  }



  clickNewAddressBtn(){
    Navigator.pop(context);
    if(address!=null){
      _addressApi();
    }else{
      print('address empty');
    }

  }

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    super.initState();
    getData();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  _showMaterialDialog() {
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
                        child: Text("Add new Address"),
                      ),

                      Card(
                          color: Colors.white70,
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: TextField(
                              onChanged: (text) {
                               this.setState((){
                                 address=text;
                               });
                              },
                              maxLines: 8,
                              decoration: InputDecoration.collapsed(hintText: "Enter your text here"),
                            ),
                          )
                      ),

                      SizedBox(height: 30),
                      FlatButton(
                      shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.red)),
                           color: Colors.white,
                           textColor: Colors.red,
                          padding: EdgeInsets.all(8.0),
                           onPressed: () { this.clickNewAddressBtn();},
                             child: Text(
                               "Add New Address".toUpperCase(),
                            style: TextStyle(
                            fontSize: 14.0,
                        ),
                       ),
                      ),


                      SizedBox(height: 10),
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
    return Column(
      children: <Widget>[
        MyAddressHeader(),
        AddAddressBtn(
            press:(){
              _showMaterialDialog();
            }
        ),
        Expanded(

          child: GridView.builder(

              itemCount: _apiResponce!=null? _apiResponce.data.length:0,
              gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  mainAxisSpacing: 0,
                  childAspectRatio: 2.55
              ),
              itemBuilder: (context,index)=>
         _apiResponce!=null?
             _apiResponce.data[index].isdefault==true?
             AddressCardDefault(
               addressname:_apiResponce!=null? _apiResponce.data[index].address:'' ,
               presssSetDefault:(){},
               presssDelete: (){},
             )
            :

             AddressCard(
                addressname:_apiResponce!=null? _apiResponce.data[index].address:'' ,
                presssSetDefault:(){
                  this.pressDefault(_apiResponce.data[index].addressid);
                },
                presssDelete: (){
                  this.pressDelete(_apiResponce.data[index].addressid);
                },
              )

            :
            Text('jj')


          ),
        )

      ],
    );


  }
}



