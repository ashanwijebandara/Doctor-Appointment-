import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctorapp/components/appoinment_cart.dart';
import 'package:doctorapp/components/doctor_card.dart';
import 'package:doctorapp/controllers/current_user_controller.dart';
import 'package:doctorapp/controllers/home_controller.dart';
//import 'package:doctorapp/screens/category_doctor_page.dart';
import 'package:doctorapp/utils/config.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
//import 'package:get/get_core/src/get_main.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> medCat = [
    {
      "icon": FontAwesomeIcons.userDoctor,
      "category": "Genaral",
    },
    {
      "icon": FontAwesomeIcons.heartPulse,
      "category": "Cardiology",
    },
    {
      "icon": FontAwesomeIcons.lungs,
      "category": "Respiratory",
    },
    {
      "icon": FontAwesomeIcons.hand,
      "category": "Dermotology",
    },
    {
      "icon": FontAwesomeIcons.personPregnant,
      "category": "Gynecology",
    },
    {
      "icon": FontAwesomeIcons.teeth,
      "category": "Dental",
    },
  ];
  @override
  Widget build(BuildContext context) {
    Config().init(context);
    var user_controller = Get.put(CurrentUserController());
    var doctor_controller = Get.put(HomeController());
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 15,
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage('assets/profile1.jpg'),
                    ),
                    Config.spacehorizontal_medium,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hello,',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFFADA4A5)),
                        ),
                        Text(
                          user_controller.username.value,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                Config.spaceMedium,
                const Text(
                  'Category',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Config.spaceSmall,
                SizedBox(
                  height: Config.heightsize * 0.07,
                  child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: List<Widget>.generate(medCat.length, (index) {
                        return GestureDetector(
                          /*onTap: () {
                            // Navigate to the new page with the selected category
                            //Get.to(CategoryDoctorsPage(
                                category: medCat[index]['category']));
                          },*/
                          child: Card(
                              margin: EdgeInsets.only(right: 20),
                              color: Config.primaryColor,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    FaIcon(
                                      medCat[index]['icon'],
                                      color: Colors.white,
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      medCat[index]['category'],
                                      style: const TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                        );
                      })),
                ),
                Config.spaceSmall,
                const Text(
                  'Appoinment Today',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Config.spaceSmall,
                AppoinmentCard(),
                Config.spaceSmall,
                const Text(
                  'Top Doctors',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // doctor list
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
                              imgRoute: 'assets/doctor_1.jpg',
                              doctorRating: data![index]['docRating'],
                              doctorReview: data![index]['docReview'],
                            );
                          }),
                        );
                      }
                    }),
                // Column(
                //   children: List.generate(5, (index) {
                //     return DoctorCard(
                //       route: 'doc_details',
                //     );
                //   }),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
