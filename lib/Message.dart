class Message{

  // "id": 1,
  // "profile": "https://avatar.iran.liara.run/public",
  // "created_date": 1623376800,
  // "author": "toto@gmail.com",
  // "message": "Mais Attila vous y attend, Sire! Attila! Le Fléau de Dieu! Mais…"
  int id;
  String profile;
  int created_date;
  String author;
  String message;

  Message(this.id, this.created_date, this.author, this.message, {this.profile = "https://avatar.iran.liara.run/public"});
}