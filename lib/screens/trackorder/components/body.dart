import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
import 'package:resturantapp/config/size_config.dart';
import 'package:resturantapp/models/api_responce.dart';
import 'package:resturantapp/models/cartmodel/getItemCategoryModel.dart';
import 'package:resturantapp/screens/trachorderdetails/trackorderdetails_screen.dart';
import 'package:resturantapp/screens/trackorder/components/trackordercard.dart';
import 'package:resturantapp/screens/trackorder/components/trackordertakeawaycard.dart';
import 'package:resturantapp/services/cart_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constants.dart';

class Body extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return BodyState();
  }

}


class BodyState extends State<Body>{
  CartServeces get cartServeces => GetIt.I<CartServeces>();
  ApiResponse<List<getItemCategory>> _apiResponceItemCatDelivery=null;
  ApiResponse<List<getItemCategory>> _apiResponceItemCatTakeaway=null;




  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('access_token');
    String userid = prefs.getString('userid');
    print(userid);
    EasyLoading.show(status: 'loading...', maskType: EasyLoadingMaskType.black,);
    try{
      await cartServeces.gettracorders(token,userid, 'Delivery').then((response){
            setState(() {
              _apiResponceItemCatDelivery=response;
            });
            EasyLoading.dismiss();
          print(_apiResponceItemCatDelivery.data.length);

      });
    }on Exception  catch (_) {
      EasyLoading.dismiss();
    }

    try{
      await cartServeces.gettracorders(token,userid, 'Takeaway').then((response){
        EasyLoading.show(status: 'loading...', maskType: EasyLoadingMaskType.black,);
        setState(() {
          _apiResponceItemCatTakeaway=response;
        });
        EasyLoading.dismiss();
        print(_apiResponceItemCatTakeaway.data[0].totalprice);

      });
    }on Exception  catch (_) {
      EasyLoading.dismiss();
    }


   
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor:kPrimaryColor,
            title: Center(child:Text('Track Order')),
            elevation: 0,
            bottom: TabBar(
                labelColor: kPrimaryColor,
                unselectedLabelColor: Colors.white,
                indicatorSize: TabBarIndicatorSize.label,
                indicator: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                    color: Colors.white),
                tabs: [
                  Tab(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("Delivery"),
                    ),
                  ),
                  Tab(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("Takeaway"),
                    ),
                  ),

                ]
            ),
          ),
          body: TabBarView(children: [


            Padding(
              padding: const EdgeInsets.all(5),
              child:GridView.builder(

                itemCount: _apiResponceItemCatDelivery!=null ?_apiResponceItemCatDelivery.data.length:0 ,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    mainAxisSpacing: 5,
                    childAspectRatio: 2.25
                ),
                itemBuilder: (context,index)=> TrackOrderDeliveryMainCard(
                  itemname: _apiResponceItemCatDelivery!=null ? _apiResponceItemCatDelivery.data[index].randomid:'',
                  address:  _apiResponceItemCatDelivery!=null ? _apiResponceItemCatDelivery.data[index].address:'',
                  price:  _apiResponceItemCatDelivery!=null ? _apiResponceItemCatDelivery.data[index].totalprice:'',
                  status: _apiResponceItemCatDelivery!=null ? _apiResponceItemCatDelivery.data[index].status:'',
                  date: _apiResponceItemCatDelivery!=null ? _apiResponceItemCatDelivery.data[index].date:'',
                  ordertime: _apiResponceItemCatDelivery!=null ? _apiResponceItemCatDelivery.data[index].ordertime:'',
                  press: (){
                    Navigator
                        .push(
                        context,
                        new MaterialPageRoute(builder: (context) =>  TrackOrderDetails(
                            carltlist:_apiResponceItemCatDelivery!=null ? _apiResponceItemCatDelivery.data[index].carttiems:'',

                        )));
                  },
                ),
              ),
            ),





            Padding(
            padding: const EdgeInsets.all(5),
            child:GridView.builder(
            itemCount: _apiResponceItemCatTakeaway!=null  ?_apiResponceItemCatTakeaway.data.length:0,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            mainAxisSpacing: 5,
            childAspectRatio: 2.25
            ),
             itemBuilder: (context,index)=> TrackOrderTakeawayMainCard(
                itemname: _apiResponceItemCatTakeaway!=null ? _apiResponceItemCatTakeaway.data[index].randomid:'',
                time:  _apiResponceItemCatTakeaway!=null ? _apiResponceItemCatTakeaway.data[index].time:'',
                price:  _apiResponceItemCatTakeaway!=null ? _apiResponceItemCatTakeaway.data[index].totalprice:'',
                status: _apiResponceItemCatTakeaway!=null ? _apiResponceItemCatTakeaway.data[index].status:'',
                date: _apiResponceItemCatTakeaway!=null ? _apiResponceItemCatTakeaway.data[index].date:'',
                ordertime: _apiResponceItemCatTakeaway!=null ? _apiResponceItemCatTakeaway.data[index].ordertime:'',
            press: (){
            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
             TrackOrderDetails(
                 carltlist:_apiResponceItemCatTakeaway!=null ? _apiResponceItemCatTakeaway.data[index].carttiems:'',

                 )), (Route<dynamic> route) => false);
              },
              ),
               ),
            )









          ]),
        )
    );

  }


}



//class ReackOrderCard extends StatelessWidget{
//  @override
//  Widget build(BuildContext context) {
//    Size size=MediaQuery.of(context).size;
//    return AspectRatio(
//      aspectRatio: 1.65,
//      child: Container(
//        decoration: BoxDecoration(
//          color: Colors.orangeAccent,
//          borderRadius: BorderRadius.circular(10)
//        ),
//        child: Row(
//          children: <Widget>[
//            Expanded(
//              flex: 1,
//              child: Padding(
//                padding: EdgeInsets.all(SizeConfig.heightMultiplier*3.5),
//                child: Column(
//                  crossAxisAlignment: CrossAxisAlignment.start,
//                  children: <Widget>[
//                    Row(
//                      children: <Widget>[
//                        Expanded(
//                          flex: 4,
//                          child:   Text('djhjshj djhsdhjds',
//                            style: TextStyle(fontWeight: FontWeight.w700,
//                              fontSize: SizeConfig.textMultiplier*2.5,
//                              color: Colors.white,
//
//                            ),
//                            maxLines: 2,
//                            overflow: TextOverflow.ellipsis,
//                          ),
//                        ),
//                        Expanded(
//                            flex: 1,
//                            child:   Text('120',
//                              style: TextStyle(
//                                fontSize: SizeConfig.textMultiplier*2.5,
//                                color: Colors.white,
//                              ),
//                              maxLines: 2,
//                              overflow: TextOverflow.ellipsis,
//                            ),
//                        )
//
//
//                      ],
//                    ),
//
//
//                    Row(
//                      children: <Widget>[
//                        Expanded(
//                          flex: 4,
//                          child:   Text('djhjshj djhsdhjds',
//                            style: TextStyle(
//                              fontSize: SizeConfig.textMultiplier*2,
//                              color: Colors.white,
//                            ),
//                            maxLines: 2,
//                            overflow: TextOverflow.ellipsis,
//                          ),
//                        ),
//                        Expanded(
//                          flex: 1,
//                          child:   Text('120',
//                            style: TextStyle(
//                              fontSize: SizeConfig.textMultiplier*2.5,
//                              color: Colors.white,
//                            ),
//                            maxLines: 2,
//                            overflow: TextOverflow.ellipsis,
//                          ),
//                        )
//                      ],
//                    ),
//                    Divider(
//                        color: Colors.white
//                    ),
//
//
//                    Row(
//                      children: <Widget>[
//                        Expanded(
//                          flex: 4,
//                          child:   Text('Qty',
//                            style: TextStyle(
//                              fontSize: SizeConfig.textMultiplier*2.5,
//                              color: Colors.white,
//                            ),
//                            maxLines: 2,
//                            overflow: TextOverflow.ellipsis,
//                          ),
//                        ),
//                        Expanded(
//                          flex: 1,
//                          child:   Text('1',textAlign: TextAlign.right,
//                            style: TextStyle(
//                              fontSize: SizeConfig.textMultiplier*2.5,
//                              color: Colors.white,
//                            ),
//                            maxLines: 2,
//                            overflow: TextOverflow.ellipsis,
//                          ),
//                        )
//                      ],
//                    ),
//
//                    Row(
//                      children: <Widget>[
//                        Expanded(
//                          flex: 4,
//                          child:   Text('Sub Totle',
//                            style: TextStyle(
//                              fontSize: SizeConfig.textMultiplier*3,
//                              color: Colors.white,
//                            ),
//                            maxLines: 2,
//                            overflow: TextOverflow.ellipsis,
//                          ),
//                        ),
//                        Expanded(
//                          flex: 1,
//                          child:   Text('220',
//                            style: TextStyle(
//                              fontSize: SizeConfig.textMultiplier*2.5,
//                              color: Colors.white,
//                              fontWeight: FontWeight.bold
//                            ),
//                            maxLines: 2,
//                            overflow: TextOverflow.ellipsis,
//                          ),
//                        )
//                      ],
//                    ),
//
//                  Padding(
//                    padding:new EdgeInsets.only(top:SizeConfig.heightMultiplier*2),
//                    child:   Text('Pending',
//                           style: TextStyle(
//                            fontSize: SizeConfig.textMultiplier*3,
//                            color: Colors.white,
//                            fontWeight: FontWeight.bold
//                    ),)
//                  )
//
//
//
//
//                  ],
//                ),
//              )
//
//
//
//            ),
//
//
//
//            AspectRatio(
//              aspectRatio:0.71 ,
//           //   child: Container(
////                margin: EdgeInsets.only(bottom: 15),
////                padding: EdgeInsets.all(25),
////                decoration: BoxDecoration(
////                  color: kPrimaryColor.withOpacity(0.15),
////                  shape: BoxShape.circle,
////                ),
//                child:
//                Image.asset(
//                  "assets/images/burger.png",
//                  fit:BoxFit.contain,
//                  alignment: Alignment.centerLeft,
//
//                ),
//
//            )
//
//
//
//          ],
//        ),
//      ),
//    );
//  }
//
//}