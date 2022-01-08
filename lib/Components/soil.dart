import 'package:flutter/material.dart';

class Soil extends StatefulWidget {
  final String temp, moisture;
  const Soil({Key? key, required this.temp, required this.moisture})
      : super(key: key);

  @override
  _SoilState createState() => _SoilState();
}

class _SoilState extends State<Soil> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "Soil Temperature: ",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Text(
              "Soil Moisture: ",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              widget.temp,
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              widget.moisture,
              style: const TextStyle(fontSize: 18),
            ),
          ],
        )
      ],
    );
  }
}
