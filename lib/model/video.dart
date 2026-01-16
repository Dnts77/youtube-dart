class Video {

  String? id;
  String? titulo;
  String? descricao;
  String? imagem;
  String? canal;

  Video({this.canal, this.descricao, this.id, this.imagem, this.titulo});

  /*static jsonConvert(Map<String, dynamic> json){
    return Video(
      id: json["id"]["videoId"],
      titulo: json["snippet"]["title"],
      imagem: json["snippet"]["thumbnails"]["high"]["url"],
      descricao: json["snippet"]["description"],
      canal: json["snippet"]["channelId"]
    );
  } */
  
  
  factory Video.fromJson(Map<String, dynamic> json){
   return Video(
      id: json["id"]["videoId"],
      titulo: json["snippet"]["title"],
      imagem: json["snippet"]["thumbnails"]["high"]["url"],
      descricao: json["snippet"]["description"],
      canal: json["snippet"]["channelId"]
    );
  }

}