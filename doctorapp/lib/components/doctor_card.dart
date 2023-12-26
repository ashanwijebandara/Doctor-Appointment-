//import 'package:doctorapp/utils/config.dart';
import 'package:flutter/material.dart';

class DoctorCard extends StatelessWidget {
  const DoctorCard({Key? key, required this.route}) : super(key: key);

  final String route;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      height: 150,
      child: GestureDetector(
        child: Card(
          elevation: 5,
          color: Color(0xFFFAFAFA),
          child: Row(children: [
            const SizedBox(
              width: 15,
            ),
            /*
            SizedBox(
              width: Config.widthsize * 0.33,
              child: Image.asset(
                'assets/doctor_1.jpg',
                fit: BoxFit.fill,
              ),
            ),*/
            CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage('assets/doctor_1.jpg'),
            ),
            const SizedBox(
              width: 10,
            ),
            Flexible(
                child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Dr Richard Tan',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Row(children: [
                    Text(
                      'Dental',
                      style: TextStyle(color: Color(0xFFADA4A5)),
                    ),
                    Text(
                      '  |  Amaya Hospital',
                      style: TextStyle(color: Color(0xFFADA4A5)),
                    ),
                  ]),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.star_border,
                        color: Colors.yellow,
                        size: 16,
                      ),
                      Spacer(
                        flex: 1,
                      ),
                      Text('4.5'),
                      Spacer(
                        flex: 1,
                      ),
                      Text('Reviews'),
                      Spacer(
                        flex: 1,
                      ),
                      Text('(20)'),
                      Spacer(
                        flex: 7,
                      ),
                    ],
                  ),
                ],
              ),
              /* 
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Dr Richard Tan',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Dental',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    Spacer(
                      flex: 1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.star_border,
                          color: Colors.yellow,
                          size: 16,
                        ),
                        Spacer(
                          flex: 1,
                        ),
                        Text('4.5'),
                        Spacer(
                          flex: 1,
                        ),
                        Text('Reviews'),
                        Spacer(
                          flex: 1,
                        ),
                        Text('(20)'),
                        Spacer(
                          flex: 7,
                        ),
                      ],
                    ),
                  ]),*/
            ))
          ]),
        ),
        onTap: () {
          Navigator.of(context).pushNamed(route);
        },
      ),
    );
  }
}
