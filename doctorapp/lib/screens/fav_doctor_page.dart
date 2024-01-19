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
    return Scaffold(
      appBar: AppBar(
        title: Text('My Favourite Doctors'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: StreamBuilder<DocumentSnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('users')
                    .doc(userId)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }

                  if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  }

                  if (!snapshot.hasData || !snapshot.data!.exists) {
                    return Center(child: Text('No favorite doctors.'));
                  }

                  Map<String, dynamic>? userData =
                      snapshot.data!.data() as Map<String, dynamic>?;

                  if (userData == null ||
                      !userData.containsKey('favoriteDoctors')) {
                    return Center(child: Text('No favorite doctors.'));
                  }

                  List<dynamic>? favoriteDoctors = userData['favoriteDoctors'];

                  if (favoriteDoctors == null || favoriteDoctors.isEmpty) {
                    return Center(child: Text('No favorite doctors.'));
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
                            return Center(child: CircularProgressIndicator());
                          }

                          if (doctorSnapshot.hasError) {
                            return Center(
                                child: Text('Error: ${doctorSnapshot.error}'));
                          }

                          if (!doctorSnapshot.hasData ||
                              !doctorSnapshot.data!.exists) {
                            return Center(child: Text('Doctor not found.'));
                          }

                          // Display the details of the favorite doctor
                          Map<String, dynamic> doctorData = doctorSnapshot.data!
                              .data() as Map<String, dynamic>;

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
