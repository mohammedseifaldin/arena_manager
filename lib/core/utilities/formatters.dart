String formDuration({
  DateTime? startTime,
  required DateTime endTime,
}) {
  startTime ??= DateTime.now();
  final duration = endTime.difference(startTime);
  final hours = duration.inHours;
  final minutes = duration.inMinutes - (duration.inHours * 60);
  return "$hours:$minutes";
}
