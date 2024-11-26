
bool isStrongPassword(String password) {
  final String passwordPattern =
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[\s\S]{8,}$';

  return RegExp(passwordPattern).hasMatch(password);
}
String validatePassword(String password) {
  if (password.length < 8 ) {
    return 'Password must be greater than or equal to 8 characters.';
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
    return 'Password needs at least one special char @\$!%*?&.';
  }

  return 'Invalid Password';
}