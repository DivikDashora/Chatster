import 'package:chat_app/screens/auth/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  bool person = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Positioned(
                child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('assets/images/profile.png'))),
            )),
            //to display profile picture
            Positioned(
                top: MediaQuery.of(context).size.height * 0.17,
                child: Container(
                  width: MediaQuery.of(context).size.height * 0.20,
                  height: MediaQuery.of(context).size.height * 0.20,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.deepPurple.shade300, width: 3),
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.amber.withOpacity(0.3)),
                  child: person == true
                      ? const Icon(Icons.person)
                      : const Icon(Icons.ac_unit),
                )),
            //for photo addition icon
            Positioned(
                top: MediaQuery.of(context).size.height * 0.33,
                left: MediaQuery.of(context).size.width * 0.6,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      if (person == false) {
                        person = true;
                      } else {
                        person = false;
                      }
                    });
                  },
                  child: Container(
                    child: const Icon(
                      Icons.add_a_photo,
                      color: Colors.white,
                    ),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.deepPurple.shade300, width: 3),
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.deepPurple.shade300),
                  ),
                )),
            const Positioned(child: Text('')),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.55,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.45,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.55),
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50))),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // SizedBox(
                        //   width: 30,
                        // ),
                        const Padding(
                          padding: EdgeInsets.only(left: 30.0),
                          child: Text(
                            'Username:',
                            style: TextStyle(fontSize: 25),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 30),
                          child: Icon(
                            Icons.edit,
                            size: 25,
                            color: Colors.deepPurple.shade300,
                          ),
                        ),
                        // SizedBox(
                        //   width: 30,
                        // )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30, right: 30),
                      child: TextField(
                        enabled: false,
                        controller: TextEditingController()..text = 'divik',
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // SizedBox(
                        //   width: 30,
                        // ),
                        const Padding(
                          padding: EdgeInsets.only(left: 30.0),
                          child: Text(
                            'About:',
                            style: TextStyle(fontSize: 25),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 30),
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.edit),
                            iconSize: 25,
                            color: Colors.deepPurple.shade300,
                          ),
                        ),
                        // SizedBox(
                        //   width: 30,
                        // )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0, right: 30),
                      child: TextField(
                        enabled: false,
                        controller: TextEditingController()
                          ..text = 'hey chatster',
                      ),
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepPurple),
                        onPressed: () async {
                          await GoogleSignIn()
                              .signOut()
                              .then((value) => Navigator.pop(context))
                              .then((value) => Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const LoginPage())));
                        },
                        child: const Text(
                          'Log Out',
                          style: TextStyle(color: Colors.white),
                        ))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
