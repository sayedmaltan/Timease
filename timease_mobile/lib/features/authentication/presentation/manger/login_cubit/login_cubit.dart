import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timease_mobile/features/authentication/data/repos/auth_repo.dart';
import 'package:timease_mobile/features/authentication/presentation/manger/login_cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authRepo) : super(LoginInitial());
  final AuthRepo authRepo;

  static LoginCubit get(context) {
    return BlocProvider.of(context);
  }

  Future<void> login({
    required String email,
    required String password,
  }) async {
    emit(LoginLoading());
    var response = await authRepo.login(email: email, password: password);
    response.fold(
      (failure) {
        emit(LoginFailure(errMessage: failure.errMessage));
      },
      (loginModel) {
        emit(LoginSuccess(loginModel: loginModel));
      },
    );
  }
}
