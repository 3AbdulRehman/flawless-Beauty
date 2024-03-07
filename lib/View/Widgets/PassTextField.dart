import 'package:flawless_beauty/constant.dart';
import 'package:flutter/material.dart';

class PasswordTextField extends StatefulWidget {
  PasswordTextField({
    Key? key,
    required this.labelText,
    required this.controller,
    this.validator,
  })  : keyboardType = TextInputType.text,
        super(key: key);

  final String labelText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;

  @override
  _PasswordTextFieldState createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _obscureText = true;

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
        keyboardType: widget.keyboardType,
        controller: widget.controller,
        obscureText: _obscureText, // Hide the entered text for password field
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(10),
          ),
          labelText: widget.labelText,
          labelStyle: TextStyle(
            fontSize: responsiveTextSize(18),
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
          prefixIcon: Icon(
            Icons.lock,
            color: ThemeColor,
          ),
          suffixIcon: IconButton(
            icon: Icon(
              _obscureText ? Icons.visibility_off : Icons.visibility,
              color: ThemeColor,
            ),
            onPressed: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ThemeColor),
            borderRadius: BorderRadius.circular(10),
          ),
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
        style: TextStyle(color: Colors.black),
        validator: widget.validator ?? passwordValidator,
      ),
    );
  }

  // Custom validator function to check if the entered text is a valid password
  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 8) {
      return 'Password must be at least 8 characters';
    }
    return null;
  }
}
