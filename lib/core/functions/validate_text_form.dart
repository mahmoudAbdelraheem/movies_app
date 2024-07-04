bool isValidPassword(password) {
  String passwordPattern =
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
  RegExp regExp = new RegExp(passwordPattern);
  return regExp.hasMatch(password);
}

bool isValidEmail(String email) {
  String emailPattren = r'^[\w-\.]+@[a-zA-Z]+\.[a-zA-Z]{2,}$';
  RegExp regExp = new RegExp(emailPattren);
  return regExp.hasMatch(email);
}
