class Messages {
  final String Message;
  final String id;
  Messages(this.Message,this.id);
  factory Messages.fromJson(json) {
    return Messages(json['message'],json['id']);
  }
}


//hageromar3@gmail.com