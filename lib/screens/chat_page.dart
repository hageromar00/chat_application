import 'package:chat_application/const.dart';
import 'package:chat_application/cubits/chat/chat_cubit.dart';
import 'package:chat_application/widget/chat.dart';
import 'package:chat_application/widget/chat_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatPage extends StatelessWidget {
  ChatPage({super.key});
  static String id = 'chat';
  TextEditingController control = TextEditingController();
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    String email = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/scholar.png',
              height: 60,
            ),
            const Text(
              'chat',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
        backgroundColor: kColor,
      ),
      body: Column(
        children: [
          Expanded(child: BlocBuilder<ChatCubit, ChatState>(
            builder: (context, state) {
              var message = BlocProvider.of<ChatCubit>(context).mess;
              return ListView.builder(
                  controller: _scrollController,
                  reverse: true,
                  itemCount: message.length,
                  itemBuilder: (context, index) {
                    return message[index].inn == email
                        ? Chat(messag: message[index])
                        : ChatFriend(mes: message[index]);
                    //  Chat(
                    //   messag: message[index],
                    // );
                  });
            }, //hageromar3@gmail.com
          )),
          Padding(
            padding: const EdgeInsets.all(10),
            // child: TextField(
            //   controller: control,
            //   onSubmitted: (data) {
            //     BlocProvider.of<ChatCubit>(context)
            //         .addMessage(message: data, email: email);
            //     control.clear();
            //   },
            //   decoration: InputDecoration(
            //       border: OutlineInputBorder(
            //           borderRadius: BorderRadius.circular(10)),
            //       label: const Text('Send Message'),
            //       suffixIcon: const Icon(
            //         Icons.send,
            //         color: kColor,
            //       )),
            // ),
            child: ChatTextField(
              control: control,
              onsubmit: (data) {
                BlocProvider.of<ChatCubit>(context)
                    .addMessage(message: data, email: email);
                control.clear();
              },
            ),
          ),
        ],
      ),
    );
  }
}
