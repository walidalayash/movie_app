import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/constant/app_colors.dart';
import '../../core/constant/constants.dart';

final primaryMaterialTheme = ThemeData(
  fontFamily: Constants.app_font_name,
  primaryColor: HexColor.fromHex(Constants.app_color_primary),
  accentColor: HexColor.fromHex(Constants.app_color_secondary),
  primaryColorDark: HexColor.fromHex(Constants.app_color_primary_variant),
  scaffoldBackgroundColor: const Color(0xFFEFEFEF),
  backgroundColor: Colors.white,
  iconTheme: IconThemeData(color: Colors.grey),
  colorScheme: ColorScheme.light(
      primary: HexColor.fromHex(Constants.app_color_primary),
      secondary: HexColor.fromHex(Constants.app_color_secondary),
      onPrimary: HexColor.fromHex(Constants.app_color_on_primary),
      background: Colors.white,
      onSecondary: HexColor.fromHex(Constants.app_color_on_secondary)),
).copyWith();
