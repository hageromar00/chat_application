import 'package:chat_application/const.dart';
import 'package:chat_application/model/message_model.dart';
import 'package:flutter/material.dart';

class Chat extends StatelessWidget {
  const Chat({super.key,required this.messag});
  final Messages messag;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        padding:
            const EdgeInsets.only(top: 20, bottom: 17, left: 17, right: 17),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(17),
              bottomRight: Radius.circular(17)),
          color: kColor,
        ),
        child:  Text(
          messag.Message,
          style:const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
