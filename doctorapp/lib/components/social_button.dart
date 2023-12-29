import 'package:flutter/material.dart';

class SocialButton extends StatelessWidget {
  const SocialButton(
      {Key? key, required this.social, required Null Function() onPressed})
      : super(key: key);

  final String social;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/$social.png',
                width: 30,
                height: 30,
              ),
            ],
          )),
    );
  }
}
