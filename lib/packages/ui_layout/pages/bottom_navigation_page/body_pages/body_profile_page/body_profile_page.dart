import 'package:flutter/material.dart';

class BodyProfilePage extends StatefulWidget {
  const BodyProfilePage({Key? key}) : super(key: key);

  @override
  State<BodyProfilePage> createState() => _BodyProfilePageState();
}

class _BodyProfilePageState extends State<BodyProfilePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Text('BodyProfilePage'),
      ),
    );
  }
}
