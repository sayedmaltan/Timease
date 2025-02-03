import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:timease_mobile/constants.dart';
import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/asstes.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    super.initState();
    navigateToAuthOrHome();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(height:(MediaQuery.of(context).size.height/2)-220),
        Image.asset(
          AssetsImages.timeaseLogo,
          height: 220,
        ),
      ],
    );
  }

void navigateToAuthOrHome() {
  Future.delayed(
    const Duration(
      seconds: 2,
    ),
    () {
      accessToken==''?
      context.go(AppRouter.authScreen):
      context.go(AppRouter.homeScreen);
    }
  );
}
}
