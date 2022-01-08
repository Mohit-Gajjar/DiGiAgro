import 'package:digiagro/crops.dart';
import 'package:flutter/material.dart';

class Soil extends StatefulWidget {
  final String temp, moisture, type;
  const Soil(
      {Key? key,
      required this.temp,
      required this.moisture,
      required this.type})
      : super(key: key);

  @override
  _SoilState createState() => _SoilState();
}

class _SoilState extends State<Soil> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
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
        ),
        const SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Soil Type: ",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
            Text(widget.type,
                style: const TextStyle(
                  fontSize: 14,
                )),
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        InkWell(
          onTap: () => Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => const Crops())),
          child: Container(
            height: 50,
            width: 200,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: const Color(0xffF7BB72)),
            child: const Center(
              child: Text(
                "Get Crops",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        )
      ],
    );
  }
}
