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
            backgroundColor: Config.primaryColor,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                  0.0), // Set your desired border radius here
            ),
          ),
          onPressed: disable ? null : onPressed,
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: 'Source Sans Pro',
            ),
          )),
    );
  }
}
