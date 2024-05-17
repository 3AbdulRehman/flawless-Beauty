

import 'package:intl/intl.dart';

class TFormatter{
  
  static String formateDate(DateTime? date){
    date ??= DateTime.now();
    return DateFormat('dd-MMM-YYY').format(date);
  }

  static String FormatCurrency(double amount){
    return NumberFormat.currency(locale: 'en_Pk',symbol: 'RS').format(amount); /// customize Currency local and symbol
  }

  /// change into pakistani formate

  static String formatPhoneNumber(String phoneNumber){
    // Assuming a 11 - digit pakistan number formate: (123) 456- 789
  if(phoneNumber.length == 10){
    return '(${phoneNumber.substring(0,3)}) ${phoneNumber.substring(3,6)} ${phoneNumber.substring(6)}';
  }else if(phoneNumber.length==11){
    return 'C${phoneNumber.substring(0,4)}) ${phoneNumber.substring(4,7)} ${phoneNumber.substring(7)}';
  }
  return phoneNumber;
  }

  // InternationCountry phone format number
/*
  //not fully tested
static String internationalFormatPhoneNumber(String phoneNumber){
    // Remove any non - digital character from the phone number
  var digitsOnly = phoneNumber.replaceAll(RegExp(r'\D'), '');


  /// Extract the Country code from the DigitalOnly
  String countryCode = '+${digitsOnly.substring(0,2)}';
  digitsOnly = digitsOnly.substring(2);

  //Add the remaining digits with proper formatting

  final formatterNumber = StringBuffer();
  formatterNumber.write('($countryCode)');

  int i = 0;
  while(i<digitsOnly.length){
    int groupLength = 2;
    if(i == 0 &&  countryCode == '+1'){
      groupLength = 3;
    }

    int end = i + groupLength;
    formatterNumber.write(digitsOnly.substring(i,end));

    if(end < digitsOnly.length){
      formatterNumber.write('');
    }

  }

}
*/

}