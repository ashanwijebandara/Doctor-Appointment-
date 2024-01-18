import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctorapp/components/button.dart';
import 'package:doctorapp/utils/config.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/custom_appbar.dart';

class DoctorDetails extends StatefulWidget {
  DoctorDetails({required this.id});

  final String id;

  @override
  State<DoctorDetails> createState() => _DoctorDetailsState();
}

class _DoctorDetailsState extends State<DoctorDetails> {
  bool isFav = false;
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
            onPressed: () {
              setState(() {
                isFav = !isFav;
              });
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
                  Navigator.of(context).pushNamed('booking_page',
                  arguments: widget.id
                  );
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
    DocumentSnapshot userSnapshot =
        await FirebaseFirestore.instance.collection('doctors').doc(widget.id).get();

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
          const CircleAvatar(
            radius: 55,
            backgroundImage: AssetImage('assets/doctor_1.jpg'),
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

  @override
  void initState() {
    getDoctorData();
    super.initState();
  }

  Future<void> getDoctorData() async {
    DocumentSnapshot userSnapshot =
        await FirebaseFirestore.instance.collection('doctors').doc(widget.id).get();

    setState(() {
      docAbout = userSnapshot['docAbout'];
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
          const DoctorInfo(),
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
            'Dr. Richard Tan is an expierience Dentist at Kandy Hospital.',
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
          const ScheduleInfo(),
        ],
      ),
    );
  }
}

class ScheduleInfo extends StatelessWidget {
  const ScheduleInfo({super.key});

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
                'Monday - Friday, 08:00 AM - 05:00 PM',
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
                '13th Street. Amaya Hospital , COlombo Road , Kandy',
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
  const DoctorInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InfoCard(
          label: 'Patients',
          value: '109',
        ),
        SizedBox(
          width: 15,
        ),
        InfoCard(
          label: 'Experience',
          value: '5 Years',
        ),
        SizedBox(
          width: 15,
        ),
        InfoCard(
          label: 'Rating',
          value: '4.5',
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
