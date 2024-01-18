import 'package:doctorapp/utils/config.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppoinmentCard extends StatefulWidget {
  const AppoinmentCard({Key? key}) : super(key: key);

  @override
  State<AppoinmentCard> createState() => _AppoinmentCardState();
}

class _AppoinmentCardState extends State<AppoinmentCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Config.primaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Image.asset(
                'assets/card_background.png',
                scale: 1.0,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Material(
              color: Colors.transparent,
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/doctor_1.jpg'),
                        radius: 25,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Dr Richard Tan',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          Row(children: [
                            Text(
                              'Dental',
                              style: TextStyle(color: Colors.white),
                            ),
                            Config.spacehorizontal_small,
                            Text(
                              '|',
                              style: TextStyle(color: Colors.white),
                            ),
                            Config.spacehorizontal_small,
                            Text(
                              'Amaya Hospital',
                              style: TextStyle(color: Colors.white),
                            ),
                          ]),
                        ],
                      ),
                    ],
                  ),
                  Config.spaceSmall,
                  ScheduleCard(),
                  Config.spaceSmall,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                          ),
                          child: Text(
                            'Cancel',
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {},
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                          ),
                          child: Text(
                            'Completed',
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {},
                        ),
                      )
                    ],
                  )
                ]),
              )),
        ],
      ),
    );
  }
}

class ScheduleCard extends StatelessWidget {
  const ScheduleCard({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('EEEE, MM/dd/yyyy').format(now);
    String formattedTime = DateFormat('h:mm a').format(now);
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF1389C2),
        borderRadius: BorderRadius.circular(10),
      ),
      width: double.infinity,
      padding: EdgeInsets.all(20),
      child: Row(children: [
        const Icon(
          Icons.calendar_month_outlined,
          color: Colors.white,
          size: 15,
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          formattedDate,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        const Icon(
          Icons.access_alarm,
          color: Colors.white,
          size: 17,
        ),
        const SizedBox(
          width: 5,
        ),
        Flexible(
            child: Text(
          formattedTime,
          style: TextStyle(color: Colors.white),
        ))
      ]),
    );
  }
}
