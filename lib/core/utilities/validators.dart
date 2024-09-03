import '../app_localization/app_localization.dart';

String? defaultValidator(String? text) {
  if (text == null || text.isEmpty) {
    return "pleaseFillThis".translate();
  }
  return null;
}

String? priceValidator(String? text) {
  if (text == null || text.isEmpty) {
    return "pleaseFillThis".translate();
  }
  if (int.tryParse(text) == null) {
    return "pleaseWriteValidNum".translate();
  }
  return null;
}
