import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timease_mobile/features/event/data/models/event_model.dart';
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

  void searchEventsList(
      {required List<EventModel> eventModelList, required String value}) {
    emit(SearchEventsLoading());
    List<EventModel> newList = [];
    String value2 = value.toLowerCase();
    for (int i = 0; i < eventModelList.length; i++) {
      if (eventModelList[i].title!.toLowerCase().contains(value) ||
          eventModelList[i].description!.toLowerCase().contains(value2)) {
        newList.add(eventModelList[i]);
      }
    }
    emit(UserEventsSuccess(eventsListModel: newList));
  }

  void reStartSearch({required List<EventModel> eventModelList}) {
    emit(UserEventsSuccess(eventsListModel: eventModelList));
  }
}
