import 'dart:convert';

import 'package:digiagro/Components/air.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';

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
  void initState() {
    _getPermissons();
    _getData();
    super.initState();
  }

  var soilData;
  var weatherData;
  var airData;

  LocationData? _locationData;
  Location location = Location();
  _getPermissons() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
  }

  _getData() async {
    _locationData = await location.getLocation();
    print(_locationData!.latitude.toString() +
        "  " +
        _locationData!.longitude.toString());

    try {
      var air = await Dio().get(
          'https://api.ambeedata.com/latest/by-lat-lng?lat=' +
              _locationData!.latitude.toString() +
              '&lng=' +
              _locationData!.longitude.toString(),
          options: Options(headers: {
            "x-api-key":
                "d47129800d508040a9faf66ba325984de9c42133a55022743f42eb925c82eb87"
          }));

      var weather = await Dio().get(
          'https://api.ambeedata.com/weather/forecast/by-lat-lng?lat=' +
              _locationData!.latitude.toString() +
              '&lng=' +
              _locationData!.longitude.toString(),
          // "https://api.ambeedata.com/latest/by-lat-lng?lat=22.355302&lng=73.202966",
          options: Options(headers: {
            "x-api-key":
                "d47129800d508040a9faf66ba325984de9c42133a55022743f42eb925c82eb87"
          }));

      var soil = await Dio().get(
          'https://api.ambeedata.com/soil/latest/by-lat-lng?lat=' +
              _locationData!.latitude.toString() +
              '&lng=' +
              _locationData!.longitude.toString(),
          // "https://api.ambeedata.com/latest/by-lat-lng?lat=22.355302&lng=73.202966",
          options: Options(headers: {
            "x-api-key":
                "d47129800d508040a9faf66ba325984de9c42133a55022743f42eb925c82eb87"
          }));
      soilData = soil.data;
      weatherData = weather.data;
      airData = air.data;
      print(airData);
      // print(soilData);
    } catch (e) {
      print(e);
    }
  }

  // AirData air = AirData.fromJson(jsonDecode(soilData));
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
                    "air.stations",
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
                          fontWeight: weatherBool
                              ? FontWeight.bold
                              : FontWeight.normal),
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
