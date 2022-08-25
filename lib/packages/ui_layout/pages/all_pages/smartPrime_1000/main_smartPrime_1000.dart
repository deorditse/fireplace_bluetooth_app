import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';

class SmartPrime1000Page extends StatefulWidget {
  static const String id = '/smartPrime1000Page';

  SmartPrime1000Page({Key? key, this.device}) : super(key: key);
  final BluetoothDevice? device;

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
