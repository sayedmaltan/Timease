import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void changeStatusBarColor() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.white24, // Change the status bar background color
      statusBarIconBrightness: Brightness.dark, // Light icons on the status bar
      statusBarBrightness: Brightness.dark, // For Android to control status bar text color
    ),
  );
}