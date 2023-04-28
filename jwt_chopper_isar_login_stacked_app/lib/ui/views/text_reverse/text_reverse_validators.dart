class TextReverseValidators {
  static String? validateReverseText(String? value) {
    if (value != null && value.contains(RegExp(r'[0-9]'))) {
      return 'No numbers allowed';
    }
    return null;
  }
}
