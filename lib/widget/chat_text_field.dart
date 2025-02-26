import 'package:chat_application/const.dart';
import 'package:flutter/material.dart';

class ChatTextField extends StatelessWidget {
   ChatTextField({super.key,this.onsubmit});
  Function(String)? onsubmit;
  @override
  Widget build(BuildContext context) {
    return TextField(
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
