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
    super.initState();

    // Simulate a loading delay
    Future.delayed(Duration(seconds: 5), () {
      // After the delay, navigate to the home screen
      Navigator.of(context).pushNamed('/register');
      //Navigator.pushReplacementNamed(context, '/');
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF4AA6D1),
      //appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(140.0),
              bottomRight: Radius.circular(200.0),
            ),
            child: Container(
              width: double.infinity,
              child: Image.asset(
                "assets/coverphoto.jpg",
                fit: BoxFit.cover,
                height: 500.0,
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
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
          SizedBox(height: 50.0),
          Center(
            child: CircularProgressIndicator(
              color: Color(0xFFFFD302),
            ),
          ),
        ],
      ),
    );
  }
}
