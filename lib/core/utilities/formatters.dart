String formTime(DateTime? time) {
  time ??= DateTime.now();
  return "${time.hour}:${time.minute}";
}

String timeTo12Sys(String time) {
  try {
    int h = int.parse(time.split(":").first);
    if (h > 12) {
      return "${h - 12}:${time.split(":").last}م";
    }

    return "$timeص";
  } catch (_) {
    return time;
  }
}

String formDate([DateTime? date]) {
  date ??= DateTime.now();
  return "${date.year}/${date.month}/${date.day}";
}

String formStringDate(String? date) {
  if (date == null) return "";
  final formatted = DateTime.tryParse(date);
  if (formatted == null) return date;
  return formDate(formatted);
}
