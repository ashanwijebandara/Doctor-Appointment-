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

  loginUser() async {
    userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text, password: passwordController.text);
  }
  signupUser() async {
    userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text, password: passwordController.text);

    await storeUserData(userCredential!.user!.uid, usernameController.text,
        emailController.text);
  }

  storeUserData(String uid, String username, String email) async {
    var store = FirebaseFirestore.instance.collection('users').doc(uid);
    await store.set({
      'username': username,
      'email': email,
    });
  }
  signout() async {
    await FirebaseAuth.instance.signOut();
  }
}
