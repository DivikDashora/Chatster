import 'package:chat_app/main.dart';
import 'package:chat_app/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isAnimate = false;
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 100), () {
      setState(() {
        _isAnimate = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Future<UserCredential> _signInWithGoogle() async {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication.catchError((error) {
        print('$error');
      });

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      return await FirebaseAuth.instance.signInWithCredential(credential);
    }

    void _clickedGoogle() {
      _signInWithGoogle().then((user) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const HomeScreen()));
      });
    }

    mq = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(children: [
        Positioned(
            child: Container(
          height: mq.height,
          width: mq.width,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('assets/images/Chatster.png'))),
        )),
        AnimatedPositioned(
            duration: Duration(milliseconds: 500),
            top: _isAnimate ? mq.height * 0.09 : -mq.height,
            left: mq.width * 0.30,
            width: mq.width * 0.45,
            height: mq.height * 0.3,
            child: Image.asset('assets/images/appicon.png')),
        AnimatedPositioned(
          duration: Duration(milliseconds: 700),
          top: _isAnimate ? mq.height * 0.8 : mq.height,
          left: mq.width / 100,
          right: mq.width / 100,
          child: GestureDetector(
            onTap: () {
              _clickedGoogle();
            },
            child: Container(
              height: mq.height * 0.089,
              width: mq.width * 0.8,
              // alignment: Alignment.center,
              // width: double.maxFinite - 200,
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.purple.shade300.withOpacity(0.5)),
                  // backgroundBlendMode: BlendMode.colorBurn,
                  borderRadius: BorderRadius.circular(40),
                  color: Colors.white.withOpacity(0.2)),
              // color: Colors.black54,

              margin: const EdgeInsets.symmetric(horizontal: 50),
              child: Row(
                children: [
                  const SizedBox(
                    width: 15,
                  ),
                  Image.asset(
                    'assets/images/google.png',
                    height: 50,
                    width: 50,
                  ),
                  const SizedBox(
                    width: 25,
                  ),
                  Text("Google Login",
                      style: GoogleFonts.montserrat(
                          letterSpacing: 0.5,
                          color: Colors.grey[700],
                          fontSize: 25,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ),
        )
      ]),
    );
  }
}
