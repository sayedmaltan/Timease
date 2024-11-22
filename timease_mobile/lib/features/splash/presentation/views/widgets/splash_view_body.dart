import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
    navigateToAuthScreenView();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(height:(MediaQuery.of(context).size.height/2)-220),
        Image.asset(
          AssetsImages.logo,
          height: 220,
        ),
      ],
    );
  }

void navigateToAuthScreenView() {
  Future.delayed(
    const Duration(
      seconds: 3,
    ),
    () => context.pushReplacement(AppRouter.authScreen)
  );
}
}
