String? defaultValidator(String? text) {
  if (text == null || text.isEmpty) {
    return "الرجاء ملئ هذا الحقل";
  }
  return null;
}

String? nameValidator(String? text) {
  if (text == null || text.isEmpty) {
    return "الرجاء ملئ هذا الحقل";
  }
  if (text.length < 3) {
    return "الإسم قصير جداً";
  }
  if (text.length > 20) {
    return "الإسم طويل جداً";
  }
  return null;
}
