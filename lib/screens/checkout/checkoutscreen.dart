import 'dart:convert';
import 'dart:developer';


import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:resturantapp/config/size_config.dart';
import 'package:resturantapp/models/api_responce.dart';
import 'package:resturantapp/models/cartmodel/cartbodymodel.dart';
import 'package:resturantapp/models/datetimemodel/datetimemodel.dart';
import 'package:resturantapp/models/profilemodels/profileUpdateBodyModel.dart';
import 'package:resturantapp/models/sqlite/itemcatwithvarient.dart';
import 'package:resturantapp/models/sqlite/varientssql.dart';
import 'package:resturantapp/screens/TabNavigatorScreen.dart';

import 'package:resturantapp/screens/checkout/component/bottom_tab.dart';

import 'package:resturantapp/screens/myAddress/myaddress_screen.dart';
import 'package:resturantapp/screens/ordercomplete/ordercomplete_screen.dart';
import 'package:resturantapp/services/cart_services.dart';
import 'package:resturantapp/services/datetime_services.dart';
import 'package:resturantapp/services/datetime_services.dart';
import 'package:resturantapp/services/datetime_services.dart';
import 'package:resturantapp/services/datetime_services.dart';
import 'package:resturantapp/services/datetime_services.dart';
import 'package:resturantapp/services/profile_services.dart';
import 'package:resturantapp/utils/database_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants.dart';
import 'component/address_card_checkout.dart';
import 'component/checkout_item.dart';

class CheckoutScreen extends StatefulWidget{
   final List<ItemCatVarientListModel> itemlist;
   const CheckoutScreen({
     Key key,
     this.itemlist,
}):super(key:key);


  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CheckoutScreenState();
  }

}


class CheckoutScreenState extends State<CheckoutScreen>{
  ProfileServeces get prodileServices => GetIt.I<ProfileServeces>();
  DateTimeServeces get dateTimeServeces => GetIt.I<DateTimeServeces>();
  CartServeces get cartServeces => GetIt.I<CartServeces>();
  DatabaseHelper databaseHelper=DatabaseHelper();
  List<ItemCatVarientListModel> itemcatList;
  ApiResponse<List<DateTimeModel>> _apiResponcedatetimeList=null;
  String status="Delivery";
  String address="";
  double subtotprice=0.00;
  int _index = 0;
  bool isTimeCorrect=true;
  bool isClosed=false;
  String currentTime=  DateFormat('kk:mm').format(DateTime.now());
  String orderTime=  DateFormat('kk:mm').format(DateTime.now());
  bool isCallfirsttime=false;

  static int changeval =0;


  @override
  void initState() {
  if(isCallfirsttime==false){
      setState(() {
        isCallfirsttime=true;
      });
      getDataApi();
  }else{

  }
  getData();

  }

  _showMaterialDialog(context,text) {
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
                        child: Text(text,style:TextStyle(fontSize: SizeConfig.textMultiplier*3)),
                      ),


                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[



//                          FlatButton(
//                            shape: RoundedRectangleBorder(
//                                borderRadius: BorderRadius.circular(18.0),
//                                side: BorderSide(color: Colors.white)),
//                            color: Colors.white,
//                            textColor: Colors.black,
//                            padding: EdgeInsets.all(8.0),
//                            onPressed: () {Navigator.pop(context);},
//                            child: Text(
//                              "Cancel".toUpperCase(),
//                              style: TextStyle(
//                                fontSize: 14.0,
//                              ),
//                            ),
//                          ),
                          SizedBox(width: SizeConfig.imageSizemultiplier*25),
                          FlatButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: BorderSide(color: Colors.red)),
                            color: Colors.white,
                            textColor: Colors.red,
                            padding: EdgeInsets.all(8.0),
                            onPressed: () {Navigator.pop(context);},
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




//  @override
//  void didUpdateWidget(CheckoutScreen oldWidget) {
//    // TODO: implement didUpdateWidget
//    super.didUpdateWidget(oldWidget);
//    if(this.widget.itemlist!=oldWidget.itemlist){
//
//      getallSqliteTavle();
//
//    }
//  }
//



//  Future<ApiResponse<UderDetailsModel>> getData() async {
////      ItemCategory itemCategory=ItemCategory("hh",'sds','dad',67,7);
//    EasyLoading.show(status: 'loading...', maskType: EasyLoadingMaskType.black,);
//    try{
//
//      SharedPreferences prefs = await SharedPreferences.getInstance();
//      String token = prefs.getString('access_token');
//      String userid = prefs.getString('userid');
//
//
//  }


void getDataApi() async{
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
          address=response.data.addresses;

        });
        EasyLoading.dismiss();
      }


    });
  }on Exception  catch (_) {

  }


  try{

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('access_token');
    String userid = prefs.getString('userid');
    await dateTimeServeces.getDateTime().then((response){
      setState(() {
        _apiResponcedatetimeList=response;
      });
      print(response);
      if(response==null){
        EasyLoading.dismiss();
      }else{
        final now = new DateTime.now();
        debugPrint(DateFormat( 'd' ).format(now)) ;
        for(var item in _apiResponcedatetimeList.data ){
          debugPrint(item.dayname);
          if(DateFormat( 'EEEE' ).format(now)==item.dayname){
            print('Success');
            print(item.status);
            if(item.status=='Close'){
              String text="Today We are closed.";
              _showMaterialDialog(context,text);
              setState(() {
                isClosed=true;
              });
            }else{
              setState(() {
                isClosed=false;
              });

            }

          }
        }


        EasyLoading.dismiss();
      }


    });
  }on Exception  catch (_) {

  }
}

  void getData() async {
    subtotprice=0.0;
   // List<ItemCatVarientListModel> itemcatListData = databaseHelper.getWithItemcatVarientList();

//    List<Varient>.from(
//        json.decode(str).map((x) => Varient.fromJson(x)));

//    itemcatListData.then((itemList) {
//      setState(() {
//         itemcatList = itemList;
//      });
//    });


    List<ItemCatVarientListModel> itemcatListData1 =await  databaseHelper.getWithItemcatVarientList();

    print("itemcatList djhsdjahj");

    setState(() {
         itemcatList = itemcatListData1;
     });

   // print(itemcatList[1].varients);
    print(itemcatListData1);
    if (itemcatListData1 != null) {
      for (int i = 0; i < itemcatListData1.length; i++) {
        print("itemcatList[i].image");
        print(itemcatList[i].image);
      }
    }

    print("dhhdhdhd");
    for(int i=0;i<itemcatListData1.length;i++){

      setState(() {
        subtotprice=itemcatListData1[i].totprice+subtotprice;
      });
    }

  }

  changeStatus(){
    if(status=='Delivery'){
      setState(() {
        status="Takeaway";
      });
    }else{
      setState(() {
        status="Delivery";
      });
    }

  }

//  void getallSqliteTavle() async{
//    List<ItemCatVarientListModel> itemcatListData =await  databaseHelper.getWithItemcatVarientList();
//    print("dhhdhdhd");
//    for(int i=0;i<itemcatListData.length;i++){
//
//      setState(() {
//        subtotprice=itemcatListData[i].totprice+subtotprice;
//      });
//    }
//  }


  deleteItem(id) async{
    int result =await  databaseHelper.deleteItemCat(id);

    if(result!=0){

      int result1 =await  databaseHelper.deleteVarient(id);
      if(result1!=0){
        print('Deleted');
      }
      getData();
    }else{
      print('Not Deleted');
    }
  }

  pressPlus(double totprice,int qty,int id) async{
    double newtotprice =(totprice/qty)*(qty+1);
    int updateitemcat = await  databaseHelper.updateItemCat(newtotprice,qty+1,id);
    if(updateitemcat!=0){
      print("Success");
      getData();
    }else{
      print("errror");
      print(updateitemcat);
    }
  }

  pressMinus(double totprice,int qty,int id) async{
    if(qty<=1){

    }else{
      double newtotprice =(totprice/qty)*(qty-1);
      int updateitemcat = await  databaseHelper.updateItemCat(newtotprice,qty-1,id);
      if(updateitemcat!=0){
        print("Success");
        getData();
      }else{
        print("errror");
        print(updateitemcat);
      }
    }

  }

selectTime(time){

    String nowTime = DateFormat('kk:mm').format(DateTime.now());
    String nowHours = DateFormat('kk').format(DateTime.now());
    String nowMinutes = DateFormat('mm').format(DateTime.now());

    var myNowH = int.parse(nowHours);
    var myNowMin = int.parse(nowMinutes);
    debugPrint(myNowH.toString());
    debugPrint(myNowMin.toString());


    String selectTime= DateFormat('kk:mm').format(time);
    String selectHours = DateFormat('kk').format(time);
    String selectMinutes = DateFormat('mm').format(time);

    var mySelectH = int.parse(selectHours);
    var mySelectMin = int.parse(selectMinutes);

    debugPrint(mySelectH.toString());
    debugPrint(mySelectMin.toString());

    if(myNowH<=mySelectH){

          if(myNowH==mySelectH){
            if(myNowMin>mySelectMin){
              print('Wrong can order yyy');
              setState(() {
                isTimeCorrect=false;

              });



            }else{
              print('Correct can order yyy');
              setState(() {
                isTimeCorrect=true;
                currentTime=selectTime;
              });
            }
          }else{
              print('Correct can order xxx');
              setState(() {
                isTimeCorrect=true;
                currentTime=selectTime;
              });
          }


    }else{
      print('Wrong can order');
      setState(() {
        isTimeCorrect=false;
      });
    }



}


  clickOrderBtn() async{
      debugPrint('kkk');
      DateTime now = new DateTime.now();
      var formatter = new DateFormat('yyyy-MM-dd');
      String formattedDate = formatter.format(now);
      debugPrint(formattedDate);

      SharedPreferences prefs = await SharedPreferences.getInstance();
      String token = prefs.getString('access_token');
      String userid1 = prefs.getString('userid');
    //  final listview = <ItemCatVarientListModel>[];


      String randomExpensesToJson(List<Varient> data) =>
          json.encode(List<dynamic>.from(data.map((x) => x.toJson())));



//
//      String allitemListToJson(List<ItemCatVarientListModel1> data) =>
//          json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
//
//      List<ItemCatVarientListModel1> randomExpensesFromJson(String str) =>
//          List<ItemCatVarientListModel1>.from(
//              json.decode(str).map((x) => ItemCatVarientListModel1.fromJson(x)));

     // randomExpensesFromJson(itemcatList);


      final cartbody = CartbodyModel(
          userid:userid1,
          cartitems: itemcatList,
          type:status,
          address:address,
          totalprice:subtotprice.toString(),
          date:formattedDate,
          time:currentTime,
          ordertime:orderTime
      );
     // print( allitemListToJson(listview));





      EasyLoading.show(status: 'loading...', maskType: EasyLoadingMaskType.black,);
      if(isClosed==false){

        if(status=="Takeaway"){
           if(isTimeCorrect==true){
             try{
               await cartServeces.addtocart(token,cartbody).then((response){
                  if(response.data.result=='Success'){
                    EasyLoading.dismiss();
                     storeAccess() async{
                       int deleteItemTable =await databaseHelper.deleteItemCatTable();
                       int deletevarTable =await databaseHelper.deleteVarientTable();
                       print(deleteItemTable);
                       print(deletevarTable);
                     }
                    storeAccess();


                    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                         OrderCompleteScreen()), (Route<dynamic> route) => false);
                  }
                  print(response.data.result);

               });
             }on Exception  catch (_) {

             }


           }else{
                 print("ADD SURTABL TIME");
                 String text="Time error";
                 _showMaterialDialog(context,text);
                 EasyLoading.dismiss();
             }

        }else{


          try{
            await cartServeces.addtocart(token,cartbody).then((response){
              EasyLoading.dismiss();
              if(response.data.result=='Success'){
                EasyLoading.dismiss();
                storeAccess() async{
                  int deleteItemTable =await databaseHelper.deleteItemCatTable();
                  int deletevarTable =await databaseHelper.deleteVarientTable();
                  print(deleteItemTable);
                  print(deletevarTable);
                }
                storeAccess();
                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                    OrderCompleteScreen()), (Route<dynamic> route) => false);
              }
              print(response.data.result);

            });
          }on Exception  catch (_) {

          }


        }

      }else {
        print("closed today TIME");
        String text="We are closed today";
        _showMaterialDialog(context,text);
        EasyLoading.dismiss();
      }



  }



  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    final format = DateFormat("hh:mm a");
      return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: kPrimaryColor,
          title: new Padding(
            padding: EdgeInsets.only(left: SizeConfig.imageSizemultiplier*15.5),
            child: Text('Checkout'),
          ),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: (){
//            Navigator.push(
//                context,
//                // Create the SelectionScreen in the next step.
//                MaterialPageRoute(builder: (context) => TabNavigatorScreen()));
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                  TabNavigatorScreen(currenttabid: 0,)), (Route<dynamic> route) => false);
            },
          ),
          actions: <Widget>[
          ],
        ),

        body:
        Container(
          child:
              Column(
                children: <Widget>[
                  status=='Delivery' ?


                  AddressCardCheckout(
                    addressname:address,
                    presssEdit: (){ Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                        MyAddressScreen(addressnav: 'checkout')), (Route<dynamic> route) => false);},

                  )
                      :

            Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 10),
          child:Container(
              height: 70,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)
                  ),
                  border: Border.all(color: Colors.grey)
              ),
              child:Column(children: <Widget>[
                Text('Takeaway Time ',style: TextStyle(fontWeight: FontWeight.bold),),
                Padding(
                  padding: EdgeInsets.only(left:SizeConfig.imageSizemultiplier*5,right:SizeConfig.imageSizemultiplier*3,),
                  child: DateTimeField(
                    format: format,
                    initialValue: DateTime.now(),
                    onShowPicker: (context, currentValue) async {
                      final time = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
                      );

                      selectTime(DateTimeField.convert(time));
                      return DateTimeField.convert(time);
                    },
                  ),

                ),
              ])
            )
           ),



                Expanded(

                          child: GridView.builder(

                              itemCount:itemcatList!=null? itemcatList.length:0,
                              gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 1,
                                  mainAxisSpacing: 0,
                                  childAspectRatio: 1.65
                              ),
                              itemBuilder: (context,index)=>


                        CheckoutItem(
                              itemname:itemcatList!=null?  itemcatList[index].categoryname:'',
                              totprice:itemcatList!=null?   itemcatList[index].totprice:'',
                              price:itemcatList!=null?  itemcatList[index].price:'',
                              image:itemcatList!=null?  itemcatList[index].image:'',
                              varient:itemcatList!=null?   itemcatList[index].varients:[],
                              pressminus: (){
                                pressMinus( itemcatList[index].totprice, itemcatList[index].qty, itemcatList[index].id);
                              },
                              pressplus: (){
                                pressPlus( itemcatList[index].totprice, itemcatList[index].qty, itemcatList[index].id);
                              },
                              qty:itemcatList!=null?  itemcatList[index].qty:'',
                              pressdelete:(){
                                deleteItem( itemcatList[index].id);

                              }
                          ),


//
//                          CheckoutItem(
//                              itemname:  itemcatList[i].categoryname,
//                              totprice:  itemcatList[i].totprice,
//                              price: itemcatList[i].price,
//                              varient:  itemcatList[i].varients,
//                              pressminus: (){
//                                pressMinus( itemcatList[i].totprice, itemcatList[i].qty, itemcatList[i].id);
//                              },
//                              pressplus: (){
//                                pressPlus( itemcatList[i].totprice, itemcatList[i].qty, itemcatList[i].id);
//                              },
//                              qty: itemcatList[i].qty,
//                              pressdelete:(){
//                                deleteItem( itemcatList[i].id);
//
//                              }
//                          ),
                        ),

                )

                ],
              )
        ),

        bottomNavigationBar:
          BottomTab(
            orderClick:(){this.clickOrderBtn();},
            status: status,
            subtotprice: subtotprice.toString(),
            changeStatus: (){this.changeStatus();},
          )

    );
  }

}


//class BasicTimeField extends StatelessWidget {
//  final format = DateFormat("hh:mm a");
//  @override
//  Widget build(BuildContext context) {
//    return
//
//
//    ])
//  )
// );
//  }
//
//}

class Clock24Example extends StatelessWidget {
  final format = DateFormat("HH:mm");
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Text('24 hour clock'),
      DateTimeField(
        format: format,
        onShowPicker: (context, currentValue) async {
          final time = await showTimePicker(
            context: context,
            initialTime: TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
            builder: (context, child) => MediaQuery(
                data: MediaQuery.of(context)
                    .copyWith(alwaysUse24HourFormat: true),
                child: child),
          );
          return DateTimeField.convert(time);
        },
      ),
    ]);
  }
}


