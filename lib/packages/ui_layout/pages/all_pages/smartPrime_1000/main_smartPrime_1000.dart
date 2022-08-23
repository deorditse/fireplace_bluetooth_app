import 'package:flutter/material.dart';

class SmartPrime1000Page extends StatefulWidget {
  static const String id = '/smartPrime1000Page';

  const SmartPrime1000Page({Key? key}) : super(key: key);

  @override
  State<SmartPrime1000Page> createState() => _SmartPrime1000PageState();
}

class _SmartPrime1000PageState extends State<SmartPrime1000Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Text('hello'),
      ),
    );
  }
}
