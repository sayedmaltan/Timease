import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:timease_mobile/core/utils/app_router.dart';
import 'package:timease_mobile/core/utils/function/email_check.dart';
import 'package:timease_mobile/core/utils/function/password_check.dart';
import 'package:timease_mobile/core/utils/styles.dart';
import 'package:timease_mobile/core/widgets/custom_full_button.dart';
import 'package:timease_mobile/core/widgets/custom_text_form_field.dart';
import 'package:timease_mobile/features/authentication/presentation/views/widgets/custom_password_row.dart';
import 'custom_divider_with_Text.dart';
import 'custom_field_column.dart';
import 'custom_sign_with_google.dart';
import 'custom_text_opacity.dart';

class RegisterScreenViewBody extends StatefulWidget {
  const RegisterScreenViewBody({super.key});

  @override
  State<RegisterScreenViewBody> createState() => _RegisterScreenViewBodyState();
}

class _RegisterScreenViewBodyState extends State<RegisterScreenViewBody> {
  var formKey = GlobalKey<FormState>();
  late TextEditingController emailController = TextEditingController();
  late TextEditingController nameController = TextEditingController();
  late TextEditingController passwordController = TextEditingController();
  bool isPasswordShown = false;
  IconData suffixIcon= Icons.remove_red_eye_sharp;

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
              'Register',
              style: Styles.textStyle32,
            ),
            SizedBox(
              height: 5,
            ),
            CustomTextOpacity(
              text: 'Sign up with Timease for free',
              opacity: 0.7,
            ),
            SizedBox(
              height: 24,
            ),
            CustomFieldColumn(
              controller: emailController,
              hintText: 'hello@example.com',
              aboveHintText: 'Email Address',
              validator: (value) {
                if (!isValidEmail(value)) {
                  return validateEmail(value);
                }
                return null;
              },
            ),
            CustomFieldColumn(
              controller: nameController,
              hintText: 'John Doe',
              aboveHintText: 'Full Name',
              validator: (value) {
                if (value.toString().isEmpty) {
                  return 'Please enter your name';
                }
                if (value.toString().length<2) {
                  return 'Invalid name';
                }
                return null;
              },
            ),
            CustomPasswordRow(
              isRegister: true,
            ),
            SizedBox(
              height: 7,
            ),
            CustomTextFormField(
              controller: passwordController,
              keyboardType: TextInputType.visiblePassword,
              hintText: 'password',
              isPasswordShown: isPasswordShown,
              isPassword: true, validator: (value) {
              if (!isStrongPassword(value)) {
                return validatePassword(value);
              }
              return null;
            },
              suffixIcon: suffixIcon ,
              suffixIconResponse: () {
                isPasswordShown
                    ? suffixIcon = Icons.remove_red_eye_sharp
                    : suffixIcon = Icons.visibility_off_sharp;
                isPasswordShown = !isPasswordShown;
                setState(() {});
              },
            ),
            SizedBox(
              height: 22,
            ),
            CustomFullButton(
              text: 'Register',
              height: 52,
              response: () {
                if (formKey.currentState!.validate()) {}
              },
            ),
            SizedBox(
              height: 20,
            ),
            CustomDividerWithText(text: 'or sign up with'),
            SizedBox(
              height: 20,
            ),
            CustomSignWithGoogle(),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account?"),
                TextButton(
                    onPressed: () {
                      context.pushReplacement(AppRouter.loginScreen);
                    },
                    child: Text(
                      'sign in',
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
