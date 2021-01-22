class ValidationMixin {
  String validateEmail(String value) {
    if (!value.contains("@")) {
      return 'Please enter correct email';
    }
    return null;
  }

  String validatePassword(String value) {
    if (value.length < 4) {
      return 'Please enter a valid password';
    }
    return null;
  }
}
