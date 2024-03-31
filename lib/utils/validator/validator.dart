
class TValidator{

static String? validateEmail(String? value){
  if(value== null || value.isEmpty){
    return 'Email is Required';
  }
  /// Regular Expression for small validaiton
  final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+(\w-]{2,4}$');

  if(!emailRegExp.hasMatch(value)){
    return 'Invalide Email Address';
  }
  return null;
}

/// Password Validation
static String? validatePassword(String? value){
  if(value== null || value.isEmpty){
    return 'Password is Required';
  }
  //Check Minimum Password length
  if(value.length<6){
    return 'Password must be contain at least 6 character letter';
  }
  /// check for uppercase letter
  if(value.contains(RegExp(r'[A-Z]'))){
    return 'Password must be contain at least one uppercase letter';
  }
  /// check for Number
  if(value.contains(RegExp(r'[0-9]'))){
    return 'Password must be contain at least one number.';
  }
  /// check for Special Characters
  if(value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))){
    return 'Password must be contain at least one special character.';
  }
  return null;

}

static String? validationPhoneNumber(String? value){
  if(value==null || value.isEmpty){
    return ' Phone Number is Required';
  }
  // Regular Expression for phone Number validation (assuming a)
  final phoneRegEx = RegExp(r'^\d{11}$');

  if(phoneRegEx.hasMatch(value)){
    return 'Invalid Phone Number Format {11 Digits Required}';
  }
  return null;
}
//// Add more Custom Validation as you needed


}