import 'package:doctorapp/components/register_form.dart';
import 'package:doctorapp/components/social_button.dart';
import 'package:doctorapp/utils/config.dart';
import 'package:doctorapp/utils/text.dart';
import 'package:flutter/material.dart';

class AuthPageRegister extends StatefulWidget {
  const AuthPageRegister({Key? key}) : super(key: key);

  @override
  State<AuthPageRegister> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPageRegister> {
  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
        child: SafeArea(
          child: ListView(
            children: <Widget>[
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/');
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.black,
                      textStyle: const TextStyle(
                        fontFamily: 'Source Sans Pro',
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    child: Text('Sign In'),
                  ),
                  TextButton(
                    onPressed: () {
                      // Navigator.of(context).pushNamed('/register');
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.black,
                      textStyle: const TextStyle(
                        fontFamily: 'Source Sans Pro',
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    child: Text('Sign Up'),
                  ),
                ],
              ),
              Config.spaceSmall,
              RegisterForm(),
              Config.spaceMedium,
              Spacer(),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SocialButton(
                      social: 'google',
                      onPressed: () {
                        // Handle Google button click
                        print('Google button clicked');
                      }),
                  SocialButton(
                      social: 'facebook',
                      onPressed: () {
                        // Handle Google button click
                        print('Google button clicked');
                      }),
                  SocialButton(
                      social: 'twitter',
                      onPressed: () {
                        // Handle Google button click
                        print('Google button clicked');
                      }),
                  SocialButton(
                      social: 'linkedin',
                      onPressed: () {
                        // Handle Google button click
                        print('Google button clicked');
                      }),
                ],
              ),
              Config.spaceSmall,
              Image.asset(
                'assets/downpic.jpg',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
