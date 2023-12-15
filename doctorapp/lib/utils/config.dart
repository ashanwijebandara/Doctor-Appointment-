import 'package:flutter/material.dart';

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
    height: 25,
  );
  static final spaceMedium = SizedBox(
    height: screenHeight! * 0.05,
  );

  static final spaceBig = SizedBox(
    height: screenHeight! * 0.08,
  );

  //textform field border

  static const outlinedBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(8)),
  );

  static const focusBorder = OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.greenAccent,
    ),
    borderRadius: BorderRadius.all(Radius.circular(8)),
  );
  static const errorBorder = OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.red,
    ),
    borderRadius: BorderRadius.all(Radius.circular(8)),
  );

  static const primaryColor = Colors.greenAccent;
}
