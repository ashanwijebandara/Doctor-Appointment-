import 'package:doctorapp/utils/config.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 4,
              child: Container(
                width: double.infinity,
                color: Config.primaryColor,
                child: const Column(children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'My Profile',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/profile1.jpg'),
                  ),
                  Config.spaceSmall,
                  Text(
                    'Jenny Tan',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ]),
              ),
            ),
            Expanded(
              flex: 8,
              child: Container(
                color: Colors.grey[300],
                child: Center(
                  child: Column(
                    children: [
                      Card(
                        margin: const EdgeInsets.fromLTRB(0, 45, 0, 0),
                        child: SizedBox(
                          width: 300,
                          height: 200,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              children: const [
                                Text(
                                  'Profile ',
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                Divider(
                                  color: Colors.grey,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.person,
                                      color: Colors.grey,
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    /*
                                TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Profile',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),*/
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Card(
                        margin: const EdgeInsets.fromLTRB(0, 45, 0, 0),
                        child: SizedBox(
                          width: 300,
                          height: 200,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              children: const [
                                Text(
                                  'Profile ',
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                Divider(
                                  color: Colors.grey,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.person,
                                      color: Colors.grey,
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    /*
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                'Profile',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),*/
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ]),
    );
  }
}
