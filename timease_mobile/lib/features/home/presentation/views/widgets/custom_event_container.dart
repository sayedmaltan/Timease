import 'package:flutter/material.dart';
import 'package:timease_mobile/constants.dart';

class CustomEventContainer extends StatelessWidget {
  final String eventName;
  final String eventType;
  final Color leftContainerColor;

  const CustomEventContainer({
    super.key,
    required this.eventName,
    required this.eventType,
    required this.leftContainerColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
          border: Border(
            right: BorderSide(color: kSecPrimaryColor.shade300, width: 1),
            top: BorderSide(
              color: kSecPrimaryColor.shade300,
              width: 0.6,
            ),
            bottom: BorderSide(color: kSecPrimaryColor.shade300, width: 1.2),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              offset: const Offset(
                10.0,
                10.0,
              ),
              blurRadius: 5.0,
              spreadRadius: -5.0,
            ),
            BoxShadow(
              color: Colors.grey.shade200,
              offset: const Offset(
                10.0,
                -10.0,
              ),
              blurRadius: 1.0,
              spreadRadius: -10.0,
            ),
            BoxShadow(
              color: Colors.white,
            ),
          ],
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          Container(
            height: double.infinity,
            width: 10,
            decoration: BoxDecoration(
              color: leftContainerColor,
              borderRadius: BorderRadiusDirectional.only(
                  bottomStart: Radius.circular(10),
                  topStart: Radius.circular(10)),
            ),
          ),
          SizedBox(
            width: 15,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(eventName),
              Text(eventType),
            ],
          ),
          Spacer(),
          Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
              color: kSecPrimaryColor.shade300,
              shape: BoxShape.circle,
            ),
            child: Center(child: Text('SA')),
          ),
          SizedBox(
            width: 15,
          ),
        ],
      ),
    );
  }
}
