
import 'package:timease_mobile/features/authentication/data/models/register_model.dart';

abstract class RegisterState{}

class RegisterInitial extends RegisterState{}

class RegisterLoading extends RegisterState{}

class RegisterSuccess extends RegisterState{
  RegisterModel registerModel;
  RegisterSuccess({required this.registerModel});
}

class RegisterFailure extends RegisterState{
  final String errMessage;
  RegisterFailure({required this.errMessage});
}

