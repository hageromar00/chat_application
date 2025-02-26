import 'package:chat_application/const.dart';
import 'package:flutter/material.dart';

class ChatTextField extends StatelessWidget {
   ChatTextField({super.key,this.onsubmit,this.control});
  Function(String)? onsubmit;
  TextEditingController? control = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: control,
      onSubmitted: onsubmit,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          label: const Text('Send Message'),
          suffixIcon: const Icon(
            Icons.send,
            color: kColor,
          )),
    );
  }
}
