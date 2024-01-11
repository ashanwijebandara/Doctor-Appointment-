import 'package:doctorapp/controllers/auth_controller.dart';
import 'package:doctorapp/utils/config.dart';
import 'package:flutter/material.dart';
//import 'package:doctorapp/screens/auth_page.dart';

class StartingPage extends StatefulWidget {
  const StartingPage({super.key});

  @override
  State<StartingPage> createState() => _startingPageState();
}

class _startingPageState extends State<StartingPage> {
  @override
  void initState() {
    AuthController().isUserAlreadyLoggedIn();
    super.initState();

    // Simulate a loading delay
    Future.delayed(Duration(seconds: 50), () {
      // After the delay, navigate to the home screen
      Navigator.of(context).pushNamed('/register');
      //Navigator.pushReplacementNamed(context, '/');
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      //appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 120,
          ),
          Center(
            child: Image.asset(
              "assets/MedicLogo.png",
              width: 300,
              height: 250,
            ),
          ),
          Center(
            child: Column(
              children: [
                ShaderMask(
                  shaderCallback: (Rect bounds) {
                    return Config.primaryGradient_font.createShader(bounds);
                  },
                  child: Text(
                    "MEDIC",
                    style: TextStyle(
                      fontSize: 70,
                      fontWeight: FontWeight.bold,
                      color: Colors.white, // Font color
                    ),
                  ),
                ),
                Text(
                  "HEALTH CARE",
                  style: TextStyle(
                    color: Color.fromARGB(255, 127, 147, 157),
                    fontSize: 35,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 8.0, // Adjust letter spacing (font width)
                    wordSpacing: 5.0,
                  ),
                ),
                Text(
                  "FAMILY DOCTOR",
                  style: TextStyle(
                    color: Color.fromARGB(255, 180, 200, 210),
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 3.0,
                  ),
                ),
              ],
            ),
          ),
          /*
          ClipRRect(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(140.0),
              bottomRight: Radius.circular(200.0),
            ),
            child: Container(
              width: double.infinity,
              child: Image.asset(
                "assets/Medic.png",
                fit: BoxFit.cover,
                height: 500.0,
              ),
            ),
          ),
          */
          const SizedBox(
            height: 30,
          ),
          /*
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "MEDIC",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Image.asset(
                "assets/icon.jpg",
                width: 100,
              ),
            ],
          ),
          */
          SizedBox(height: 50.0),
          Center(
            child: CircularProgressIndicator(
              color: Config.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
