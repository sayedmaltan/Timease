import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomYourText extends StatelessWidget {
  final String text;

  const CustomYourText({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Text(
        text,
        style: GoogleFonts.acme(
          fontSize: 20 ,
          color : const Color.fromARGB(255, 108, 108, 108),
        )
      ),
    );
  }
}
