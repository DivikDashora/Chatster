import 'dart:convert';

import 'package:chat_app/api/apis.dart';
import 'package:chat_app/models/chat_user.dart';
import 'package:chat_app/screens/auth/login_screen.dart';
import 'package:chat_app/screens/profile.dart';
import 'package:chat_app/widgets/chat_card.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<chatUser> list = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => profile()));
            },
            icon: const Icon(Icons.home)),

        titleSpacing: 20,
        // centerTitle: false,
        title: const Text(
          'Chatster',
          style: TextStyle(color: Colors.white),
        ),
        shadowColor: Colors.transparent,
        backgroundColor: Colors.deepPurple.shade500,
        automaticallyImplyLeading: false,
        toolbarHeight: 50,
      ),
      body: Container(
          decoration: BoxDecoration(color: Colors.deepPurple.shade100),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.02),
            child: StreamBuilder(
                stream: APIs.firestore.collection('users').snapshots(),
                builder: ((context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                    case ConnectionState.none:
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    case ConnectionState.active:
                    case ConnectionState.done:
                      final data = snapshot.data?.docs;
                      list = data
                              ?.map((e) => chatUser.fromJson(e.data()))
                              .toList() ??
                          [];

                      if (list.isNotEmpty) {
                        return ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount: list.length,
                            itemBuilder: (context, index) =>
                                ChatCard(user: list[index]));
                      } else {
                        return const Center(
                          child: Text("No connections found!!"),
                        );
                      }
                  }
                })),
          )),
    );
  }
}
