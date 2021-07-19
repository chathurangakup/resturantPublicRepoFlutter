import 'package:flutter/material.dart';
import 'package:resturantapp/models/sqlite/itemcategory.dart';
import 'package:resturantapp/models/sqlite/itemcatwithvarient.dart';
import 'package:resturantapp/screens/checkout/component/checkout_item.dart';
import 'package:resturantapp/screens/components/qty_add_reduce.dart';
import 'package:resturantapp/utils/database_helper.dart';

import '../checkoutscreen.dart';
import 'address_card_checkout.dart';

class Body extends StatefulWidget{
 final List<ItemCatVarientListModel> itemcatList;
  const Body({
    Key key,
    this.itemcatList
  }):super(key:key);


  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return BodyState();
  }

}

class BodyState extends State<Body>{
 DatabaseHelper databaseHelper=DatabaseHelper();
  List<ItemCatVarientListModel> itemcatListlocal;




  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   // print(widget.itemcatList);

//    this.setState((){
//      itemcatListlocal=widget.itemcatList;
//    });
  //  getData();
  }


  @override
  void didUpdateWidget(Body oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    if(this.widget.itemcatList!=oldWidget.itemcatList){
      print("itemcjjatList");
      this.setState((){
        itemcatListlocal=widget.itemcatList;
      });



    }
  }




  void getData() async{
    Future<List<ItemCatVarientListModel>> itemcatListData =  databaseHelper.getWithItemcatVarientList();

    itemcatListData.then((itemList){
      setState(() {
         itemcatListlocal=itemList;
      });
    });
    print("itemcatList");

//    print(itemcatList);
//    if(itemcatList!=null){
//      for(int i=0;i<itemcatList.length;i++){
//        print(itemcatList[i]);
//      }
//    }

  }

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

  @override
  Widget build(BuildContext context) {




    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          itemcatListlocal!=null ?
          SingleChildScrollView(
              child: Column(
                children: <Widget>[

//                  Padding(
//                    padding: const EdgeInsets.all(10),
//                    child:GridView.builder(
//                      itemCount: itemcatListlocal.length,
//                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                          crossAxisCount: 1,
//                          mainAxisSpacing: 20,
//                          childAspectRatio: 1.65
//                      ),
//                      itemBuilder: (context,index)=>  CheckoutItem(
//                          itemname:  itemcatListlocal[index].categoryname,
//                          totprice:  itemcatListlocal[index].totprice,
//                          price: itemcatListlocal[index].price,
//                          varient:  itemcatListlocal[index].varients,
//                          pressminus: (){
//                            pressMinus( itemcatListlocal[index].totprice, itemcatListlocal[index].qty, itemcatListlocal[index].id);
//                          },
//                          pressplus: (){
//                            pressPlus( itemcatListlocal[index].totprice, itemcatListlocal[index].qty, itemcatListlocal[index].id);
//                          },
//                          qty: itemcatListlocal[index].qty,
//                          pressdelete:(){
//                            deleteItem( itemcatListlocal[index].id);
//
//                          }
//
//                      ),
//
//                    ),
//                  ),

                  AddressCardCheckout(
                      addressname:'jhjd dh hghghghg ggghg ggghghg hdfah ndadajhd ghghghghgh ghty jdhajhdajh jdhajhajhdajdhadjhhsjd',
                      presssEdit: (){},

                  ),

//
//                  for(int i=0;i< itemcatListlocal.length;i++)
//                    CheckoutItem(
//                        itemname:  itemcatListlocal[i].categoryname,
//                        totprice:  itemcatListlocal[i].totprice,
//                        image:  itemcatListlocal[i].image,
//                        price: itemcatListlocal[i].price,
//                        varient:  itemcatListlocal[i].varients,
//                        pressminus: (){
//                          pressMinus( itemcatListlocal[i].totprice, itemcatListlocal[i].qty, itemcatListlocal[i].id);
//                        },
//                        pressplus: (){
//                          pressPlus( itemcatListlocal[i].totprice, itemcatListlocal[i].qty, itemcatListlocal[i].id);
//                        },
//                        qty: itemcatListlocal[i].qty,
//                        pressdelete:(){
//                            deleteItem( itemcatListlocal[i].id);
//                        }
//
//                    ),



                ],
              )


          )
              :
              Container(
                child: Text('sshsh'),
              )



        ],
      ),
    );;
  }

}


