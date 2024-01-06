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
  // Use the gradient as the primary color
  static const primaryColor = Color(0xFF1596D5);
}
