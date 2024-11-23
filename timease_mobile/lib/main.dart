import 'package:flutter/material.dart';
import 'package:timease_mobile/core/utils/app_router.dart';
import 'core/utils/function/build_theme_data.dart';
import 'core/utils/function/change_status_bar_color.dart';

void main() {
  changeStatusBarColor();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp.router(
      debugShowCheckedModeBanner: false,
     theme: buildThemeData(),
     routerConfig: AppRouter.router,
    );
  }

}

