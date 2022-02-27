class TextValidator {
  // Email Validation
  static emailValidation(value) {
    if (value!.isEmpty) {
      return 'Please enter your Email Address.';
    }
    return null;
  }

  static passwordValidation(value) {
    if (value!.isEmpty) {
      return 'Please enter your Password.';
    }
    return null;
  }
}
