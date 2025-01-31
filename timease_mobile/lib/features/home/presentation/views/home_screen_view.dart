import 'package:flutter/material.dart';
import 'package:timease_mobile/constants.dart';
import 'package:timease_mobile/features/home/presentation/views/widgets/events_screen_view_body.dart';
import 'package:timease_mobile/features/home/presentation/views/widgets/custom_bottom_nav_bar.dart';
import 'package:timease_mobile/features/home/presentation/views/widgets/custom_floating_action_button.dart';
import 'package:timease_mobile/features/home/presentation/views/widgets/home_screen_view_body.dart';
import 'package:timease_mobile/features/home/presentation/views/widgets/mettings_screen_view_body.dart';
import 'package:timease_mobile/features/home/presentation/views/widgets/notifications_screen_view_body.dart';

class HomeScreenView extends StatefulWidget {
  const HomeScreenView({super.key});

  @override
  State<HomeScreenView> createState() => _HomeScreenViewState();
}

class _HomeScreenViewState extends State<HomeScreenView> {
  int selectBottomNavBar = 0;
  Color logoColor = Colors.green;
  List<Widget> homeScreensBody=[
    HomeScreenViewBody(),
    EventsScreenViewBody(),
    MeetingsScreenViewBody(),
    NotificationsScreenViewBody(),
  ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SafeArea(child: homeScreensBody[selectBottomNavBar]),
        bottomNavigationBar: CustomBottomNavBar(
          onTap: (int value) {
              selectBottomNavBar = value;
              value == 0
                  ? logoColor = kPrimaryColor
                  : logoColor = kSecPrimaryColor;
              setState(() {});
          },
          selectBottomNavBar: selectBottomNavBar,
          logoColor: logoColor,
        ),
        floatingActionButton: selectBottomNavBar==1 ? CustomFloatingActionButton() : null,
      ),
    );
  }
}
