//import 'package:doctorapp/components/doctor_card.dart';
//import 'package:doctorapp/components/doctor_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctorapp/components/doctor_card.dart';
import 'package:doctorapp/controllers/home_controller.dart';
import 'package:doctorapp/screens/doctor_details.dart';
import 'package:doctorapp/utils/config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Favourite_Doctor_Page extends StatefulWidget {
  const Favourite_Doctor_Page({super.key});

  @override
  State<Favourite_Doctor_Page> createState() => _Favourite_Doctor_PageState();
}

class _Favourite_Doctor_PageState extends State<Favourite_Doctor_Page> {
  @override
  Widget build(BuildContext context) {
    var doctor_controller = Get.put(HomeController());
    return SafeArea(
      child: SingleChildScrollView(
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
              FutureBuilder<QuerySnapshot>(
                future: doctor_controller.getDoctorList(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    var data = snapshot.data?.docs;
                    // log(data!.length.toString());
                    return Column(
                      children: List.generate(data!.length ?? 0, (index) {
                        return DoctorCard(
                          doctorName: data![index]['doc_name'],
                          doctorCategory: data![index]['docCategory'],
                          doctorHospital: data![index]['docAddress'],
                          doctorRating: data![index]['docRating'],
                          doctorReview: data![index]['docReview'],
                          imgRoute: data![index]['imgRoute'],
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DoctorDetails(
                                        id: data![index]['docId'])));
                          },
                        );
                      }),
                    );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
