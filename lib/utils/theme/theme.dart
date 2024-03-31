

import 'package:flawless_beauty/utils/theme/custom_theme/TAppBarTheme.dart';
import 'package:flawless_beauty/utils/theme/custom_theme/outlined_button_theme.dart';
import 'package:flawless_beauty/utils/theme/custom_theme/tbuttomsheetTheme.dart';
import 'package:flawless_beauty/utils/theme/custom_theme/tcheckbox_theme.dart';
import 'package:flawless_beauty/utils/theme/custom_theme/tchipTheme.dart';
import 'package:flawless_beauty/utils/theme/custom_theme/text_theme.dart';
import 'package:flawless_beauty/utils/theme/custom_theme/textfield_theme.dart';
import 'package:flutter/material.dart';

import 'custom_theme/TElevatedButtonTheme.dart';

class TAppTheme{
  TAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    textTheme: TTextTheme.lightTextTheme,
    chipTheme: TChipTheme.lighChipTheme,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: TAppBarTheme.lightAppBarTheme,
    checkboxTheme: TCheckBoxTheme.lightCheckboxTheme,
    bottomSheetTheme: TBottomSheetTheme.lightButtomsheetTheme,
    elevatedButtonTheme:TElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.lightinputDecorationTheme,
  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    textTheme: TTextTheme.darkTextTheme,
    chipTheme: TChipTheme.darkChipTheme,
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: TAppBarTheme.darkAppBarTheme,
    checkboxTheme: TCheckBoxTheme.darkCheckboxTheme,
    bottomSheetTheme: TBottomSheetTheme.darkButtomsheetTheme,
    elevatedButtonTheme:TElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.darkinputDecorationTheme,
  );

}