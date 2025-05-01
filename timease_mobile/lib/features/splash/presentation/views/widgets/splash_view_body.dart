import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/asstes.dart';
import '../../../../../core/utils/cash_helper.dart';
import '../../../../../core/utils/setup_deep_links.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    super.initState();
    navigateToAuthOrHomeOrLink();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(height: (MediaQuery.of(context).size.height / 2) - 220),
        Image.asset(
          AssetsImages.timeaseLogo,
          height: 220,
        ),
      ],
    );
  }

  void navigateToAuthOrHomeOrLink() {

    Future.delayed(
        const Duration(
          seconds: 2,
        ), () async {
      bool isNavigate = await setupDeepLinkHandler(context);
      if (!isNavigate) {
        CashHelper.getData('accessToken') == null
            ? context.go(AppRouter.authScreen)
            : context.go(AppRouter.homeScreen, extra: 0);
      }
    });
  }
}
