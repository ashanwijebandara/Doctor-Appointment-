import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctorapp/components/button.dart';
import 'package:doctorapp/screens/fav_doctor_page.dart';
import 'package:doctorapp/controllers/fav_doctor_controller.dart';
import 'package:doctorapp/utils/config.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/custom_appbar.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DoctorDetails extends StatefulWidget {
  DoctorDetails({required this.id, required this.userId});

  final String id;
  final String userId;

  @override
  State<DoctorDetails> createState() => _DoctorDetailsState();
}

Future<void> markAsFavorite(String userId, String doctorId) async {
  try {
    DocumentReference userRef =
        FirebaseFirestore.instance.collection('users').doc(userId);
    await userRef.update({
      'favoriteDoctors': FieldValue.arrayUnion([doctorId]),
    });
  } catch (error) {
    print('Error marking doctor as favorite: $error');
  }
}

class _DoctorDetailsState extends State<DoctorDetails> {
  FavoriteDoctorsController favoriteDoctorsController =
      FavoriteDoctorsController();
  bool isFav = false;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appTitle: 'Doctor Details',
        icon: FaIcon(
          Icons.arrow_back_ios_rounded,
        ),
        actions: [
          IconButton(
            onPressed: () async {
              setState(() {
                isFav = !isFav;
                if (isFav) {
                  favoriteDoctorsController.addToFavorites(widget.id);
                } else {
                  favoriteDoctorsController.removeFromFavorites(widget.id);
                }
              });
              User? user = _auth.currentUser;
              if (user != null) {
                // Use the actual user ID
                String userId = user.uid;
                await markAsFavorite(userId, widget.id);
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Favourite_Doctor_Page(),
                  ),
                );
              } else {
                print('User not authenticated.');
                // Handle the case where the user is not authenticated.
              }
            },
            icon: FaIcon(
              isFav ? Icons.favorite_rounded : Icons.favorite_outline,
              color: Config.primaryColor,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          children: [
            AboutDoctor(id: widget.id),
            DetailBody(id: widget.id),
            Padding(
              padding: const EdgeInsets.only(
                right: 20,
                left: 20,
              ),
              child: Button(
                width: double.infinity,
                title: 'Book Appointment',
                onPressed: () {
                  Navigator.of(context)
                      .pushNamed('booking_page', arguments: widget.id);
                },
                disable: false,
              ),
            )
          ],
        )),
      ),
    );
  }
}

class AboutDoctor extends StatefulWidget {
  AboutDoctor({required this.id});

  final String id;

  @override
  State<AboutDoctor> createState() => _AboutDoctorState();
}

class _AboutDoctorState extends State<AboutDoctor> {
  String? docName;
  String? docImage;
  String? docQualification;
  String? docHospital;

  @override
  void initState() {
    getDoctorData();
    super.initState();
  }

  Future<void> getDoctorData() async {
    DocumentSnapshot userSnapshot = await FirebaseFirestore.instance
        .collection('doctors')
        .doc(widget.id)
        .get();

    setState(() {
      docName = userSnapshot['doc_name'];
      docImage = userSnapshot['imgRoute'];
      docQualification = userSnapshot['docQualification'];
      docHospital = userSnapshot['docHospital'];
    });
  }

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: Config.primaryGradient,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: Column(
        children: [
          Config.spaceSmall,
           CircleAvatar(
            radius: 55,
            backgroundImage: AssetImage('$docImage'),
            backgroundColor: Colors.white,
          ),
          Config.spaceSmall,
          Text(
            docName!,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Config.spaceSmall,
          SizedBox(
            width: Config.screenWidth! * 0.8,
            child: Text(
              docQualification!,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey.shade700,
              ),
              softWrap: true,
            ),
          ),
          Config.spaceSmall,
          SizedBox(
            width: Config.screenWidth! * 0.8,
            child: Text(
              docHospital!,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              softWrap: true,
            ),
          ),
        ],
      ),
    );
  }
}

class DetailBody extends StatefulWidget {
  DetailBody({required this.id});

  final String id;

  @override
  State<DetailBody> createState() => _DetailBodyState();
}

class _DetailBodyState extends State<DetailBody> {
  String? docAbout;
  String? docPatients;
  String? docExperience;
  String? docRating;
  String? docTiming;
  String? docHospital;

  @override
  void initState() {
    getDoctorData();
    super.initState();
  }

  Future<void> getDoctorData() async {
    DocumentSnapshot userSnapshot = await FirebaseFirestore.instance
        .collection('doctors')
        .doc(widget.id)
        .get();

    setState(() {
      docAbout = userSnapshot['docAbout'];
      docExperience = userSnapshot['docExperience'];
      docPatients = userSnapshot['docPatients'];
      docRating = userSnapshot['docRating'];
      docTiming = userSnapshot['docTiming'];
      docHospital = userSnapshot['docHospital'];
    });
  }

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.only(bottom: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Config.spaceSmall,
          if (docExperience != null && docPatients != null)
            DoctorInfo(
              experience: docExperience!,
              patients: docPatients!,
              rating: docRating!,
            ),
          Config.spaceMedium,
          Text(
            'About Me',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          Config.spaceSmall,
          Text(
            docAbout!,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              height: 1.5,
            ),
            softWrap: true,
            textAlign: TextAlign.justify,
          ),
          Config.spaceSmall,
          Text(
            'Working Information',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          Config.spaceSmall,
          if (docTiming != null && docHospital != null)
            ScheduleInfo(
              timing: docTiming!,
              hospital: docHospital!,
            ),
        ],
      ),
    );
  }
}

class ScheduleInfo extends StatelessWidget {
  // ScheduleInfo({super.key});

  ScheduleInfo({
    Key? key,
    required this.timing,
    required this.hospital,
  }) : super(key: key);

  final String timing;
  final String hospital;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              const Icon(
                Icons.calendar_month_outlined,
                color: Colors.blue,
                size: 15,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                timing,
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
            ],
          ),
          Config.spaceSmall,
          Row(
            children: [
              const Icon(
                Icons.location_on_outlined,
                color: Colors.blue,
                size: 15,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                hospital,
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class DoctorInfo extends StatelessWidget {
  //const DoctorInfo({super.key});

  DoctorInfo({
    Key? key,
    required this.experience,
    required this.patients,
    required this.rating,
  }) : super(key: key);

  final String experience;
  final String patients;
  final String rating;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InfoCard(
          label: 'Patients',
          value: patients,
        ),
        SizedBox(
          width: 15,
        ),
        InfoCard(
          label: 'Experience',
          value: experience,
        ),
        SizedBox(
          width: 15,
        ),
        InfoCard(
          label: 'Rating',
          value: rating,
        ),
      ],
    );
  }
}

class InfoCard extends StatelessWidget {
  const InfoCard({Key? key, required this.label, required this.value})
      : super(key: key);

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          //gradient: Config.primaryGradient,
          color: Colors.grey.shade100,
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 15,
        ),
        child: Column(
          children: [
            Text(
              label,
              style: TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              value,
              style: TextStyle(
                color: Config.primaryColor,
                fontSize: 15,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
