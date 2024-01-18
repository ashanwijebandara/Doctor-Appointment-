import 'package:doctorapp/components/login_form.dart';
import 'package:doctorapp/components/social_button.dart';
import 'package:doctorapp/utils/config.dart';
import 'package:doctorapp/utils/text.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Text(
                  AppText.enText['signIn']!,
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
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    child: Text('Sign In'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/register');
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.black,
                      textStyle: const TextStyle(
                        fontFamily: 'Source Sans Pro',
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    child: Text('Sign Up'),
                  ),
                ],
              ),
              Config.spaceSmall,
              const LoginForm(),
              Config.spaceSmall,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SocialButton(
                      social: 'google',
                      onPressed: () {
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
                        print('Google button clicked');
                      }),
                  SocialButton(
                      social: 'linkedin',
                      onPressed: () {
                        print('Google button clicked');
                      }),
                ],
              ),
              Config.spaceSmall,
              Image.asset('assets/downpic.jpg'),
            ],
          ),
        ),
      ),
    );
  }
}
