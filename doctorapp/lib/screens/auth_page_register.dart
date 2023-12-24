import 'package:doctorapp/components/register_form.dart';
import 'package:doctorapp/components/social_button.dart';
import 'package:doctorapp/utils/config.dart';
import 'package:doctorapp/utils/text.dart';
import 'package:flutter/material.dart';

class AuthPageRegister extends StatefulWidget {
  const AuthPageRegister({super.key});

  @override
  State<AuthPageRegister> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPageRegister> {
  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              AppText.enText['welcome_text']!,
              style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            ),
            Config.spaceSmall,
            Center(
              child: Text(
                AppText.enText['signUp']!,
                style: const TextStyle(
                  fontFamily: 'Source Sans Pro',
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Config.spaceSmall,
            const RegisterForm(),
            const Spacer(),
            Center(
              child: Text(
                AppText.enText['social-login']!,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: Colors.grey.shade500,
                ),
              ),
            ),
            Config.spaceSmall,
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SocialButton(social: 'google'),
                SocialButton(social: 'facebook'),
              ],
            ),
            Config.spaceSmall,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AppText.enText['signIn_text']!,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Colors.grey.shade500,
                  ),
                ),
                const Text(
                  ' Sign In',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            )
          ],
        )),
      ),
    );
  }
}
