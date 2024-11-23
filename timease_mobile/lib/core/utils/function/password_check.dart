bool isStrongPassword(String password) {
  final String passwordPattern =
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,16}$';

  return RegExp(passwordPattern).hasMatch(password);
}
String validatePassword(String password) {
  if (password.length < 8 || password.length > 16) {
    return 'Password must be between 8 and 16 characters.';
  }
  if (!RegExp(r'(?=.*[A-Z])').hasMatch(password)) {
    return 'Password must include at least one uppercase letter.';
  }
  if (!RegExp(r'(?=.*[a-z])').hasMatch(password)) {
    return 'Password must include at least one lowercase letter.';
  }
  if (!RegExp(r'(?=.*\d)').hasMatch(password)) {
    return 'Password must include at least one digit.';
  }
  if (!RegExp(r'(?=.*[@$!%*?&])').hasMatch(password)) {
    return 'Password must include at least one special character (@\$!%*?&).';
  }

  return '';
}