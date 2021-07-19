class VarientModel{
  String varientid;
  String userid;
  String varientname;
  String price;


  VarientModel({this.varientid,this.userid,this.varientname,this.price});

  factory VarientModel.fromJson(Map<String, dynamic> json) {
    return VarientModel(
      varientid: json["varientid"] as String,
      userid: json["userid"] as String,
      varientname: json["varientname"] as String,
      price: json["price"] as String,
    );
  }


}