
abstract class BroadCastState {}

class BroadCastInitial extends BroadCastState {}

class BroadCastLoading extends BroadCastState {}

class BroadCastSuccess extends BroadCastState {

}

class BroadCastFailure extends BroadCastState {
  final String errMessage;

  BroadCastFailure({required this.errMessage});
}