import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // current logged in user
  final User? currentUser = FirebaseAuth.instance.currentUser;

  // future to fetch user details
  Future<DocumentSnapshot<Map<String, dynamic>>> getUserDetails() async {
    return await FirebaseFirestore.instance
        .collection('Users')
        .doc(currentUser!.email)
        .get();
  }

  @override
  Widget build(BuildContext context) {
    final bool isSmallScreen = MediaQuery.of(context).size.width < 600;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF29395B),
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          'Profile',
          style: GoogleFonts.raleway(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xffFFFFFF),
          ),
        ),
      ),
      body: isSmallScreen
          ? Column()
          : FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
              future: getUserDetails(),
              builder: (context, snapshot) {
                // loading6
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Text("Error ${snapshot.error}");
                } else if (snapshot.hasData) {
                  // extract data
                  Map<String, dynamic>? user = snapshot.data!.data();
                  return Padding(
                    padding: const EdgeInsets.all(50.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const CircleAvatar(
                              radius: 70,
                              backgroundColor: Color(0xffFFFFFF),
                              backgroundImage: AssetImage(
                                'assets/images/boy.png',
                              ),
                            ),
                            SizedBox(width: 50),
                            Text(
                              '${user!['userName'] ?? ""}',
                              style: GoogleFonts.raleway(
                                fontSize: 35,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 50),
                        Text(
                          '${user['email'] ?? ""}',
                          style: GoogleFonts.raleway(
                            fontSize: 35,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 50),
                        Text(
                          '${user['phoneNumber'] ?? ""}',
                          style: GoogleFonts.raleway(
                            fontSize: 35,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 50),
                      ],
                    ),
                  );
                } else {
                  return const Text('No Data');
                }
              }),
    );
  }
}
