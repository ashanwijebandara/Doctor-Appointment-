import 'package:doctorapp/controllers/auth_controller.dart';
import 'package:doctorapp/components/button.dart';
import 'package:doctorapp/utils/config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
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
        Text(
          controller.errorMessageLog,
          style: TextStyle(
            color: Colors.red,
            fontSize: 14,
          ),
        ),
        Config.spaceSmall,
        Button(
            width: double.infinity,
            title: 'Sign In',
            onPressed: () async {
              await controller.loginUser();
              if (controller.userCredential != null) {
                Navigator.of(context).pushNamed('main');
              } else {
                // Clear the error message before displaying a new one
                controller.errorMessageLog = '';
                // Show error message under the password field
                setState(() {
                  controller.errorMessageLog = 'Incorrect username or password.';
                });
              }
              // Navigator.of(context).pushNamed('main');
            },
            disable: false),
      ]),
    );
  }
/*
  void showErrorMessage(BuildContext context, String message) {
    if (message.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: Colors.red,
        ),
      );
    }
  }*/
}
