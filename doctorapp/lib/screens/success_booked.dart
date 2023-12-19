import 'package:doctorapp/components/button.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AppoinmentBooked extends StatelessWidget {
  const AppoinmentBooked({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 3,
            child: Lottie.asset('assets/success.json'),
          ),
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            child: Text(
              'Successfully Booked',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 20,
            ),
            child: Button (
              width: double.infinity,
              title: 'Back to Home',
              onPressed: () {
                Navigator.of(context).pushNamedAndRemoveUntil(
                  '/',
                  (route) => false,
                );
              },
              disable: false,
            )
          )
        ],
      )),
    );
  }
}
