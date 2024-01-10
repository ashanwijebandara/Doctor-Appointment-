import 'package:doctorapp/components/auth_controller.dart';
import 'package:doctorapp/components/button.dart';
import 'package:doctorapp/utils/config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:firebase_auth/firebase_auth.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();

  bool obsecurePass = true;
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AuthController());
    return Form(
      key: _formKey,
      child:
          Column(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
        TextFormField(
          controller: controller.emailController,
          keyboardType: TextInputType.emailAddress,
          cursorColor: Config.primaryColor,
          decoration: const InputDecoration(
            hintText: 'Email Address',
            hintStyle: TextStyle(color: Color(0xFFA6A6A6)),
            labelText: 'Email',
            alignLabelWithHint: true,
            prefixIcon: Icon(Icons.email_outlined),
            prefixIconColor: Config.primaryColor,
          ),
        ),
        Config.spaceSmall,
        TextFormField(
          controller: controller.usernameController,
          keyboardType: TextInputType.emailAddress,
          cursorColor: Config.primaryColor,
          decoration: const InputDecoration(
            hintText: 'User Name',
            hintStyle: TextStyle(color: Color(0xFFA6A6A6)),
            labelText: 'User Name',
            alignLabelWithHint: true,
            prefixIcon: Icon(Icons.account_circle_outlined),
            prefixIconColor: Config.primaryColor,
          ),
        ),
        Config.spaceSmall,
        TextFormField(
          controller: controller.passwordController,
          keyboardType: TextInputType.visiblePassword,
          cursorColor: Config.primaryColor,
          obscureText: obsecurePass,
          decoration: InputDecoration(
              hintText: 'Password',
              hintStyle: TextStyle(color: Color(0xFFA6A6A6)),
              labelText: 'Password',
              alignLabelWithHint: true,
              prefixIcon: Icon(Icons.lock_outline),
              prefixIconColor: Config.primaryColor,
              suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      obsecurePass = !obsecurePass;
                    });
                  },
                  icon: obsecurePass
                      ? const Icon(
                          Icons.visibility_off_outlined,
                          color: Colors.black38,
                        )
                      : const Icon(
                          Icons.visibility_outlined,
                          color: Color(0xFF1597D5),
                        ))),
        ),
        Config.spaceSmall,
        Button(
            width: double.infinity,
            title: 'Sign Up',
            onPressed: () async {
              await controller.signupUser();
              if (controller.userCredential != null) {
                Navigator.of(context).pushNamed('main');
              }
              /*
              await FirebaseAuth.instance.createUserWithEmailAndPassword(
                  email: _emailController.text, password: _passController.text);*/
              // Navigator.of(context).pushNamed('/');
            },
            disable: false),
      ]),
    );
  }
}
