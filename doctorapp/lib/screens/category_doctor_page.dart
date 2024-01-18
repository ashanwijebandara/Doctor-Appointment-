import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctorapp/components/doctor_card.dart';
import 'package:flutter/material.dart';

class CategoryDoctorPage extends StatelessWidget {
  final String category;

  CategoryDoctorPage({required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Doctors in $category'),
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
                // Handle doctor card tap if needed
              },
            );
          },
        );
      },
    );
  }
}
