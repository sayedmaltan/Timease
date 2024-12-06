import 'package:dartz/dartz.dart';
import 'package:timease_mobile/core/errors/failure.dart';
import 'package:timease_mobile/features/authentication/data/models/login_model.dart';
import 'package:timease_mobile/features/authentication/data/models/register_model.dart';

abstract class AuthRepo {
  Future<Either<Failure, RegisterModel>> register({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  });

  Future<Either<Failure, LoginModel>> login({
    required String email,
    required String password,
  });
}
