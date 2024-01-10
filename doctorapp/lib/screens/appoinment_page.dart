import 'package:doctorapp/utils/config.dart';
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
  List<dynamic> schedules = [
    {
      "doctor_name": "Richard Tan",
      "doctor_profile": "assets/doctor_1.jpg",
      "category": "Dental",
      "hospital": "Amaya Hospital",
      "status": FilterStatus.upcoming
    },
    {
      "doctor_name": "Max Lim",
      "doctor_profile": "assets/doctor_1.jpg",
      "category": "Cardiology",
      "hospital": "Amaya Hospital",
      "status": FilterStatus.complete
    },
    {
      "doctor_name": "Jane Wong",
      "doctor_profile": "assets/doctor_1.jpg",
      "category": "Dental",
      "hospital": "Amaya Hospital",
      "status": FilterStatus.complete
    },
    {
      "doctor_name": "Jenny Song",
      "doctor_profile": "assets/doctor_1.jpg",
      "category": "Dental",
      "hospital": "Amaya Hospital",
      "status": FilterStatus.cancel
    }
  ];

  @override
  Widget build(BuildContext context) {
    List<dynamic> filteredSchedules = schedules
        .where((var schedule) => schedule['status'] == status)
        .toList();
   
      // switch (schedule['status']) {
      //   case 'upcoming':
      //     schedule['status'] = FilterStatus.upcoming;
      //     break;
      //   case 'complete':
      //     schedule['status'] = FilterStatus.complete;
      //     break;
      //   case 'cancel':
      //     schedule['status'] = FilterStatus.cancel;
      //     break;
      // }
     
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
              const ScheduleCard(),
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
                      onPressed: () {},
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
                      onPressed: () {},
                      child: Text(
                        'Reschedule',
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
              const ScheduleCard(),
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
              const ScheduleCard(),
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

class ScheduleCard extends StatelessWidget {
  const ScheduleCard({super.key});

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
              'Monday, 11/23/1999',
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
              '2:00 PM',
              style: TextStyle(
                color: Config.primaryColor,
              ),
            ))
          ]),
    );
  }
}
