import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctorapp/utils/config.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AppoinmentPage extends StatefulWidget {
  const AppoinmentPage({super.key});

  @override
  State<AppoinmentPage> createState() => _AppoinmentPageState();
}

enum FilterStatus { upcoming, complete, cancel }

class _AppoinmentPageState extends State<AppoinmentPage> {
  FilterStatus status = FilterStatus.upcoming;
  Alignment _alignment = Alignment.centerLeft;
  List<dynamic> schedules = [];

  @override
  void initState() {
    super.initState();

    fetchUserAppointments();
  }

  Future<void> fetchUserAppointments() async {
    String getCurrentUserId() {
      User? user = FirebaseAuth.instance.currentUser;
      return user?.uid ?? '';
    }

    String userId = getCurrentUserId();
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('appointments')
        .where('uid', isEqualTo: userId)
        .get();

    List<DocumentSnapshot> documents = querySnapshot.docs;

    List<Map<String, dynamic>> userAppointments =
        documents.map((doc) => doc.data() as Map<String, dynamic>).toList();

    for (var i = 0; i < userAppointments.length; i++) {
      String doctorId = userAppointments[i]['doctorId'];
      DocumentSnapshot doctorSnapshot = await FirebaseFirestore.instance
          .collection('doctors')
          .doc(doctorId)
          .get();

      Map<String, dynamic> doctorData =
          doctorSnapshot.data() as Map<String, dynamic>;

      userAppointments[i]['doctor_name'] = doctorData['doc_name'];
      userAppointments[i]['doctor_profile'] = doctorData['imgRoute'];
      userAppointments[i]['category'] = doctorData['docCategory'];
      userAppointments[i]['hospital'] = doctorData['docHospital'];
      if (userAppointments[i]['status'] == 'upcoming') {
        userAppointments[i]['status'] = FilterStatus.upcoming;
      } else if (userAppointments[i]['status'] == 'complete') {
        userAppointments[i]['status'] = FilterStatus.complete;
      } else if (userAppointments[i]['status'] == 'cancel') {
        userAppointments[i]['status'] = FilterStatus.cancel;
      }
    }

    setState(() {
      schedules = userAppointments;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<dynamic> filteredSchedules = schedules
        .where((var schedule) => schedule['status'] == status)
        .toList();

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(left: 20, top: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Appoinment Schedule',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Config.spaceSmall,
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      for (FilterStatus filterStatus in FilterStatus.values)
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                if (filterStatus == FilterStatus.upcoming) {
                                  status = FilterStatus.upcoming;
                                  _alignment = Alignment.centerLeft;
                                } else if (filterStatus ==
                                    FilterStatus.complete) {
                                  status = FilterStatus.complete;
                                  _alignment = Alignment.center;
                                } else if (filterStatus ==
                                    FilterStatus.cancel) {
                                  status = FilterStatus.cancel;
                                  _alignment = Alignment.centerRight;
                                }
                              });
                            },
                            child: Center(
                              child: Text(filterStatus.name),
                            ),
                          ),
                        )
                    ],
                  ),
                ),
                AnimatedAlign(
                  alignment: _alignment,
                  duration: Duration(milliseconds: 200),
                  child: Container(
                    width: 100,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Config.primaryColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        status.name,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Config.spaceSmall,
            Expanded(
              child: _buildContent(filteredSchedules, status),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContent(List<dynamic> filteredSchedules, FilterStatus status) {
    if (status == FilterStatus.upcoming) {
      return _buildUpcomingContent(filteredSchedules);
    } else if (status == FilterStatus.complete) {
      return _buildCompleteContent(filteredSchedules);
    } else if (status == FilterStatus.cancel) {
      return _buildCancelContent(filteredSchedules);
    }

    return Container();
  }

  Widget _buildUpcomingContent(List<dynamic> filteredSchedules) {
    return ListView.builder(
      itemCount: filteredSchedules.length,
      itemBuilder: (context, index) {
        var _schedule = filteredSchedules[index];
        bool isLastElement = filteredSchedules.length - 1 == index;
        String sheduleDate = _schedule['date'];
        String sheduleTime = _schedule['time'];
        String appointmentId = _schedule['appointmentId'];

        return Card(
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          margin: !isLastElement
              ? const EdgeInsets.only(bottom: 20)
              : EdgeInsets.zero,
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage(_schedule['doctor_profile']),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _schedule['doctor_name'],
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              _schedule['category'],
                              style: TextStyle(
                                color: Colors.black,
                                //fontWeight: FontWeight.w600,
                              ),
                            ),
                            Config.spacehorizontal_small,
                            Text(
                              '|',
                              style: TextStyle(color: Colors.black),
                            ),
                            Config.spacehorizontal_small,
                            Text(
                              _schedule['hospital'],
                              style: TextStyle(
                                color: Colors.black,
                                //fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                ScheduleCard(
                  sheduleDate: sheduleDate,
                  sheduleTime: sheduleTime,
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        style: ButtonStyle(
                          side: MaterialStateProperty.all<BorderSide>(
                            BorderSide(
                              color: Colors.red,
                              width: 1.0,
                            ),
                          ),
                        ),
                        onPressed: () {
                          // Handle cancel appointment
                          _cancelAppointment(appointmentId);
                        },
                        child: Text(
                          'Cancel',
                          style: TextStyle(color: Config.primaryColor),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          backgroundColor: Config.primaryColor,
                        ),
                        onPressed: () {
                          // Handle complete appointment
                          _completeAppointment(appointmentId);
                        },
                        child: Text(
                          'Completed',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildCompleteContent(List<dynamic> filteredSchedules) {
    return ListView.builder(
      itemCount: filteredSchedules.length,
      itemBuilder: (context, index) {
        var _schedule = filteredSchedules[index];
        bool isLastElement = filteredSchedules.length - 1 == index;
        String sheduleDate = _schedule['date'];
        String sheduleTime = _schedule['time'];
        return Card(
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          margin: !isLastElement
              ? const EdgeInsets.only(bottom: 20)
              : EdgeInsets.zero,
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage(_schedule['doctor_profile']),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _schedule['doctor_name'],
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              _schedule['category'],
                              style: TextStyle(
                                color: Colors.black,
                                //fontWeight: FontWeight.w600,
                              ),
                            ),
                            Config.spacehorizontal_small,
                            Text(
                              '|',
                              style: TextStyle(color: Colors.black),
                            ),
                            Config.spacehorizontal_small,
                            Text(
                              _schedule['hospital'],
                              style: TextStyle(
                                color: Colors.black,
                                //fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                ScheduleCard(
                  sheduleDate: sheduleDate,
                  sheduleTime: sheduleTime,
                ),
                const SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildCancelContent(List<dynamic> filteredSchedules) {
    return ListView.builder(
      itemCount: filteredSchedules.length,
      itemBuilder: (context, index) {
        var _schedule = filteredSchedules[index];
        bool isLastElement = filteredSchedules.length - 1 == index;
        String sheduleDate = _schedule['date'];
        String sheduleTime = _schedule['time'];

        return Card(
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          margin: !isLastElement
              ? const EdgeInsets.only(bottom: 20)
              : EdgeInsets.zero,
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage(_schedule['doctor_profile']),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _schedule['doctor_name'],
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              _schedule['category'],
                              style: TextStyle(
                                color: Colors.black,
                                //fontWeight: FontWeight.w600,
                              ),
                            ),
                            Config.spacehorizontal_small,
                            Text(
                              '|',
                              style: TextStyle(color: Colors.black),
                            ),
                            Config.spacehorizontal_small,
                            Text(
                              _schedule['hospital'],
                              style: TextStyle(
                                color: Colors.black,
                                //fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                ScheduleCard(
                  sheduleDate: sheduleDate,
                  sheduleTime: sheduleTime,
                ),
                const SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _completeAppointment(String appointmentId) async {
    try {
      await FirebaseFirestore.instance
          .collection('appointments')
          .doc(appointmentId)
          .update({'status': 'complete'});

      // Fetch updated user appointments and update the state
      await fetchUserAppointments();
    } catch (e) {
      print('Error completing appointment: $e');
      // Handle error
    }
  }

  void _cancelAppointment(String appointmentId) async {
    try {
      await FirebaseFirestore.instance
          .collection('appointments')
          .doc(appointmentId)
          .update({'status': 'cancel'});

      // Fetch updated user appointments and update the state
      await fetchUserAppointments();
    } catch (e) {
      print('Error canceling appointment: $e');
      // Handle error
    }
  }
}

class ScheduleCard extends StatelessWidget {
  ScheduleCard({required this.sheduleDate, required this.sheduleTime});
  String sheduleDate;
  String sheduleTime;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(10),
      ),
      width: double.infinity,
      padding: EdgeInsets.all(20),
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(
              Icons.calendar_month_outlined,
              color: Config.primaryColor,
              size: 15,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              sheduleDate,
              style: TextStyle(
                color: Config.primaryColor,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            const Icon(
              Icons.access_alarm,
              color: Config.primaryColor,
              size: 17,
            ),
            const SizedBox(
              width: 5,
            ),
            Flexible(
                child: Text(
              sheduleTime,
              style: TextStyle(
                color: Config.primaryColor,
              ),
            ))
          ]),
    );
  }
}
