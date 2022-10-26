import 'package:flutter/material.dart';

import 'constants.dart';

class AppColors {
  static Color app_color_primary =
      HexColor.fromHex(Constants.app_color_primary);
  static Color app_color_on_primary =
      HexColor.fromHex(Constants.app_color_on_primary);
  static Color app_color_on_secondary =
      HexColor.fromHex(Constants.app_color_on_secondary);
  static Color app_color_secondary =
      HexColor.fromHex(Constants.app_color_secondary);

  static Color app_color_primary_variant =
      darken(app_color_primary, .2); // dark
  static Color app_color_secondary_variant =
      darken(app_color_secondary, .2); // dark

  static Color colorPrimaryExtraVariant =
      darken(app_color_primary, .6); // extra dark

  static Color darken(Color color, [double amount = .1]) {
    assert(amount >= 0 && amount <= 1);

    final hsl = HSLColor.fromColor(color);
    final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));

    return hslDark.toColor();
  }
}

extension HexColor on Color {
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}
