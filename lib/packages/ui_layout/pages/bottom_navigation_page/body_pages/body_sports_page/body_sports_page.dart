import 'package:flutter/material.dart';

class BodySportsPage extends StatefulWidget {
  const BodySportsPage({Key? key}) : super(key: key);

  @override
  State<BodySportsPage> createState() => _BodySportsPageState();
}

class _BodySportsPageState extends State<BodySportsPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Text('BodySportsPage'),
      ),
    );
  }
}
