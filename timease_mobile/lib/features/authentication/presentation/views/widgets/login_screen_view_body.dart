import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:timease_mobile/core/utils/app_router.dart';
import 'package:timease_mobile/core/utils/function/password_check.dart';
import 'package:timease_mobile/core/utils/styles.dart';
import 'package:timease_mobile/core/widgets/custom_full_button.dart';
import 'package:timease_mobile/core/widgets/custom_text_form_field.dart';
import 'package:timease_mobile/features/authentication/presentation/views/widgets/custom_password_row.dart';
import '../../../../../core/utils/function/email_check.dart';
import 'custom_divider_with_Text.dart';
import 'custom_field_column.dart';
import 'custom_sign_with_google.dart';
import 'custom_text_opacity.dart';

class LoginScreenViewBody extends StatefulWidget {
  const LoginScreenViewBody({super.key});

  @override
  State<LoginScreenViewBody> createState() => _LoginScreenViewBodyState();
}

class _LoginScreenViewBodyState extends State<LoginScreenViewBody> {
  late TextEditingController emailController = TextEditingController();
  late TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 17.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Spacer(),
            Text(
              'Login',
              style: Styles.textStyle32,
            ),
            SizedBox(
              height: 5,
            ),
            CustomTextOpacity(
              text: 'Welcome back to Timease',
              opacity: 0.7,
            ),
            SizedBox(
              height: 35,
            ),
            CustomFieldColumn(
              controller: emailController,
              hintText: 'hello@example.com',
              aboveHintText: 'Email Address',
              validator: (value) {
                if (!isValidEmail(value)) {
                  return validateEmail(value);
                }
              },
            ),
            CustomPasswordRow(
              isRegister: false,
            ),
            SizedBox(
              height: 7,
            ),
            CustomTextFormField(
              controller: passwordController,
              keyboardType: TextInputType.visiblePassword,
              hintText: 'password',
              isPassword: true, validator: (value) {
              if (!isStrongPassword(value)) {
                return validatePassword(value);
              }
            },
            ),
            SizedBox(
              height: 25,
            ),
            CustomFullButton(
              text: 'Login',
              height: 52,
              response: () {
                if (formKey.currentState!.validate()) {}
              },
            ),
            SizedBox(
              height: 25,
            ),
            CustomDividerWithText(text: 'or sign in with'),
            SizedBox(
              height: 25,
            ),
            CustomSignWithGoogle(),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account?"),
                TextButton(
                    onPressed: () {
                      context.pushReplacement(AppRouter.registerScreen);
                    },
                    child: Text(
                      'sign up',
                      style: Styles.textStyle15,
                    )),
              ],
            ),
            Spacer()
          ],
        ),
      ),
    );
  }
}
