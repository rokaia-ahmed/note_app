class NoteModel{
int? id;
String? title;
String? content;
int? isaFavorite;

NoteModel({this.id,this.title,this.content,this.isaFavorite});

NoteModel.fromJason(Map<String,dynamic> json)
  {
  id = int.parse(json['id']);
  title=json['title'];
  content=json['content'];
  isaFavorite= int.parse(json['isaFavorite']);
  }

}




/*extension BoolParsing on String {
  bool parseBool() {
    return this.toLowerCase() == 'true';
  }
}*/