import 'package:cloud_firestore/cloud_firestore.dart';

class DoctorController {
  Future<QuerySnapshot> searchDoctors(String query) async {
    
    return await FirebaseFirestore.instance
        .collection('doctors')
        .where('doc_name', isGreaterThanOrEqualTo: query)
        .where('doc_name', isLessThan: query + 'z')
        .get();
  }

  Future<QuerySnapshot> getDoctorList() async {
   
    return await FirebaseFirestore.instance.collection('doctors').get();
  }
}
