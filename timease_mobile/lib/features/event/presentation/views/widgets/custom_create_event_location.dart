import 'package:flutter/material.dart';

import '../../../../../constants.dart';

class CustomCreateEventLocation extends StatelessWidget {
  const CustomCreateEventLocation({
    super.key,
    required this.onExpansionChanged,
  });

  final ValueChanged<bool> onExpansionChanged;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        dividerColor: kSecPrimaryColor.shade100,
      ),
      child: ExpansionTile(
        tilePadding: EdgeInsets.only(left: 22, top: 9, right: 22),
        childrenPadding: EdgeInsets.only(left: 22, right: 22, top: 10),
        title: Text(
          "Location",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        onExpansionChanged: onExpansionChanged,
        children: [
          Container(
            margin: EdgeInsets.all(16),
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.blue[50],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Icon(Icons.info, color: Colors.black54),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    "Meetings with locations are more likely to start on time!",
                    style: TextStyle(color: Colors.black87),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
