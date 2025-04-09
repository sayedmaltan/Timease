import 'package:flutter/material.dart';

void customSnackBar({required String message,required context}){
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message),));
}