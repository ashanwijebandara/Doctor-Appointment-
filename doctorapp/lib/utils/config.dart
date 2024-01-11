import 'package:flutter/material.dart';

// constant config
class Config {
  static MediaQueryData? mediaQueryData;
  static double? screenWidth;
  static double? screenHeight;

  void init(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    screenWidth = mediaQueryData!.size.width;
    screenHeight = mediaQueryData!.size.height;
  }

  static get widthsize {
    return screenWidth;
  }

  static get heightsize {
    return screenHeight;
  }

  // define spacing height
  static const spaceSmall = SizedBox(
    height: 20,
  );
  static final spaceMedium = SizedBox(
    height: screenHeight! * 0.05,
  );

  static final spaceBig = SizedBox(
    height: screenHeight! * 0.08,
  );

  static final spacehorizontal_small = SizedBox(
    width: 5,
  );
  static final spacehorizontal_medium = SizedBox(
    width: 10,
  );
  static final spacehorizontal_large = SizedBox(
    width: 20,
  );

  //textform field border

  static const outlinedBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(8)),
  );

  static const focusBorder = OutlineInputBorder(
    borderSide: BorderSide(
      color: Color(0xFF1597D5),
    ),
    borderRadius: BorderRadius.all(Radius.circular(8)),
  );

  static const errorBorder = OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.red,
    ),
    borderRadius: BorderRadius.all(Radius.circular(8)),
  );

  static const primaryGradient = LinearGradient(
    colors: [Color(0xFF1596D5), Colors.white],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const primaryGradient_LeftToRight = LinearGradient(
    colors: [
      Color(0xFFCCE6F3),
      Color(0xFF87CAF0),
      Color(0xFF71BCE7),
      Color(0xFF219CD8),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const primaryGradient_font = LinearGradient(
    colors: [
      Color(0xFF00264D),
      Color(0xFF004080),
      Color(0xFF0E639C),
      Color(0xFF219CD8),
      Color(0xFF71BCE7),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
/*
  static const gradient_background = LinearGradient(
    colors: [
      Color(0xFFCCE6F3), // Light Blue
      Color(0xFF87CAF0), // Blue
      Color(0xFF71BCE7), // Dark Blue
      Color(0xFF219CD8), // Very Dark Blue
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    stops: [0.0, 0.3, 0.7, 1.0],
  );
*/
  static const primaryColor = Color(0xFF1596D5);
}
