import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timease_mobile/features/event/data/repos/event_repo.dart';
import '../../../data/models/create_event_model.dart';
import 'create_events_state.dart';

class CreateEventsCubit extends Cubit<CreateEventsState> {
  CreateEventsCubit(this.eventRepo) : super(CreateEventInitial());
  final EventRepo eventRepo;

  static CreateEventsCubit get(context) {
    return BlocProvider.of(context);
  }

  Future<void> createNewEvent({
    required CreateEventModel createEventModel,
  }) async {
    emit(CreateEventsLoading());
    var response = await eventRepo.createEvent(createEventModel: createEventModel);
    response.fold(
          (failure) {
        emit(CreateEventsFailure(errMessage: failure.errMessage));
      },
          (createEventResponse) {
        emit(CreateEventsSuccess(createEventResponseModel: createEventResponse));
      },
    );
  }

}
