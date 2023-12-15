import 'package:flutter/material.dart';

class SocialButton extends StatelessWidget {
  const SocialButton({Key? key, required this.social}) : super(key: key);

  final String social;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {},
      child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.3,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                'assets/$social.png',
                width: 40,
                height: 40,
              ),
              Text(
                social.toUpperCase(),
                style: const TextStyle(
                  color: Colors.black,
                ),
              )
            ],
          )),
    );
  }
}
