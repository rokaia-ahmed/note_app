class NoteModel{
int? id;
String? title;
String? content;
int? isaFavorite;

NoteModel({this.id,this.title,this.content,this.isaFavorite});

NoteModel.fromJason(Map<String,dynamic> json)
  {
  id = json['id'];
  title=json['title'];
  content=json['content'];
  isaFavorite= json['isFavorite'];
  }

}




/*extension BoolParsing on String {
  bool parseBool() {
    return this.toLowerCase() == 'true';
  }
}*/