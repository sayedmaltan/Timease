import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:timease_mobile/constants.dart';
import 'package:timease_mobile/core/utils/app_router.dart';
import 'package:timease_mobile/core/utils/asstes.dart';
import 'package:timease_mobile/core/widgets/custom_empty_button.dart';
import 'package:timease_mobile/core/widgets/custom_full_button.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthScreenViewBody extends StatelessWidget {
  const AuthScreenViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                AssetsImages.timeaseLogo,
                width: 180,
                height: 100,
                fit: BoxFit.cover,
              ),
              Image.asset(
                AssetsImages.welcomeScreen,
              ),
              Text(
                "Hello",
                style: GoogleFonts.acme(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Welcome to ",
                    style: GoogleFonts.acme(
                        fontSize: 20,
                        color: const Color.fromARGB(255, 106, 106, 106),
                        fontWeight: FontWeight.normal),
                  ),
                  Text(
                    "Timease",
                    style: GoogleFonts.acme(
                        fontSize: 20,
                        color: kPrimaryColor,
                        fontWeight: FontWeight.normal),
                  ),
                ],
              ),
              Text(
                "Where you can schedule your events",
                style: GoogleFonts.acme(
                    fontSize: 20,
                    color: Color.fromARGB(255, 106, 106, 106),
                    fontWeight: FontWeight.normal),
              ),
              SizedBox(height: 28,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 17),
                child: CustomFullButton(
                  text: 'Create an Account',
                  onPressed: () => context.push(AppRouter.registerScreen),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: CustomEmptyButton(
                  response: () => context.push(AppRouter.loginScreen),
                  text: 'Sign in',
                ),
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
    );
  }
}
