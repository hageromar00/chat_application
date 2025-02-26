import 'package:bloc/bloc.dart';
import 'package:chat_application/model/message_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());
  CollectionReference messags =
      FirebaseFirestore.instance.collection('message');
  List<Messages> mess = [];
  void addMessage({required String message, required String email}) {
    try {
      messags
          .add({'message': message, 'CreateAt': DateTime.now(), 'inn': email});
    } catch (e) {
      emit(SendFailed(errMessage: 'there is problem in show messages'));
    }
  }

  void getMessage() {
    messags.orderBy('CreateAt', descending: true).snapshots().listen((event) {
      mess.clear();
      for (var doc in event.docs) {
        mess.add(Messages.fromJson(doc));
      }

      emit(ChatSuccess(messag: mess));
    });
  }

}
