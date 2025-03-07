import 'package:flutter/material.dart';
import 'package:timease_mobile/core/utils/app_router.dart';
import 'package:timease_mobile/core/utils/service_locator.dart';
import 'core/utils/cash_helper.dart';
import 'core/utils/function/build_theme_data.dart';
import 'core/utils/function/change_status_bar_color.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CashHelper.init();
  changeStatusBarColor();
  setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: buildThemeData(),
      routerConfig: AppRouter.router,
    );
  }
}
