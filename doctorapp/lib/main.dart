import 'package:doctorapp/main_layout.dart';
import 'package:doctorapp/screens/auth_page.dart';
import 'package:doctorapp/screens/auth_page_register.dart';
import 'package:doctorapp/screens/booking_page.dart';
import 'package:doctorapp/screens/doctor_details.dart';
import 'package:doctorapp/screens/edit_profile_page.dart';
import 'package:doctorapp/screens/profile_page.dart';
import 'package:doctorapp/screens/starting_page.dart';
import 'package:doctorapp/screens/success_booked.dart';
import 'package:doctorapp/utils/config.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: 'AIzaSyB0WRPB6EhbCW_pci7K-ZPj2QROhcndcaY',
        appId: "1:1006962405275:web:ee723ebb5aa1ac2054bb3e",
        messagingSenderId: '1006962405275',
        projectId: 'doctor-appointment-booki-b0ed3'),
  ); //initialize firebase
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static final navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    //define theme data here

    return MaterialApp(
      navigatorKey: navigatorKey,
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        inputDecorationTheme: const InputDecorationTheme(
          focusColor: Config.primaryColor,
          border: Config.outlinedBorder,
          focusedBorder: Config.focusBorder,
          errorBorder: Config.errorBorder,
          enabledBorder: Config.outlinedBorder,
          prefixIconColor: Colors.black38,
        ),
        scaffoldBackgroundColor: Colors.white,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Config.primaryColor,
          selectedItemColor: Colors.white,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          unselectedItemColor: Colors.grey.shade700,
          elevation: 10,
          type: BottomNavigationBarType.fixed,
        ),
      ),
      initialRoute: 'start',
      routes: {
        //initial route page
        'start': (context) => const StartingPage(),
        '/': (context) => const AuthPage(),
        '/register': (context) => const AuthPageRegister(),
        'main': (context) => const MainLayout(),
        // 'doc_details': (context) => const DoctorDetails(),
        'booking_page': (context) => const BookingPage(),
        'success_booking': (context) => const AppoinmentBooked(),
        'profile': (context) => const ProfilePage(),
        'edit_profile': (context) => const EditProfilePage(),
      },
    );
  }
}
