import 'package:flawless_beauty/constant.dart';
import 'package:flutter/material.dart';

class EmaiTextField extends StatelessWidget {
  EmaiTextField({
    Key? key,
    required this.labelText,
    required this.controller,
    this.validator,
  }) : keyboardType = TextInputType.emailAddress;

  final String labelText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;

  // Custom validator function to check if the entered text is a valid email
  String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    final emailRegExp = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
    if (!emailRegExp.hasMatch(value)) {
      return 'Invalid email format';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    double responsiveTextSize(double fontSize) {
      // Calculate responsive font size
      return fontSize * (w / 414); // 414 is a reference screen width
    }

    return Padding(
      padding: EdgeInsets.only(left: 30, right: 30),
      child: TextFormField(
        keyboardType: keyboardType,
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide:
                BorderSide(color: ThemeColor), // Set the outline border color
            borderRadius: BorderRadius.circular(10),
          ),
          labelText: labelText,
          labelStyle: TextStyle(
            fontSize: responsiveTextSize(18),
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
          prefixIcon: Icon(
            Icons.email,
            color:ThemeColor,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color:ThemeColor),
            borderRadius: BorderRadius.circular(10),
          ),

          // enabledBorder: OutlineInputBorder(
          //   borderSide: BorderSide(color: Colors.white),
          //   borderRadius: BorderRadius.circular(10),
          // ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.redAccent),
            borderRadius: BorderRadius.circular(10),
          ),

          contentPadding: EdgeInsets.only(left: 10, bottom: 5, top: 5),
        ),
        style: TextStyle(color: Colors.black), // Set the text color
        validator: validator ?? emailValidator,
      ),
    );
  }
}
