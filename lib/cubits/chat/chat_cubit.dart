import 'package:bloc/bloc.dart';
import 'package:chat_application/model/message_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';


part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());
 CollectionReference messages =
      FirebaseFirestore.instance.collection('message');
  List<Messages> messa = [];
  void sendMessage({required String message}) {
    try {
      messages
          .add({'message': message, 'CreateAt': DateTime.now()});
    } on Exception catch (e) {
      emit(SendFailed(errMessage: 'there is problem in show messages'));
    }
  }

  void getMessage() {
    messages.orderBy('CreateAt', descending: true).snapshots().listen((event) {
      messa.clear();
      for (var doc in event.docs) {
        messa.add(Messages.fromJson(doc));
      }

      // for (var i = 0; i < event.docs.length; i++) {
      //   mess.add(Messages.fromJson(docs[i]));
      // }
      emit(ChatSuccess(messag: messa));
    });
  }
  
}
