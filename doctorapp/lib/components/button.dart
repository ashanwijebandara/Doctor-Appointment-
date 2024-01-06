import 'package:doctorapp/utils/config.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button(
      {Key? key,
      required this.width,
      required this.title,
      required this.onPressed,
      required this.disable})
      : super(key: key);

  final double width;
  final String title;
  final bool disable;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          //backgroundColor: Config.primaryColor,
          //foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
                0.0), // Set your desired border radius here
          ),
          padding: EdgeInsets.only(left: 16, right: 16),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        onPressed: disable ? null : onPressed,
        child: Container(
          height: 40,
          decoration: BoxDecoration(
            gradient: Config.primaryGradient_LeftToRight,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Center(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontFamily: 'Source Sans Pro',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
