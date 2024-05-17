

import 'package:flawless_beauty/utils/constants/constant.dart';
import 'package:flutter/material.dart';

class TChipTheme{
  TChipTheme._();

  //
static ChipThemeData lighChipTheme = ChipThemeData(
  disabledColor: Colors.grey.withOpacity(0.4),
  labelStyle: const TextStyle(color: Colors.black),
  selectedColor: TColors.primary,
  padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 12),
  checkmarkColor: TColors.white,
);

  static ChipThemeData darkChipTheme = const ChipThemeData(
    disabledColor: TColors.darkGrey,
    labelStyle: TextStyle(color: TColors.white),
    selectedColor: TColors.primary,
    padding: EdgeInsets.symmetric(horizontal: 12.0,vertical: 12),
    checkmarkColor: TColors.white,
  );
}