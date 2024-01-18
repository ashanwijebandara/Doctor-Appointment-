import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctorapp/components/doctor_card.dart';
import 'package:doctorapp/screens/doctor_details.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CategoryDoctorPage extends StatelessWidget {
  final String category;

  CategoryDoctorPage({required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.only(left: 50.0),
          child: Text(
            'Doctors in $category',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.w600, fontSize: 18),
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_rounded),
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: DoctorList(category: category),
    );
  }
}

class DoctorList extends StatelessWidget {
  final String category;

  DoctorList({required this.category});

  @override
  Widget build(BuildContext context) {
    String getCurrentUserId() {
      User? user = FirebaseAuth.instance.currentUser;
      return user?.uid ?? '';
    }

    String userId = getCurrentUserId();
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('doctors')
          .where('docCategory', isEqualTo: category)
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        var doctors = snapshot.data!.docs;

        if (doctors.isEmpty) {
          return Center(
            child: Text('No doctors available in this category.'),
          );
        }

        return ListView.builder(
          itemCount: doctors.length,
          itemBuilder: (context, index) {
            var doctor = doctors[index].data() as Map<String, dynamic>;

            return DoctorCard(
              doctorName: doctor['doc_name'],
              doctorCategory: doctor['docCategory'],
              doctorHospital: doctor['docAddress'],
              doctorRating: doctor['docRating'],
              doctorReview: doctor['docReview'],
              imgRoute: doctor['imgRoute'],
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DoctorDetails(
                              id: doctor['docId'],
                              userId: userId,
                            )));
              },
            );
          },
        );
      },
    );
  }
}
