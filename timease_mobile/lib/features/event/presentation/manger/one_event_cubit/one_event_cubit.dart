import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timease_mobile/features/event/presentation/manger/one_event_cubit/one_event_state.dart';

import '../../../data/repos/event_repo.dart';

class OneEventCubit extends Cubit<OneEventsState>
{
  OneEventCubit(this.eventRepo) : super(GetOneEventInitial());
  final EventRepo eventRepo;

  static OneEventCubit get(context){
    return BlocProvider.of(context);

  }
  Future<void> getEventByEventId({
    required String eventId,
  }) async {
    emit(GetOneEventLoading());
    var response = await eventRepo.getOneEvent(eventId: eventId);
    response.fold(
          (failure) {
        emit(GetOneEventFailure(errMessage: failure.errMessage));
      },
          (event) {
        emit(GetOneEventSuccess(eventModel: event));
      },
    );
  }

}