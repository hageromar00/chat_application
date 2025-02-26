class Messages {
  final String Message;
  // final String id;
  Messages(this.Message);
  factory Messages.fromJson(json) {
    return Messages(json['message']);
  }
}
