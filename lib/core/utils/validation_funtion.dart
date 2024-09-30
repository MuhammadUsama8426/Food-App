bool isValidEmail(String? inputString, {bool isRequired = false}) {
  bool isInputStringValid = false;

  if (!isRequired && (inputString == null || inputString.isEmpty)) {
    isInputStringValid = true;
  }

  if (inputString != null && inputString.isNotEmpty) {
    const pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    final regExp = RegExp(pattern);
    isInputStringValid = regExp.hasMatch(inputString);
  }

  return isInputStringValid;
}

bool isValidPassword(String? inputString, {bool isRequired = false}) {
  bool isInputStringValid = false;

  if (!isRequired && (inputString == null || inputString.isEmpty)) {
    isInputStringValid = true;
  }

  if (inputString != null && inputString.isNotEmpty) {
    const pattern =
        r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[\W_])(?!.*\s).{8,15}$';
    final regExp = RegExp(pattern);
    isInputStringValid = regExp.hasMatch(inputString);
  }

  return isInputStringValid;
}

bool isText(String? inputString, {bool isRequired = false}) {
  bool isInputStringValid = false;

  if (!isRequired && (inputString == null || inputString.isEmpty)) {
    isInputStringValid = true;
  }

  if (inputString != null && inputString.isNotEmpty) {
    const pattern = r'^[a-zA-Z]+$';
    final regExp = RegExp(pattern);
    isInputStringValid = regExp.hasMatch(inputString);
  }

  return isInputStringValid;
}

bool isValidPhone(String? inputString, {bool isRequired = false}) {
  bool isInputStringValid = false;

  if (!isRequired && (inputString == null || inputString.isEmpty)) {
    isInputStringValid = true;
  }

  if (inputString != null && inputString.isNotEmpty) {
    if (inputString.length > 16 || inputString.length < 6) return false;
    const pattern = r'^\+?[0-9]{6,16}$';
    final regExp = RegExp(pattern);
    isInputStringValid = regExp.hasMatch(inputString);
  }

  return isInputStringValid;
}
