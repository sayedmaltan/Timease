import 'package:flutter/material.dart';
import 'package:timease_mobile/core/utils/function/custom_box_decoration.dart';
import 'package:timease_mobile/core/utils/styles.dart';

import '../../../../../constants.dart';
import 'custom_image_icon.dart';

class CustomCreateEventHost extends StatelessWidget {
  const CustomCreateEventHost({
    super.key,
    this.imageSize = 27,
    required this.isHostOpen,
    required this.onExpansionChanged,
  });

  final ValueChanged<bool> onExpansionChanged;
  final bool isHostOpen;
  final double imageSize;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: kSecPrimaryColor.shade100),
      child: ExpansionTile(
        tilePadding: EdgeInsets.only(left: 22, top: 9, right: 22),
        childrenPadding: EdgeInsets.only(left: 22, right: 22, top: 10),
        onExpansionChanged: onExpansionChanged,
        title: Column(
          spacing: 4,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Host",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            if (!isHostOpen)
              Row(
                spacing: 10,
                children: [
                  CustomImageIcon(
                    size: imageSize,
                  ),
                  Text(
                    "Sayed Ahmed (you)",
                    style: Styles.textStyle14
                        .copyWith(fontWeight: FontWeight.w400),
                  )
                ],
              ),
          ],
        ),
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 15.0),
            child: SizedBox(
              height: 75,
              child: DecoratedBox(
                decoration: buildBoxDecorationCrEvent(),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Row(
                    spacing: 12,
                    children: [
                      CustomImageIcon(
                        textSize: 14,
                        size: 29,
                      ),
                      Column(

                        spacing: 5,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Sayed Ahmed (you)",
                          ),
                          Text(
                            "sayedmaltan@gmail.com",
                            style: TextStyle(
                              color: kSecPrimaryColor.shade500,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
