import 'package:flutter/material.dart';
import 'package:timease_mobile/features/meeting/presentation/views/meeting_details_screen.dart';

class CustomMeetingBox extends StatelessWidget {
  const CustomMeetingBox({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const MeetingDetailsScreen(),
        ),
      ),
      child: Container(
        width: double.infinity,
        height: 125,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: const Color.fromARGB(255, 218, 218, 218),
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 0),
              color: const Color.fromARGB(255, 193, 193, 193),
              blurRadius: 3,
              spreadRadius: 1,
            )
          ],
        ),
        margin: EdgeInsets.all(20),
        padding: EdgeInsets.all(10),
        child: Row(
          spacing: 12,
          children: [
            SizedBox(
              width: 8,
              height: 90,
              child: DecoratedBox(
                decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.circular(15)),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 5,
              children: [
                Text(
                  '....',
                  style: TextStyle(
                    fontSize: 18,
                    color: const Color.fromARGB(255, 113, 113, 113),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '....',
                  style: TextStyle(
                      fontSize: 16,
                      color: const Color.fromARGB(255, 113, 113, 113),
                      fontWeight: FontWeight.normal),
                ),
                Text(
                  '....',
                  style: TextStyle(
                    fontSize: 16,
                    color: const Color.fromARGB(255, 113, 113, 113),
                    fontWeight: FontWeight.normal,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}