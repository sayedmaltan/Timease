import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

customAwesomeDialog(BuildContext context,
    {required String message, String? note}) {
  return showDialog<String>(
    context: context,
    builder: (BuildContext context) => Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(),
      child: SizedBox(
        height: 175,
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                note ?? 'Wrong Credentials',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              ),
              const SizedBox(height: 15),
              Text(
                message,
                style: TextStyle(
                  color: Colors.grey.shade700,
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 15),
              Align(
                alignment: AlignmentDirectional.centerEnd,
                child: TextButton(
                  onPressed: () {
                    context.pop();
                  },
                  child: Text("Ok"),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
