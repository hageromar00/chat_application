import 'package:flutter/material.dart';

class TextFromField extends StatelessWidget {
  TextFromField({super.key, required this.text,this.onchan});
  String text;
  Function(String)? onchan;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onchan,
      validator: (data) {
        if (data!.isEmpty) {
          return 'required';
        }
      },
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintStyle:const TextStyle(color: Colors.white),
        hintText: text,
        border:const OutlineInputBorder(borderSide: BorderSide(color: Colors.white))

      ),
    );
  }
}
