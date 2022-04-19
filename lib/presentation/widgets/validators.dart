class TextValidator {
  static fullNameValidation(value) {
    if (value!.isEmpty) {
      return 'Please enter your Full name.';
    }
    return null;
  }
   static emptyValidation(value) {
    if (value!.isEmpty) {
      return 'Please enter a value.';
    }
    return null;
  }

  static phoneNumberValidation(value) {
    if (value!.isEmpty) {
      return 'Please enter your Phone number.';
    }
    return null;
  }

  // Email Validation
  static emailValidation(value) {
    if (value!.isEmpty) {
      return 'Please enter your username.';
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
