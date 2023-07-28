import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_app/main.dart';
import 'package:chat_app/models/chat_user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatCard extends StatefulWidget {
  final chatUser user;
  const ChatCard({super.key, required this.user});

  @override
  State<ChatCard> createState() => _ChatCardState();
}

class _ChatCardState extends State<ChatCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(255, 205, 217, 255),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5))),
      elevation: 0.5,
      child: InkWell(
          child: ListTile(
        title: Text(widget.user.name),
        subtitle: Text(
          widget.user.about,
          maxLines: 1,
        ),
        trailing: const Text('12:00 PM'),
        leading: CachedNetworkImage(
            width: mq.height * 0.05,
            height: mq.height * 0.05,
            imageUrl: widget.user.image),
        selectedColor: Colors.blue,
      )),
    );
  }
}
