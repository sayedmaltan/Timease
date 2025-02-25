import 'package:flutter/material.dart';
import 'package:timease_mobile/core/utils/function/custom_box_decoration.dart';
import '../../../../../core/utils/styles.dart';

class Custom3LayerContainer extends StatelessWidget {
  const Custom3LayerContainer({
    super.key,
    required this.icon,
    required this.superTitle,
    required this.title1,
    required this.description1,
    required this.title2,
    required this.description2,
  });

  final IconData icon;
  final String superTitle;
  final String title1;
  final String description1;
  final String title2;
  final String description2;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 210,
      decoration: customBoxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 48,
            child: Row(
              children: [
                SizedBox(
                  width: 15,
                ),
                Icon(
                  icon,
                  color: Colors.grey.shade700,
                ),
                SizedBox(
                  width: 9,
                ),
                Text(
                  superTitle,
                  style: Styles.textStyleBlack.copyWith(fontSize: 17),
                ),
              ],
            ),
          ),
          Divider(),
          SizedBox(
            height: 60,
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title1,
                    style: Styles.textStyle15
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                  Text(
                    description1,
                    style: Styles.textStyle14,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Divider(),
          ),
          SizedBox(
            height: 60,
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title2,
                    style: Styles.textStyle14,
                  ),
                  Text(
                    description2,
                    style: Styles.textStyle15
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
