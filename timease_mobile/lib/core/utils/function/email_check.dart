String validateEmail(String email) {
  final String emailPattern =
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';

  if (email.isEmpty) {
    return 'Email address cannot be empty.';
  }
  if (!RegExp(emailPattern).hasMatch(email)) {
    return 'Please enter a valid email address.';
  }

  return '';
}

bool isValidEmail(String email) {
  final String emailPattern =
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';

  return RegExp(emailPattern).hasMatch(email);
}