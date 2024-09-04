part of "main_cubit.dart";

extension ReservationMethods on MainCubit {
  Future getReservation({required int deviceId}) async {
    updateState(GettingReservation(processState: ProcessState.processing, deviceId: deviceId));
    final reqResult = await sl<GetReservationUseCase>().call(deviceId: deviceId);
    reqResult.fold(
      (l) => updateState(GettingReservation(
        result: l.message ?? "gettingDataError".translate(),
        deviceId: deviceId,
        processState: ProcessState.failed,
      )),
      (r) {
        updateState(GettingReservation(
          processState: ProcessState.done,
          deviceId: deviceId,
          reservation: r,
        ));
      },
    );
  }

  void addReservation(ReservationEntity reservation) async {
    updateState(AddingReservation(processState: ProcessState.processing));
    final reqResult = await sl<AddReservationUseCase>().call(reservation);
    reqResult.fold(
      (l) => updateState(
          AddingReservation(processState: ProcessState.failed, result: l.message ?? "")),
      (r) {
        updateState(AddingReservation(
          processState: ProcessState.done,
          result: r,
        ));
      },
    );
  }

  void updateReservation(ReservationEntity reservation) async {
    updateState(UpdatingReservation(processState: ProcessState.processing));

    final reqResult = await sl<EditReservationUseCase>().call(reservation);
    reqResult.fold(
      (l) => updateState(
          UpdatingReservation(processState: ProcessState.failed, result: l.message ?? "")),
      (r) {
        updateState(UpdatingReservation(
          processState: ProcessState.done,
          result: r,
        ));
      },
    );
  }

  Future deleteReservation(ReservationEntity reservation) async {
    updateState(DeleteingReservation(processState: ProcessState.processing));
    final reqResult = await sl<DeleteReservationUseCase>().call(reservation: reservation);
    reqResult.fold(
      (l) => updateState(
          DeleteingReservation(processState: ProcessState.failed, result: l.message ?? "")),
      (r) {
        updateState(DeleteingReservation(
          processState: ProcessState.done,
          result: r,
        ));
      },
    );
  }
}
