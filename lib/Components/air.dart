import 'package:flutter/material.dart';

class Air extends StatefulWidget {
  final String co;
  final String no2;
  final String ozone;
  final String pm25;
  final String so2;
  final String pm10;
  final String aqi;
  const Air({
    Key? key,
    required this.co,
    required this.no2,
    required this.ozone,
    required this.pm25,
    required this.so2,
    required this.pm10,
    required this.aqi,
  }) : super(key: key);

  @override
  _AirState createState() => _AirState();
}

class _AirState extends State<Air> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "CO2: ",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              "NO2: ",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              "OZONE: ",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              "PM10: ",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              "PM25: ",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              "SO2: ",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              "AQI: ",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(widget.co),
            Text(widget.no2),
            Text(widget.ozone),
            Text(widget.pm10),
            Text(widget.pm25),
            Text(widget.so2),
            Text(widget.aqi),
          ],
        ),
      ],
    );
  }
}
