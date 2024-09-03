part of 'main_cubit.dart';

abstract class MainState {}

class MainInitial extends MainState {}

class GettingDevicess extends MainState {}

class GettingDevicessDone extends MainState {
  GettingDevicessDone();
}

class GettingDevicessFailed extends MainState {
  final String? errorMessage;

  GettingDevicessFailed({required this.errorMessage});
}

class AddingDevice extends MainState {
  final ProcessState processState;
  final String result;

  AddingDevice({required this.processState, this.result = ""});
}

class UpdatingDevice extends MainState {
  final ProcessState processState;
  final String result;

  UpdatingDevice({required this.processState, this.result = ""});
}

class DeleteingDevice extends MainState {
  final ProcessState processState;
  final String result;

  DeleteingDevice({required this.processState, this.result = ""});
}
