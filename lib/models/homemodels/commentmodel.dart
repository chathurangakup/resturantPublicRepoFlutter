class CommentModel{
  String commentid;
  String userid;
  String username;
  String date;
  String comment;
  String rating;


  CommentModel({this.commentid,this.userid,this.username,this.date,this.comment,this.rating});

  factory CommentModel.fromJson(Map<String, dynamic> json) {
    return CommentModel(
      commentid: json["commentid"] as String,
      userid: json["userid"] as String,
      username: json["username"] as String,
      date: json["date"] as String,
      comment: json["comment"] as String,
      rating: json["rating"] as String,
    );
  }


}