import 'package:doctorapp/utils/config.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: Config.primaryGradient,
                ),
                child: const Column(children: [
                  Config.spaceSmall,
                  Text(
                    'Edit My Profile',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Config.spaceSmall,
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/profile1.jpg'),
                  ),
                  Config.spaceSmall,
                ]),
              ),
            ),
            Expanded(
              flex: 8,
              child: Container(
                color: Colors.white,
                child: Center(
                  child: Column(
                    children: [
                      Card(
                        margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                        child: SizedBox(
                          width: 300,
                          height: 450,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              children: [
                                const Text(
                                  'Edit Profile ',
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                const Divider(
                                  color: Colors.grey,
                                ),
                                Config.spaceSmall,
                                TextFormField(
                                  //controller: _emailController,
                                  keyboardType: TextInputType.name,
                                  cursorColor: Config.primaryColor,
                                  decoration: const InputDecoration(
                                    hintText: 'Name',
                                    hintStyle:
                                        TextStyle(color: Color(0xFFA6A6A6)),
                                    labelText: 'Name',
                                    alignLabelWithHint: true,
                                    border: InputBorder.none,
                                  ),
                                ),
                                Config.spaceSmall,
                                TextFormField(
                                  //controller: _emailController,
                                  keyboardType: TextInputType.name,
                                  cursorColor: Config.primaryColor,
                                  decoration: const InputDecoration(
                                    hintText: 'Age',
                                    hintStyle:
                                        TextStyle(color: Color(0xFFA6A6A6)),
                                    labelText: 'Age',
                                    alignLabelWithHint: true,
                                    //border: InputBorder.none,
                                  ),
                                ),
                                Config.spaceSmall,
                                TextFormField(
                                  //controller: _emailController,
                                  keyboardType: TextInputType.name,
                                  cursorColor: Config.primaryColor,
                                  decoration: const InputDecoration(
                                    hintText: 'Gender',
                                    hintStyle:
                                        TextStyle(color: Color(0xFFA6A6A6)),
                                    labelText: 'Gender',
                                    alignLabelWithHint: true,
                                    border: InputBorder.none,
                                  ),
                                ),
                                Config.spaceSmall,
                                TextFormField(
                                  //controller: _emailController,
                                  keyboardType: TextInputType.name,
                                  cursorColor: Config.primaryColor,
                                  decoration: const InputDecoration(
                                    hintText: 'Address',
                                    hintStyle:
                                        TextStyle(color: Color(0xFFA6A6A6)),
                                    labelText: 'Address',
                                    alignLabelWithHint: true,
                                    border: InputBorder.none,
                                  ),
                                ),
                                Config.spaceSmall,
                                OutlinedButton(
                                  onPressed: () async {
                                    await FirebaseAuth.instance.signOut();
                                    Navigator.of(context).pushNamed('main');
                                  },
                                  style: OutlinedButton.styleFrom(
                                    foregroundColor:
                                        Config.primaryColor, // Text color
                                    side: BorderSide(
                                        color: Config
                                            .primaryColor), // Border color
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          18.0), // Border radius
                                    ),
                                    minimumSize: Size(
                                        100, 30), // button width and height
                                  ),
                                  child: Text(
                                    'Save',
                                    style: TextStyle(fontSize: 16),
                                  ),
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
