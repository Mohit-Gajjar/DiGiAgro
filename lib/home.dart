import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool weatherBool = false;
  bool soilBool = false;
  bool airBool = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Center(
            child: Column(
              children: [
                Text(
                  "Vadodara",
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width / 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Gujarat, India",
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width / 20,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                  onPressed: () {
                    setState(() {
                      soilBool = true;
                      weatherBool = false;
                      airBool = false;
                    });
                  },
                  child: Text(
                    'Soil',
                    style: TextStyle(
                        fontSize: 26,
                        color: soilBool ? Colors.black : Colors.black38,
                        fontWeight:
                            soilBool ? FontWeight.bold : FontWeight.w100),
                  )),
              Container(
                height: 40,
                width: 2,
                color: Colors.black,
              ),
              TextButton(
                  onPressed: () {
                    setState(() {
                      soilBool = false;
                      weatherBool = true;
                      airBool = false;
                    });
                  },
                  child: Text(
                    'Weather',
                    style: TextStyle(
                        fontSize: 26,
                        color: weatherBool ? Colors.black : Colors.black38,
                        fontWeight:
                            weatherBool ? FontWeight.bold : FontWeight.normal),
                  )),
              Container(
                height: 40,
                width: 2,
                color: Colors.black,
              ),
              TextButton(
                  onPressed: () {
                    setState(() {
                      soilBool = false;
                      weatherBool = false;
                      airBool = true;
                    });
                  },
                  child: Text(
                    'Air',
                    style: TextStyle(
                        fontSize: 26,
                        color: airBool ? Colors.black : Colors.black38,
                        fontWeight:
                            airBool ? FontWeight.bold : FontWeight.normal),
                  )),
            ],
          )
        ],
      ),
    ),
    bottomSheet: Image(
        image: const AssetImage('assets/home.png'),
        width: MediaQuery.of(context).size.width,
      ),
    );
  }
}
