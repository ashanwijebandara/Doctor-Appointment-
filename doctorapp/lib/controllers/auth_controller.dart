import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';


class AuthController extends GetxController {
  var usernameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  UserCredential? userCredential;

  isUserAlreadyLoggedIn() async {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        Navigator.of(Get.context!).pushNamed('/');
      } else {
        Navigator.of(Get.context!).pushNamed('main');
      }
    });
  }

  String errorMessageReg = '';
  String errorMessageLog = '';
  /*
  loginUser() async {
    userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text, password: passwordController.text);
  }*/
  loginUser() async {
    try {
      userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);

      errorMessageLog = ''; 
    } on FirebaseAuthException catch (e) {
      errorMessageLog = 'Sorry, your password or username is incorrect.';
      print(e);
    }
  }

  signupUser() async {
    try {
      userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailController.text, password: passwordController.text);

      
      await storeUserData(
        userCredential!.user!.uid,
        usernameController.text,
        emailController.text,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        errorMessageReg = 'User already exists! Try logging in.';
      } else {
        errorMessageReg = 'Registration failed. Please try again later.';
      }
    }
  }

  storeUserData(String uid, String username, String email) async {
    var store = FirebaseFirestore.instance.collection('users').doc(uid);
    await store.set({
      'username': username,
      'email': email,
      'age': 'Not Set',
      'gender': 'Not Set',
      'address': 'Not Set',
    });
  }

  signout() async {
    await FirebaseAuth.instance.signOut();
  }

  
}
