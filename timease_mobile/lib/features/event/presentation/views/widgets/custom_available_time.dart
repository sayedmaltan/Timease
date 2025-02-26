import 'package:flutter/material.dart';
import 'package:timease_mobile/features/event/data/models/event_model.dart';
import '../../../../../constants.dart';
import '../../../../../core/utils/function/custom_box_decoration.dart';
import '../../../../../core/utils/styles.dart';
import 'custom_days_table.dart';

class CustomAvailableTime extends StatelessWidget {
  const CustomAvailableTime({
    super.key,
    required this.icon,
    required this.superTitle,
    required this.availabilitiesListModel,
  });

  final List<Availabilities> availabilitiesListModel;
  final IconData icon;
  final String superTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
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
            height: 12,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Text(
              'WEEKLY HOURS',
              style: Styles.textStyle14.copyWith(
                  fontWeight: FontWeight.w500, color: kSecPrimaryColor),
            ),
          ),
          CustomDaysTable(
            availabilitiesList: availabilitiesListModel,
          ),
        ],
      ),
    );
  }
}
