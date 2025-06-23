import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timease_mobile/core/errors/failure.dart';
import 'package:timease_mobile/core/utils/api_service.dart';
import 'package:timease_mobile/features/event/presentation/manger/broad_cast_cubit/broad_cast_state.dart';

class BroadCastCubit extends Cubit<BroadCastState>
{
  BroadCastCubit(this.apiService) : super(BroadCastInitial());
 ApiService apiService;

  static BroadCastCubit get(context){
    return BlocProvider.of(context);

  }
  Future<void> sendBroadCast({
    required String eventId,
    required String title,
    required String message,

  }) async {
    emit(BroadCastLoading());
    try {
      await apiService.post(
        endPoint: 'notifications/broadcast',
        body: {
          "eventId": eventId,
          "title": title,
          "message": message
        },
      );
      emit(BroadCastSuccess());

    } catch (e) {
      if (e is DioException) {
        emit(BroadCastFailure(errMessage: ServerFailure.fromDioError(dioError: e).errMessage));
      }
      emit(BroadCastFailure(errMessage: ServerFailure(errMessage: e.toString()).errMessage));
    }
  }

}