import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timease_mobile/core/utils/app_router.dart';
import 'package:timease_mobile/core/utils/asstes.dart';
import 'package:timease_mobile/core/utils/cash_helper.dart';
import 'package:timease_mobile/core/utils/function/custom_awesome_dialog.dart';
import 'package:timease_mobile/core/utils/function/email_check.dart';
import 'package:timease_mobile/core/utils/styles.dart';
import 'package:timease_mobile/core/widgets/custom_full_button.dart';
import 'package:timease_mobile/core/widgets/custom_loading_button.dart';
import 'package:timease_mobile/core/widgets/custom_text_form_field.dart';
import 'package:timease_mobile/features/authentication/presentation/manger/login_cubit/login_cubit.dart';
import 'package:timease_mobile/features/authentication/presentation/manger/login_cubit/login_state.dart';
import 'package:timease_mobile/features/authentication/presentation/views/widgets/custom_password_row.dart';
import 'custom_field_column.dart';

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
    return BlocConsumer<LoginCubit, LoginState>(
      builder: (context, state) {
        LoginCubit loginCubit = LoginCubit.get(context);
        return Form(
          key: formKey,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 17),
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    AssetsImages.loginScreen,
                  ),
                  Text(
                    'Login',
                    style: GoogleFonts.acme(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
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
                    height: 5,
                  ),
                  CustomTextFormField(
                    controller: passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    hintText: 'password',
                    isPasswordShown: isPasswordShown,
                    isPassword: true,
                    validator: (value) {
                      if (value.toString().isEmpty) {
                        return "Password can't be empty";
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
                    height: 20,
                  ),
                  state is LoginLoading
                      ? CustomLoadingButton(
                          height: 50,
                        )
                      : CustomFullButton(
                          text: 'Login',
                          height: 50,
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              loginCubit.login(
                                email: emailController.text,
                                password: passwordController.text,
                              );
                            }
                          },
                        ),
                  SizedBox(
                    height: 10,
                  ),
                  // CustomDividerWithText(text: 'or sign in with'),
                  // SizedBox(
                  //   height: 10,
                  // ),
                  // CustomSignWithGoogle(),
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
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
      listener: (context, state) {
        if (state is LoginSuccess) {
          CashHelper.setData('refreshToken', state.loginModel.refreshToken!);
          CashHelper.setData('accessToken', state.loginModel.accessToken!);
          CashHelper.setData('userId', state.loginModel.id!);
          CashHelper.setData('email', state.loginModel.email!);
          CashHelper.setData('name', '${state.loginModel.firstName!} ${state.loginModel.lastName!}');
          context.go(AppRouter.homeScreen, extra: 0);
        } else if (state is LoginFailure) {
          debugPrint(state.errMessage);
          customAwesomeDialog(context, message: state.errMessage);
        } else {}
      },
    );
  }
}
