import 'package:flutter/material.dart';

TextStyle _getTextStyle(double fontSize, FontWeight fontWeight) {
  return TextStyle(fontSize: fontSize, fontWeight: fontWeight);
}

TextStyle getRegularStyle() {
  return _getTextStyle(14, FontWeight.w500);
}

TextStyle getMediumStyle() {
  return _getTextStyle(16, FontWeight.w700);
}

TextStyle getBoldStyle() {
  return _getTextStyle(18, FontWeight.bold);
}
