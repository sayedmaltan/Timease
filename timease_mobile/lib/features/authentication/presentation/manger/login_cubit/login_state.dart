
import 'package:timease_mobile/features/authentication/data/models/login_model.dart';

abstract class LoginState{}

class LoginInitial extends LoginState{}

class LoginLoading extends LoginState{}

class LoginSuccess extends LoginState{
  LoginModel loginModel;
  LoginSuccess({required this.loginModel});
}

class LoginFailure extends LoginState{
  final String errMessage;
  LoginFailure({required this.errMessage});
}

