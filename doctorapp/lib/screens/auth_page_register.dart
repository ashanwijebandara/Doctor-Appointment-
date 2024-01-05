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
                    print('Sign Up button pressed!');
                  },
                  style: TextButton.styleFrom(
                    primary: Colors.black,
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
                    print('Sign Up button pressed!');
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
            const RegisterForm(),
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
                    }), // No specific action
                // Add more SocialButton widgets as needed
              ],
            ),
            Config.spaceSmall,
            Image.asset(
              'assets/downpic.jpg',
            ),
          ],
        )),
      ),
    );
  }
}

// import 'package:doctorapp/components/register_form.dart';
// import 'package:doctorapp/components/social_button.dart';
// import 'package:doctorapp/utils/config.dart';
// import 'package:doctorapp/utils/text.dart';
// import 'package:flutter/material.dart';

// class AuthPageRegister extends StatefulWidget {
//   const AuthPageRegister({Key? key}) : super(key: key);

//   @override
//   State<AuthPageRegister> createState() => _AuthPageState();
// }

// class _AuthPageState extends State<AuthPageRegister> {
//   @override
//   Widget build(BuildContext context) {
//     Config().init(context);
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
//         child: SafeArea(
//           child: SingleChildScrollView(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Center(
//                   child: Text(
//                     AppText.enText['signUp']!,
//                     style: const TextStyle(
//                       fontFamily: 'Source Sans Pro',
//                       fontSize: 30,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//                 Config.spaceSmall,
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     TextButton(
//                       onPressed: () {
//                         print('Sign In button pressed!');
//                       },
//                       style: TextButton.styleFrom(
//                         primary: Colors.black,
//                         textStyle: const TextStyle(
//                           fontFamily: 'Source Sans Pro',
//                           fontWeight: FontWeight.w600,
//                           fontSize: 16,
//                         ),
//                       ),
//                       child: Text('Sign In'),
//                     ),
//                     TextButton(
//                       onPressed: () {
//                         print('Sign Up button pressed!');
//                       },
//                       style: TextButton.styleFrom(
//                         primary: Colors.black,
//                         textStyle: const TextStyle(
//                           fontFamily: 'Source Sans Pro',
//                           fontWeight: FontWeight.w600,
//                           fontSize: 16,
//                         ),
//                       ),
//                       child: Text('Sign Up'),
//                     ),
//                   ],
//                 ),
//                 Config.spaceSmall,
//                 const RegisterForm(),
//                 Config.spaceSmall,
//                 const Spacer(),
//                 Center(
//                   child: Text(
//                     AppText.enText['social-login']!,
//                     style: TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.normal,
//                       color: Colors.grey.shade500,
//                     ),
//                   ),
//                 ),
//                 Config.spaceSmall,
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     SocialButton(
//                         social: 'google',
//                         onPressed: () {
//                           // Handle Google button click
//                           print('Google button clicked');
//                         }),
//                     SocialButton(
//                         social: 'facebook',
//                         onPressed: () {
//                           // Handle Facebook button click
//                           print('Facebook button clicked');
//                         }),
//                     SocialButton(
//                         social: 'twitter',
//                         onPressed: () {
//                           // Handle Twitter button click
//                           print('Twitter button clicked');
//                         }),
//                     SocialButton(
//                         social: 'linkedin',
//                         onPressed: () {
//                           // Handle LinkedIn button click
//                           print('LinkedIn button clicked');
//                         }),
//                     // Add more SocialButton widgets as needed
//                   ],
//                 ),
//                 Config.spaceSmall,
//                 Image.asset(
//                   'assets/downpic.jpg',
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
