import 'package:flutter/material.dart';
import 'package:timease_mobile/features/authentication/presentation/views/widgets/resgister_screen_view_body.dart';

class RegisterScreenView extends StatelessWidget {
  const RegisterScreenView({super.key});

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
                child: RegisterScreenViewBody(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
