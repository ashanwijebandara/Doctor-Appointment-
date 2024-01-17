//import 'package:doctorapp/components/doctor_card.dart';
import 'package:doctorapp/components/doctor_card.dart';
import 'package:doctorapp/utils/config.dart';
import 'package:flutter/material.dart';

class Favourite_Doctor_Page extends StatefulWidget {
  const Favourite_Doctor_Page({super.key});

  @override
  State<Favourite_Doctor_Page> createState() => _Favourite_Doctor_PageState();
}

class _Favourite_Doctor_PageState extends State<Favourite_Doctor_Page> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
        child: Column(
          children: [
            Text(
              'My Favourite Doctors',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Config.spaceSmall,
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return DoctorCard(
                    doctorName: 'Dr McClum',
                    doctorCategory: 'Cardiology',
                    doctorHospital: 'Kandy Hospital',
                    imgRoute: 'assets/doctor_3.jpg',
                    doctorRating: '9',
                    doctorReview: '(20)',
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
