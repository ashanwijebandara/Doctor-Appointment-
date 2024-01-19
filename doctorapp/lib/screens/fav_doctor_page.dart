import 'package:doctorapp/components/doctor_card.dart';
import 'package:doctorapp/screens/doctor_details.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Favourite_Doctor_Page extends StatefulWidget {
  const Favourite_Doctor_Page({Key? key}) : super(key: key);

  @override
  State<Favourite_Doctor_Page> createState() => _Favourite_Doctor_PageState();
}

class _Favourite_Doctor_PageState extends State<Favourite_Doctor_Page> {
  final CollectionReference doctorsCollection =
      FirebaseFirestore.instance.collection('doctors');

  @override
  Widget build(BuildContext context) {
    String getCurrentUserId() {
      User? user = FirebaseAuth.instance.currentUser;
      return user?.uid ?? '';
    }

    String userId = getCurrentUserId();
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
            SizedBox(height: 10),
            Expanded(
              child: StreamBuilder<DocumentSnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('users')
                    .doc(userId) // Use the actual user ID here
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  }

                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  }

                  if (!snapshot.hasData || !snapshot.data!.exists) {
                    return Text('No favorite doctors.');
                  }

                  List<dynamic>? favoriteDoctors =
                      snapshot.data!.get('favoriteDoctors');

                  if (favoriteDoctors == null || favoriteDoctors.isEmpty) {
                    return Text('No favorite doctors.');
                  }

                  return ListView.builder(
                    itemCount: favoriteDoctors.length,
                    itemBuilder: (context, index) {
                      String doctorId = favoriteDoctors[index];
                      return FutureBuilder<DocumentSnapshot>(
                        future: doctorsCollection.doc(doctorId).get(),
                        builder: (context, doctorSnapshot) {
                          if (doctorSnapshot.connectionState ==
                              ConnectionState.waiting) {
                            return CircularProgressIndicator();
                          }

                          if (doctorSnapshot.hasError) {
                            return Text('Error: ${doctorSnapshot.error}');
                          }

                          if (!doctorSnapshot.hasData ||
                              !doctorSnapshot.data!.exists) {
                            return Text('Doctor not found.');
                          }

                          // Display the details of the favorite doctor
                          Map<String, dynamic> doctorData = doctorSnapshot.data!
                              .data() as Map<String, dynamic>;
                          // String docName = doctorData['doc_name'];

                          return DoctorCard(
                            doctorName: doctorData['doc_name'],
                            doctorCategory: doctorData['docCategory'],
                            doctorHospital: doctorData['docAddress'],
                            doctorRating: doctorData['docRating'],
                            doctorReview: doctorData['docReview'],
                            imgRoute: doctorData['imgRoute'],
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DoctorDetails(
                                    id: doctorData['docId'],
                                    userId: userId,
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      );
                    },
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
