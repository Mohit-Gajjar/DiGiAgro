import 'package:flutter/material.dart';

class MakeManure extends StatefulWidget {
  const MakeManure({Key? key}) : super(key: key);

  @override
  _MakeManureState createState() => _MakeManureState();
}

class _MakeManureState extends State<MakeManure> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
          title: const Text(
            'Home-Made Manure',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          )),
    );
  }
}
