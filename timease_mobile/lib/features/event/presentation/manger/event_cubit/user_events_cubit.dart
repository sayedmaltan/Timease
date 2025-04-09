import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timease_mobile/features/event/data/models/event_model.dart';
import 'package:timease_mobile/features/event/data/repos/event_repo.dart';
import 'package:timease_mobile/features/event/presentation/manger/event_cubit/user_events_state.dart';

import '../../../data/models/create_event_model.dart';

class UserEventsCubit extends Cubit<UserEventsState> {
  UserEventsCubit(this.eventRepo) : super(UserEventInitial());
  final EventRepo eventRepo;

  static UserEventsCubit get(context) {
    return BlocProvider.of(context);
  }

  Future<void> getUserEventsList({
    required String userId,
  }) async {
    emit(GetUserEventsLoading());
    var response = await eventRepo.getUserEvents();
    response.fold(
      (failure) {
        emit(GetUserEventsFailure(errMessage: failure.errMessage));
      },
      (userEventsList) {
        emit(GetUserEventsSuccess(eventsListModel: userEventsList));
      },
    );
  }

  Future<void> getEventByEventId({
    required String eventId,
  }) async {
    emit(GetUserEventsLoading());
    var response = await eventRepo.getOneEvent(eventId: eventId);
    response.fold(
          (failure) {
            emit(GetUserEventsFailure(errMessage: failure.errMessage));
          },
          (event) {
        emit(GetOneEventSuccess(eventModel: event));
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
    emit(GetUserEventsSuccess(eventsListModel: newList));
  }

  void reStartSearch({required List<EventModel> eventModelList}) {
    emit(GetUserEventsSuccess(eventsListModel: eventModelList));
  }

  Future<void> deleteUserEventsItem({
    required String eventId,
    required String userId,
  }) async {
    emit(DeleteUserEventsLoading());
    var response = await eventRepo.deleteUserEventsItem(eventId: eventId);
    response.fold(
      (failure) {
        emit(DeleteUserEventsFailure(errMessage: failure.errMessage));
        getUserEventsList(userId: userId);
      },
      (deleted) {
        emit(DeleteUserEventsSuccess(isDeleted: deleted));
        getUserEventsList(userId: userId);
      },
    );
  }

  Future<void> createNewEvent({
    required CreateEventModel createEventModel,
  }) async {
    emit(CreateEventsLoading());
    var response =
        await eventRepo.createEvent(createEventModel: createEventModel);
    response.fold(
      (failure) {
        emit(CreateEventsFailure(errMessage: failure.errMessage));
      },
      (createEventResponse) {
        emit(
            CreateEventsSuccess(createEventResponseModel: createEventResponse));
      },
    );
  }

  Future<void> updateNewEvent({
    required CreateEventModel createEventModel,
    required String eventId
  }) async {
    emit(UpdateEventsLoading());
    var response =
    await eventRepo.updateEvent(createEventModel: createEventModel,eventId: eventId);
    response.fold(
          (failure) {
        emit(UpdateEventsFailure(errMessage: failure.errMessage));
      },
          (updateEventResponse) {
        emit(
            UpdateEventsSuccess(updateEventResponseModel: updateEventResponse));
      },
    );
  }

  Map<String, String> getDuration(
      {required TextEditingController customController,
      required String selectedDuration,
      required String selectedTimeType}) {
    if (customController.text.isNotEmpty) {
      return {selectedTimeType: customController.text};
    } else if (selectedDuration.compareTo('Custom') == 0) {
      return {'min': '15'};
    }
    return {selectedDuration.split(' ')[1]: selectedDuration.split(' ')[0]};
  }

  int getDurationByMinutes(
      {required TextEditingController customController,
      required String selectedDuration,
      required String selectedTimeType}) {
    int duration;
    if (customController.text.isNotEmpty) {
      duration = selectedTimeType == 'hr'
          ? int.parse(customController.text) * 60
          : int.parse(customController.text);
      return duration;
    } else if (selectedDuration.compareTo('Custom') == 0) {
      return 15;
    }
    duration = selectedDuration.split(' ')[1] == 'hr'
        ? int.parse(selectedDuration.split(' ')[0]) * 60
        : int.parse(selectedDuration.split(' ')[0]);
    return duration;
  }

  List<Map<String, dynamic>> getAvailabilitiesList({
    required bool isPeriodic,
    required List<Map<String, dynamic>> availabilitiesItemModelList,
    required List<bool> isUnavailable,
    required List<TextEditingController> startTimeList,
    required List<TextEditingController> endTimeList,
  }) {
    if (isPeriodic) {
      List<Map<String, dynamic>> list = [];
      List<String> days = [
        'SUNDAY',
        'MONDAY',
        'TUESDAY',
        'WEDNESDAY',
        'THURSDAY',
        'FRIDAY',
        'SATURDAY'
      ];
      for (int i = 0; i < 7; i++) {
        if (!isUnavailable[i]) {
          list.add({
            "dayOfWeek": days[i],
            "date": null,
            "startTime": startTimeList[i].text,
            "endTime": endTimeList[i].text
          });
        }
      }
      return list;
    } else {
      return availabilitiesItemModelList;
    }
  }

  int getInviteeLimit({required TextEditingController controller,}) {
    if (controller.text.isNotEmpty) {
      return int.parse(controller.text);
    }
    return 2;
  }

  List<List<TextEditingController>> getStartAndEndTime({required List <
      Availabilities> availabilitiesItemModelList, required bool isPeriodic,}) {
    List<TextEditingController> startTimeList=List.generate(
        7, (_) => TextEditingController());
    List<TextEditingController> endTimeList=List.generate(
        7, (_) => TextEditingController());
    if(isPeriodic) {
      for (int i = 0; i < availabilitiesItemModelList.length; i++) {
        startTimeList[i]=(TextEditingController(text:availabilitiesItemModelList[i].startTime ));
        endTimeList[i]=(TextEditingController(text:availabilitiesItemModelList[i].endTime ));
      }
    }
    return [startTimeList,endTimeList];
  }
}
