import 'package:flutter/material.dart';

const kColor = Color(0xff2B475E);
 void ShowSnackBar(BuildContext context,String Message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(Message)));
  }
