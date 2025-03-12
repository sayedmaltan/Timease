import 'package:flutter/material.dart';

void customSnackBa({required String message,required context}){
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message),));
}