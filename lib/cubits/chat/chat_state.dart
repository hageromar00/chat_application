part of 'chat_cubit.dart';

@immutable
abstract class ChatState {}

class ChatInitial extends ChatState {}
class ChatSuccess extends ChatState {
  List<Messages> messag;
  ChatSuccess({required this.messag});
}

class SendFailed extends ChatState {
  String errMessage;
  SendFailed({required this.errMessage});
}


