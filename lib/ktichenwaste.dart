import 'package:flutter/material.dart';

class KitchenWaste extends StatefulWidget {
  const KitchenWaste({Key? key}) : super(key: key);

  @override
  _KitchenWasteState createState() => _KitchenWasteState();
}

class _KitchenWasteState extends State<KitchenWaste> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Kitchen Waste'),
      ),
    );
  }
}
