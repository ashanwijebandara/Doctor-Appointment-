import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctorapp/utils/config.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
        backgroundColor: Colors.white,
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SafeArea(
          child: ListView(children: [
            Expanded(
              flex: 3,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: Config.primaryGradient,
                ),
                child: const Column(children: [
                  // Config.spaceSmall,
                  // Text(
                  //   'Edit My Profile',
                  //   style: TextStyle(
                  //     fontSize: 24,
                  //     fontWeight: FontWeight.bold,
                  //     color: Colors.white,
                  //   ),
                  // ),
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
                        margin: const EdgeInsets.fromLTRB(0, 30, 0, 20),
                        child: SizedBox(
                          width: 300,
                          height: 450,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 10,
                            ),
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
                                  controller: _nameController,
                                  keyboardType: TextInputType.name,
                                  cursorColor: Config.primaryColor,
                                  decoration: const InputDecoration(
                                    hintText: 'Name',
                                    hintStyle: TextStyle(color: Color(0xFFA6A6A6)),
                                    labelText: 'Name',
                                    alignLabelWithHint: true,
                                    border: InputBorder.none,
                                  ),
                                ),
                                Config.spaceSmall,
                                TextFormField(
                                  controller: _ageController,
                                  keyboardType: TextInputType.name,
                                  cursorColor: Config.primaryColor,
                                  decoration: const InputDecoration(
                                    hintText: 'Age',
                                    hintStyle: TextStyle(color: Color(0xFFA6A6A6)),
                                    labelText: 'Age',
                                    alignLabelWithHint: true,
                                    //border: InputBorder.none,
                                  ),
                                ),
                                Config.spaceSmall,
                                TextFormField(
                                  controller: _genderController,
                                  keyboardType: TextInputType.name,
                                  cursorColor: Config.primaryColor,
                                  decoration: const InputDecoration(
                                    hintText: 'Gender',
                                    hintStyle: TextStyle(color: Color(0xFFA6A6A6)),
                                    labelText: 'Gender',
                                    alignLabelWithHint: true,
                                    border: InputBorder.none,
                                  ),
                                ),
                                Config.spaceSmall,
                                TextFormField(
                                  controller: _addressController,
                                  keyboardType: TextInputType.name,
                                  cursorColor: Config.primaryColor,
                                  decoration: const InputDecoration(
                                    hintText: 'Address',
                                    hintStyle: TextStyle(color: Color(0xFFA6A6A6)),
                                    labelText: 'Address',
                                    alignLabelWithHint: true,
                                    border: InputBorder.none,
                                  ),
                                ),
                                Config.spaceSmall,
                                OutlinedButton(
                                  onPressed: () async {
                                    await updateProfile();
                                    Navigator.of(context).pushNamed('main');
                                  },
                                  style: OutlinedButton.styleFrom(
                                    foregroundColor:
                                        Config.primaryColor, // Text color
                                    side: BorderSide(
                                        color: Config.primaryColor), // Border color
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          18.0), // Border radius
                                    ),
                                    minimumSize:
                                        Size(100, 30), // button width and height
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
        ),
      ),
    );
  }

  Future<void> updateProfile() async {
    try {
      String userId = FirebaseAuth.instance.currentUser!.uid;

      await _firestore.collection('users').doc(userId).update({
        'username': _nameController.text,
        'age': _ageController.text,
        'gender': _genderController.text,
        'address': _addressController.text,
      });

      print('User details updated successfully!');
    } catch (e) {
      print('Error updating user details: $e');
    }
  }
}
