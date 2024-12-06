import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:timease_mobile/core/utils/app_router.dart';
import 'package:timease_mobile/core/utils/function/email_check.dart';
import 'package:timease_mobile/core/utils/function/password_check.dart';
import 'package:timease_mobile/core/utils/styles.dart';
import 'package:timease_mobile/core/widgets/custom_full_button.dart';
import 'package:timease_mobile/core/widgets/custom_text_form_field.dart';
import 'package:timease_mobile/features/authentication/presentation/manger/login_cubit/login_cubit.dart';
import 'package:timease_mobile/features/authentication/presentation/manger/login_cubit/login_state.dart';
import 'package:timease_mobile/features/authentication/presentation/views/widgets/custom_password_row.dart';
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
  bool isPasswordShown = false;
  IconData suffixIcon = Icons.remove_red_eye_sharp;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit,LoginState>(
      builder: (context, state) {
        LoginCubit loginCubit=LoginCubit.get(context);
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
                    return null;
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
                  isPasswordShown: isPasswordShown,
                  isPassword: true,
                  validator: (value) {
                    if (!isStrongPassword(value)) {
                      return validatePassword(value);
                    }
                    return null;
                  },
                  suffixIcon: suffixIcon,
                  suffixIconResponse: () {
                    isPasswordShown
                        ? suffixIcon = Icons.remove_red_eye_sharp
                        : suffixIcon = Icons.visibility_off_sharp;
                    isPasswordShown = !isPasswordShown;
                    setState(() {});
                  },
                ),
                SizedBox(
                  height: 25,
                ),
                CustomFullButton(
                  text: 'Login',
                  height: 52,
                  response: () {
                    if (formKey.currentState!.validate()) {
                      loginCubit.login(email: emailController.text, password: passwordController.text);
                    }
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
      },
      listener: (context, state) {
        if(state is LoginSuccess) {
          context.go(AppRouter.homeScreen);
        }
        else if(state is LoginFailure)
        {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.errMessage),));
        }
        else
        {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('data'),));
        }
      },

    );
  }
}
