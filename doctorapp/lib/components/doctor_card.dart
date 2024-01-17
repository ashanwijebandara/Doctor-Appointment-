//import 'package:doctorapp/utils/config.dart';
import 'package:doctorapp/screens/doctor_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class DoctorCard extends StatelessWidget {
  const DoctorCard({
    Key? key,
    required this.imgRoute,
    required this.doctorName,
    required this.doctorCategory,
    required this.doctorHospital,
    required this.doctorRating,
    required this.doctorReview,
  }) : super(key: key);

  final String imgRoute;

  final String doctorName;
  final String doctorCategory;
  final String doctorHospital;
  final String doctorRating;
  final String doctorReview;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      height: 150,
      child: GestureDetector(
        child: Card(
          elevation: 5,
          color: Color(0xFFFAFAFA),
          child: Row(children: [
            const SizedBox(
              width: 15,
            ),
            CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage(imgRoute),
            ),
            const SizedBox(
              width: 10,
            ),
            Flexible(
                child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    doctorName,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Row(children: [
                    Text(
                      doctorCategory,
                      style: TextStyle(color: Color(0xFFADA4A5)),
                    ),
                    Text(
                      '  |  $doctorHospital',
                      style: TextStyle(color: Color(0xFFADA4A5)),
                    ),
                  ]),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.star_border,
                        color: Colors.yellow,
                        size: 16,
                      ),
                      Spacer(
                        flex: 1,
                      ),
                      Text(doctorRating),
                      Spacer(
                        flex: 1,
                      ),
                      Text('Review'),
                      Spacer(
                        flex: 1,
                      ),
                      Text(doctorReview),
                      Spacer(
                        flex: 7,
                      ),
                    ],
                  ),
                ],
              ),
            ))
          ]),
        ),
        onTap: () {
          Get.to(() => DoctorDetails());
        },
      ),
    );
  }
}
