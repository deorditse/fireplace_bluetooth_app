import 'package:flutter/material.dart';

class BodyChatPage extends StatefulWidget {
  const BodyChatPage({Key? key}) : super(key: key);

  @override
  State<BodyChatPage> createState() => _BodyChatPageState();
}

class _BodyChatPageState extends State<BodyChatPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Text('BodyChatPage'),
      ),
    );
  }
}
