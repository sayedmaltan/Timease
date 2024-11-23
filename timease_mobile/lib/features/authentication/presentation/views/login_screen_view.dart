import 'package:flutter/material.dart';
import 'package:timease_mobile/features/authentication/presentation/views/widgets/login_screen_view_body.dart';

class LoginScreenView extends StatelessWidget {
  const LoginScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: CustomScrollView(
            physics: ScrollPhysics(),
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: LoginScreenViewBody(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
