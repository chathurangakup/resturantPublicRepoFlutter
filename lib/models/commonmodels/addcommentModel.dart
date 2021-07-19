class AddcommentModel{
  String result;

  AddcommentModel({this.result});

  factory AddcommentModel.fromJson(Map<String,dynamic> parsedJson){
    return AddcommentModel(
      result:parsedJson['restlt'],

    );
  }
}