import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timease_mobile/features/event/data/repos/event_repo.dart';
import 'package:timease_mobile/features/event/presentation/manger/event_cubit/user_events_state.dart';

class UserEventsCubit extends Cubit<UserEventsState> {
  UserEventsCubit(this.eventRepo) : super(UserEventInitial());
  final EventRepo eventRepo;

  static UserEventsCubit get(context) {
    return BlocProvider.of(context);
  }

  Future<void> getUserEventsList({
    required String userId,
  }) async {
    emit(UserEventsLoading());
    var response = await eventRepo.getUserEvents(userId: userId);
    response.fold(
      (failure) {
        emit(UserEventsFailure(errMessage: failure.errMessage));
      },
      (userEventsList) {
        emit(UserEventsSuccess(eventsListModel: userEventsList));
      },
    );
  }
}
