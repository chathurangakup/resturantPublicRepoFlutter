class getItemCategory{
    final String id;
    final String userid;
    final String status;
    final String type;
    final String date;
    final String ordertime;
    final String time;
    final String address;
    final String randomid;
    final String totalprice;
    final List<CartItems> carttiems;


    getItemCategory({this.id,this.userid,this.status,this.type,this.date,this.ordertime,this.time,this.address,this.randomid,this.totalprice,this.carttiems});

    factory getItemCategory.fromJson(Map<String,dynamic> json){
      return getItemCategory(
        id:json['id'],
        userid:json['userid'],
        status:json['status'],
        type:json['type'],
        date:json['date'],
        time:json['time'],
        ordertime:json['ordertime'],
        address:json['address'],
        randomid:json['randomid'],
        totalprice:json['totalprice'],
        carttiems:parseCartItems(json)
      );
    }


    static List<CartItems> parseCartItems(cartItemsJson){
      var list =cartItemsJson['cartitems'] as List;
      List<CartItems> cartItemsList=
      list.map((data)=>CartItems.fromJson(data)).toList();
      return cartItemsList;
    }


}


class CartItems{
   int id;
   String catid;
   String categoryname;
   String price;
   String image;
   int totprice;
   int qty;
   List<Varients> varients;

   CartItems({this.id,this.catid,this.categoryname,this.price,this.image,this.totprice,this.qty,this.varients});


   factory CartItems.fromJson(Map<String,dynamic> parsedJson){
     return CartItems(
       id:parsedJson['id'],
       catid:parsedJson['catid'],
       categoryname:parsedJson['categoryname'],
       price:parsedJson['price'],
       image:parsedJson['image'],
       totprice:parsedJson['totprice'],
       qty:parsedJson['qty'],
       varients:parseVarients(parsedJson),

     );
   }


static List<Varients> parseVarients(varientJson){
     var list =varientJson['varients'] as List;
     List<Varients> varientList=
         list.map((data)=>Varients.fromJson(data)).toList();
     return varientList;
}


}



class Varients{
  int id;
  String varid;
  int catid;
  String varientname;
  String price;

  Varients({this.id,this.varid,this.catid,this.varientname,this.price});


  factory Varients.fromJson(Map<String,dynamic> parsedJson){
    return Varients(
      id:parsedJson['id'],
      varid:parsedJson['varid'],
      catid:parsedJson['catid'],
      varientname:parsedJson['varientname'],
      price:parsedJson['price'],


    );
  }
}


