import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:resturantapp/models/homemodels/vartentmodel.dart';
import 'package:resturantapp/models/sqlite/itemcategory.dart';
import 'package:resturantapp/models/sqlite/varientssql.dart';
import 'package:resturantapp/screens/components/qty_add_reduce.dart';

import 'package:resturantapp/screens/details/components/title_price_rating.dart';
import 'package:resturantapp/screens/details/components/varient_obj.dart';
import 'package:resturantapp/screens/details/details_screen.dart';
import 'package:resturantapp/utils/database_helper.dart';

import '../../TabNavigatorScreen.dart';

class ItemInfo extends StatefulWidget{
  //static ItemInfoState of(BuildContext context) => context.findAncestorStateOfType<ItemInfoState>();

  final String itemcatid;
  final String itemcatname;
  final String description;
  final double rating;
  final String price;
  final int screentype;
  final String reviews;
  final Function clickReview;
  final Function clickAddReview;
  final List<VarientModel> varints;
  const ItemInfo({
    Key key,
    this.itemcatid,
    this.itemcatname,
    this.description,
    this.varints,
    this.rating,
    this.price,
    this.screentype,
    this.clickReview,
    this.clickAddReview,
    this.reviews
  }):super(key:key);




  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ItemInfoState();
  }



}

 class ItemInfoState extends State<ItemInfo>{
  static DatabaseHelper databaseHelper=DatabaseHelper();
  static List _selecteCategorys = List();
  static List<Varient>  varientssqlite=new List<Varient>();
  static int qty=1;
  static double totvarientprice=0;
  int selectval=-1;
 // static String itemcatidhh=widget.itemcatid;
//  static String itemcatname;
//  static String price;
//






   void _onCategorySelected(selected, varintid,varientname,price) {
//    if (selected == true) {
//        setState(() {
//          _selecteCategorys.add(varintid);
//        });
//
//        setState(() {
//          varientssqlite.add(new Varient(varintid,0,varientname,price));
//        });
//
//
//    }else {
//        setState(() {
//          _selecteCategorys.remove(varintid);
//        });
//
//        setState(() {
//          varientssqlite.removeWhere((item) => item.varid ==varintid);
//        });
//
//    }
//    print(_selecteCategorys);
//    print(varientssqlite);


     setState(() {
       _selecteCategorys.clear();
     });

     setState(() {
       varientssqlite.clear();
     });


       setState(() {
         _selecteCategorys.add(varintid);
       });

       setState(() {
         varientssqlite.add(new Varient(varintid,0,varientname,price));
       });



     print(_selecteCategorys);
     print(varientssqlite);




   }


//  void fff(){
//    setState(() {
//      _selecteCategorys:_selecteCategorys;
//    });
//  }

//   void insertTableItem(catid,catname,price,qty){
//
//     // print(itemcatList);
//     print("itemcatList");
//   }


 static void foo(String itemid,String itemcatname,String price,String image,int screentype,BuildContext context) async{
   totvarientprice=0;

   var priceDouble = double.parse(price);
   assert(priceDouble is double);
   print(priceDouble);

   ItemCategory itemCategory=ItemCategory( itemid,itemcatname,price,priceDouble,qty,image);
   int result =await  databaseHelper.insertItemCat(itemCategory);
   print(result);
   if(result!=0){
     ItemCategory lastitemid =await  databaseHelper.getLastItemCatData();
     if(lastitemid!=null){
        print(lastitemid);
        for(int i=0;i<varientssqlite.length;i++){
          Varient varient=new Varient(varientssqlite[i].varid,lastitemid.id, varientssqlite[i].varientname, varientssqlite[i].price);
          print(varient.varientname);
          int varirnt =await  databaseHelper.insertVarient(varient);
          print(varirnt);

          //get total varient price
          var myDouble = double.parse(varientssqlite[i].price);
          assert(myDouble is double);
          print(myDouble);
          totvarientprice=myDouble+totvarientprice;
        }
        print("totvarientprice");
        print(totvarientprice);
        var totpricswithqty= (double.parse(price) +totvarientprice)*qty;
        print(totpricswithqty);
        ItemCategory itemCategoryupdate=ItemCategory(itemid,itemcatname,price,totpricswithqty,qty,image);

        if(lastitemid!=null){
          print('kkshshshk');

          int updateitemcat =await  databaseHelper.updateItemCat(totpricswithqty,qty,lastitemid.id);

          if(updateitemcat!=0) {
             print("Success");

           //  Navigator.pop(context);
//             Navigator.of(context).pushAndRemoveUntil(
//                 MaterialPageRoute(builder: (context) =>
//                     TabNavigatorScreen(currenttabid: screentype,)), (Route<dynamic> route) => false);

            Navigator
                .push(
              context,
              new MaterialPageRoute(builder: (context) =>  TabNavigatorScreen(currenttabid: screentype,)),
            );

           // Navigator.of(context).pop();

          }else{
            print("errror");
            print(updateitemcat);
          }
        }



     }
   }
  //  insertTableItem('shahsg','saghsga','shagsga',3);
   // List<Varient>  varientssqlite=new List<Varient>();



    print(varientssqlite);
//    DatabaseHelper databaseHelper=DatabaseHelper();
//    databaseHelper.deleteItemCat(4);

  }



  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setState(() {
      _selecteCategorys.clear();
    });

    setState(() {
      varientssqlite.clear();
    });


//    if(widget.varints.length!=0){
//      setState(() {
//        _selecteCategorys.add(widget.varints[0].varientid);
//      });
//
//      setState(() {
//        varientssqlite.add(new Varient(widget.varints[0].varientid,0,widget.varints[0].varientname,widget.varints[0].price));
//      });
//    }


  }



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Size size=MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.all(20),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30)
          )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TitlepriceRating(
            itemCatname: widget.itemcatname ,
            rating:widget.rating,
            price: widget.price,
            clickReview: widget.clickReview,
            clickAddReview:widget.clickAddReview,
            reviews: widget.reviews,
          ),
          
          Text(widget.description,
              style:TextStyle(height: 1.5)),

          Padding(
            padding:  EdgeInsets.symmetric(vertical: 15),
            child: Text('Add Qty'),
          ),


          QtyObj(
              pressplus: (){
                setState(() {
                  qty=qty+1;
                });
              },
              pressminus: (){
                if(qty>1){
                  setState(() {
                    qty=qty-1;
                  });
                }
              },
              qty:qty
          ),


          Padding(
            padding:  EdgeInsets.symmetric(vertical: 15),
            child: Text('Varients'),
          ),


          widget.varints.length!=0?
            Column(
              children: <Widget>[

                  for(int index = 0; index < widget.varints.length; index++)
                    //  Map cmap = widget.varints[index];
                    VarientObj(
                        value: index,
                        groupvalue:selectval,
//                        onChange: (bool value){
//                          _onCategorySelected(value, widget.varints[index].varientid,widget.varints[index].varientname,widget.varints[index].price);
//                          //  print( values[index.toString()]);
//                        },
                        onChange: (value){
                             print(value);
                             setState(() {
                               selectval=value;
                             });
                             _onCategorySelected(value, widget.varints[index].varientid,widget.varints[index].varientname,widget.varints[index].price);
                        },
                  price:widget.varints[index].price,
                  checkboxname:widget.varints[index].varientname,
                  isActivecheckbox:_selecteCategorys.contains(widget.varints[index].varientid)
    )


              ],
            )
           :
          new  Container(
              child: Text('No Varients'),
          ),

          SizedBox(height: size.height*0.2),
        ],
      ),




    );

  }


}



