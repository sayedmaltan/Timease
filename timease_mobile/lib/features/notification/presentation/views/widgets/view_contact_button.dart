import 'package:flutter/material.dart';

class ViewContactButton extends StatelessWidget {
  const ViewContactButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 43,
      width: 130  ,
      child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          backgroundColor: Color(0xFFB2DFDB),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: const Text(
          "View Contact",
          style: TextStyle(color: Color(0xFF2E7D32)),
        ),
      ),
    );
  }
}
