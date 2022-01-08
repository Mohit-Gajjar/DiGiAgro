import 'package:flutter/material.dart';

class Crops extends StatefulWidget {
  const Crops({Key? key}) : super(key: key);

  @override
  _CropsState createState() => _CropsState();
}

class _CropsState extends State<Crops> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Demo Page Crops'),
      ),
    );
  }
}
