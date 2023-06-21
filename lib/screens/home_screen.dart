import 'package:chat_app/screens/auth/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Chatster",
        ),
        leading: Icon(
          CupertinoIcons.home,
          color: Colors.grey[800],
          weight: 40,
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                CupertinoIcons.search,
                color: Colors.grey[800],
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.more_vert_sharp,
                color: Colors.grey[800],
              )),
        ],
      ),
    );
  }
}
