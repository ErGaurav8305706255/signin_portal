class Validate {
  static final RegExp _nameRegex = RegExp(
      r"^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$");


  static String? validateUserNameAddress(username) {
    final _hasMatched = _nameRegex.hasMatch(username);
    if(username.isEmpty || username.length <= 3){
      return 'Please enter Username';
    }
    if (!_hasMatched) {
      return 'Please enter valid Username.';
    }
    else {
      return null;
    }
  }

  static final RegExp _passwordRegex = RegExp(
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');

  static String? validatePasswordAddress(password) {
    final _hasMatched = _passwordRegex.hasMatch(password);
    if(password.isEmpty){
      return 'Please enter Password';
    }
    if (!_hasMatched) {
      return 'Please enter valid Password.';
    } else {
      return null;
    }
  }
}