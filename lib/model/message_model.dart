class Messages {
  final String Message;
  final String inn;
  Messages(this.Message,this.inn);
  factory Messages.fromJson(json) {
    return Messages(json['message'],json['inn']);
  }
}


//hageromar3@gmail.com