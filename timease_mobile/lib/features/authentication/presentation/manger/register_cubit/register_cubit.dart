import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timease_mobile/features/authentication/data/repos/auth_repo.dart';
import 'package:timease_mobile/features/authentication/presentation/manger/register_cubit/register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.authRepo) : super(RegisterInitial());
  final AuthRepo authRepo;

  static RegisterCubit get(context) {
    return BlocProvider.of(context);
  }

  Future<void> register({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  }) async {
    emit(RegisterLoading());
    var response = await authRepo.register(
      email: email,
      password: password,
      firstName: firstName,
      lastName: lastName,
    );
    response.fold(
      (failure) {
        emit(RegisterFailure(errMessage: failure.errMessage));
      },
      (registerModel) {
        emit(RegisterSuccess(registerModel: registerModel));
      },
    );
  }
}
