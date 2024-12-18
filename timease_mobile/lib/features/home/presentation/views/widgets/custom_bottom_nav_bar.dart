import 'package:flutter/material.dart';
import 'package:timease_mobile/constants.dart';
import 'package:timease_mobile/core/utils/asstes.dart';

class CustomBottomNavBar extends StatelessWidget {
  final ValueChanged<int> onTap;
  final int? selectBottomNavBar;
  final Color? logoColor;

  const CustomBottomNavBar({
    super.key,
    required this.onTap,
    this.selectBottomNavBar,
    this.logoColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(
        top: BorderSide(
          color: kSecPrimaryColor.shade400,
        ),
      )),
      child: BottomNavigationBar(
        currentIndex: selectBottomNavBar??0,
        onTap: onTap,
        items: [
          BottomNavigationBarItem(
            icon: Align(
              alignment: Alignment.center,
              heightFactor: 0.65,
              child: Image.asset(
                height: 37,
                AssetsImages.tLogo,
                fit: BoxFit.cover,
                color: logoColor,
              ),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.calendar_today_outlined,
              ),
              label: 'Meetings'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.people_alt_outlined,
              ),
              label: 'Contacts'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.notifications_outlined,
              ),
              label: 'Notifications'),
        ],
      ),
    );
  }
}
