
import 'dart:convert';
import 'dart:ffi';

import 'package:resturantapp/models/sqlite/itemcategory.dart';
import 'package:resturantapp/models/sqlite/itemcatwithvarient.dart';
import 'package:resturantapp/models/sqlite/varientssql.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';


class DatabaseHelper{
  static DatabaseHelper _databaseHelper;
  static Database _database;

  String itemcatTable='item_cat_table';
  String colId='id';
  String colCatId='catid';
  String colCategoryname='categoryname';
  String colPrice='price';
  String colTotPrice='totprice';
  String colQty='qty';
  String colImg='img';

  String varientTable='varient_table';
  String colVarId='varid';
  String colVarientyname='varientname';




  DatabaseHelper._createInstance();

  factory DatabaseHelper(){
    if(_databaseHelper==null){
      _databaseHelper=DatabaseHelper._createInstance();
    }
    return _databaseHelper;
  }


  Future<Database> get database async{
    if(_database==null ){
      _database=await initilalieDatabase();
    }
    return _database;
  }


  Future<Database> initilalieDatabase() async{
    Directory directory=await getApplicationDocumentsDirectory();
    String path=directory.path+'items.db';

    var itemsDatabase=await openDatabase(path,version: 1,onCreate: _createDb);
    return itemsDatabase;


  }


  void _createDb(Database db,int newVersion) async{
    await db.execute('CREATE TABLE $itemcatTable($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colCatId TEXT,'
        '$colCategoryname TEXT,$colPrice TEXT,$colTotPrice DOUBLE,$colQty INTEGER,$colImg TEXT)');

    await db.execute('CREATE TABLE $varientTable($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colVarId TEXT,'
        '$colCatId INTEGER,$colVarientyname TEXT,$colPrice TEXT)');
  }


  //get all item_cat_table data from database
  Future<List<Map<String,dynamic>>>  getItemCatMapList() async{
    Database  db=await this.database;

    var result =await db.query(itemcatTable);
    return result;
  }



  //Get the map list
  Future<List<ItemCategory>>  getItemCatList() async{
//    Database  db=await this.database;
  var itemMapList=await getItemCatMapList();
  int count =itemMapList.length;

  List<ItemCategory> itemCat= List<ItemCategory>();
  for(int i=0;i<count;i++){
    itemCat.add(ItemCategory.fromMpObject(itemMapList[i]));
  }
    return itemCat;
  }

  //get last item in item_cat
  Future<List<Map<String,dynamic>>>  getLastItemMapCatData() async{
    Database db=await this.database;
    var result=await db.rawQuery('SELECT * FROM $itemcatTable ORDER BY $colId DESC LIMIT 1;');

    return result;
    //print(result/forEach(f));
  }

  //Get the map list
  Future<ItemCategory>  getLastItemCatData() async{
//    Database  db=await this.database;
    var itemcatMapList=await getLastItemMapCatData();
    int count =itemcatMapList.length;
    print(itemcatMapList);

    List<ItemCategory> itemCat= List<ItemCategory>();
    for(int i=0;i<count;i++){
      itemCat.add(ItemCategory.fromMpObject(itemcatMapList[i]));
    }
    print(itemCat[0].id);
    return itemCat[0];
  }





  Future<int> insertItemCat(ItemCategory itemcat) async{
    Database db=await this.database;
    var result=await db.insert(itemcatTable, itemcat.toMap());
    return result;
  }




  Future<int> updateItemCat(double totPrice,int qty,int itemid) async{
    Database db=await this.database;

    var result=await db.rawDelete(' UPDATE $itemcatTable SET $colTotPrice=$totPrice,$colQty=$qty WHERE $colId=$itemid');
   // var result=await db.update(itemcatTable, itemcat.toMap(),where:'$colId = ?',whereArgs: [itemcat.id]);
    return result;
  }


  Future<int> deleteItemCat(int id) async{
    Database db=await this.database;
    var result=await db.rawDelete('DELETE FROM $itemcatTable WHERE $colId=$id');
    return result;
  }

  Future<int> deleteItemCatTable() async{
    Database db=await this.database;
    var result=await db.rawDelete('DELETE FROM $itemcatTable');
    return result;
  }


  //varients .............. //TODO VARIENT TABLE DATA


  //get all varient data from database
  Future<List<Map<String,dynamic>>>  getVarientMapList() async{
    Database  db=await this.database;

    var result =await db.query(varientTable);
    return result;
  }

  //Get the map list
  Future<List<Varient>>  getVarientList() async{
//    Database  db=await this.database;
    var varientMapList=await getVarientMapList();
    int count =varientMapList.length;

    List<Varient> varient= List<Varient>();
    for(int i=0;i<count;i++){
      varient.add(Varient.fromMpObject(varientMapList[i]));
    }
    return varient;
  }


  Future<int> insertVarient(Varient varient) async{
    Database db=await this.database;
    var result=await db.insert(varientTable, varient.toMap());
    return result;
  }


  //get map varient and itemcat
  Future<List<Map<String,dynamic>>>  getWithItemcatVarientMapList() async{
    Database db=await this.database;

    var result=await db.rawQuery('SELECT * FROM $itemcatTable ');

    return result;
  }




  //get varient and itemcat
  Future<List<ItemCatVarientListModel>>  getWithItemcatVarientList() async{
   Database  db=await this.database;
   var itemcatvarientMapList=await getWithItemcatVarientMapList();
    int count =itemcatvarientMapList.length;

    List<ItemCatVarientListModel> itemCatVarients= List<ItemCatVarientListModel>();
   List<ItemCategory> itemCat= List<ItemCategory>();
   List<Varient> varientlist= List<Varient>();
    for(int i=0;i<count;i++){
      //print(itemcatvarientMapLis)
      itemCat.add(ItemCategory.fromMpObject(itemcatvarientMapList[i]));
    }

   for(int i=0;i<itemCat.length;i++){
     //print(itemcatvarientMapLis)
     varientlist=[];
     var id=itemCat[i].id;
     var result=await db.rawQuery('SELECT * FROM $varientTable WHERE $colCatId=$id');

     for(int j=0;j<result.length;j++){
       varientlist.add(Varient.fromMpObject(result[j]));
     }





    ItemCatVarientListModel itemCatVarientListModel=
    new ItemCatVarientListModel(
        id: itemCat[i].id,
        catid: itemCat[i].catid,
        categoryname: itemCat[i].categoryname,
        price:itemCat[i].price,
        image:itemCat[i].img,
        totprice:itemCat[i].totprice,
        qty:itemCat[i].qty,
        varients:varientlist
    );

   //  ItemCatVarientListModel itemCatVarientListModel=new ItemCatVarientListModel(itemCat[i].id,itemCat[i].catid,itemCat[i].categoryname,itemCat[i].price,itemCat[i].img,itemCat[i].totprice,itemCat[i].qty,varientlist);

     itemCatVarients.add(itemCatVarientListModel);
       print(itemCatVarientListModel);
   }
   return  itemCatVarients;
  }



  Future<int> deleteVarient(int id) async{
    Database db=await this.database;
    var result=await db.rawDelete('DELETE FROM $varientTable WHERE $colCatId=$id');
    return result;
  }

  Future<int> deleteVarientTable() async{
    Database db=await this.database;
    var result=await db.rawDelete('DELETE FROM $varientTable');
    return result;
  }



}





