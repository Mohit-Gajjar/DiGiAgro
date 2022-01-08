import 'package:digiagro/Components/air.dart';
import 'package:digiagro/Components/soil.dart';
import 'package:digiagro/Components/weather.dart';
import 'package:digiagro/Sercives/services.dart';
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
  bool soilBool = true;
  bool airBool = false;
  @override
  void initState() {
    _getPermissons();
    _getData();
    super.initState();
  }

  // ignore: prefer_typing_uninitialized_variables
  var soilData;
  // ignore: prefer_typing_uninitialized_variables
  var weatherData;
  // ignore: prefer_typing_uninitialized_variables
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

  final String url =
      "f270b27bb0b91b4d93d4e4e18218e0c1c97e39e120cd2e3bc3d879cd29f6b39f";

  String city = "";
  String state = "";
  String country = "";
  String place = "";

  String co = "";
  String no2 = "";
  String ozone = "";
  String pm25 = "";
  String so2 = "";
  String pm10 = "";
  String aqi = "";
  String summary = "",
      icon = "",
      dewPoint = "",
      humidity = "",
      pressure = "",
      uvindex = "",
      ozoneWeather = "";

  double temp = 0.0,
      moisture = 0.0,
      temprature = 0.0,
      apperentTemperature = 0.0;
  String soilType = "";
  bool isLoading = false;
  _getData() async {
    setState(() {
      isLoading = true;
    });
    _locationData = await location.getLocation();

    try {
      var air = await Dio().get(
          'https://api.ambeedata.com/latest/by-lat-lng?lat=' +
              _locationData!.latitude.toString() +
              '&lng=' +
              _locationData!.longitude.toString(),
          options: Options(headers: {"x-api-key": url}));

      var weather = await Dio().get(
          'https://api.ambeedata.com/weather/latest/by-lat-lng?lat=' +
              _locationData!.latitude.toString() +
              '&lng=' +
              _locationData!.longitude.toString(),
          options: Options(headers: {"x-api-key": url}));

      var soil = await Dio().get(
          'https://api.ambeedata.com/soil/latest/by-lat-lng?lat=' +
              _locationData!.latitude.toString() +
              '&lng=' +
              _locationData!.longitude.toString(),
          options: Options(headers: {"x-api-key": url}));

      soilData = soil.data;
      weatherData = weather.data;
      airData = air.data;
      setState(() {
        // Air Data of user's location
        city = airData['stations'][0]['city'];
        country = airData['stations'][0]['countryCode'];
        state = airData['stations'][0]['state'];
        place = airData['stations'][0]['placeName'];
        co = airData['stations'][0]['CO'].toString();
        no2 = airData['stations'][0]['NO2'].toString();
        ozone = airData['stations'][0]['OZONE'].toString();
        pm10 = airData['stations'][0]['PM10'].toString();
        pm25 = airData['stations'][0]['PM25'].toString();
        aqi = airData['stations'][0]['AQI'].toString();
        so2 = airData['stations'][0]['SO2'].toString();

        //Weather Data of user's location
        summary = weatherData['data']['summary'];
        icon = weatherData['data']['icon'];
        temprature = weatherData['data']['temperature'];
        apperentTemperature = weatherData['data']['apparentTemperature'];
        dewPoint = weatherData['data']['dewPoint'].toString();
        humidity = weatherData['data']['humidity'].toString();
        pressure = weatherData['data']['pressure'].toString();
        uvindex = weatherData['data']['uvIndex'].toString();
        ozoneWeather = weatherData['data']['ozone'].toString();
        Database().getData(city).then((value) {
          setState(() {
            soilType = value;
          });
        });
        // Soil Data of User's Location
        temp = soilData['data'][0]['soil_temperature'];
        moisture = soilData['data'][0]['soil_moisture'];
        isLoading = false;
      });
      // ignore: empty_catches
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: !isLoading
          ? SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 80,
                  ),
                  Center(
                    child: Column(
                      children: [
                        Text(
                          place + ", " + city,
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width / 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          state + ", " + country,
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
                                fontWeight: soilBool
                                    ? FontWeight.bold
                                    : FontWeight.w100),
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
                                color:
                                    weatherBool ? Colors.black : Colors.black38,
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
                                fontWeight: airBool
                                    ? FontWeight.bold
                                    : FontWeight.normal),
                          )),
                    ],
                  ),
                  soilBool
                      ? Soil(
                          moisture: moisture,
                          temp: temp,
                          type: soilType,
                        )
                      : weatherBool
                          ? Weather(
                              dewPoint: dewPoint,
                              humidity: humidity,
                              icon: icon,
                              ozone: ozone,
                              pressure: pressure,
                              summary: summary,
                              temprature: temprature,
                              apperentTemperature: apperentTemperature,
                              uvindex: uvindex,
                            )
                          : airBool
                              ? Air(
                                  aqi: aqi,
                                  co: co,
                                  no2: no2,
                                  ozone: ozone,
                                  pm10: pm10,
                                  pm25: pm25,
                                  so2: so2,
                                )
                              : Container()
                ],
              ),
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
      bottomSheet: Image(
        image: const AssetImage('assets/home.png'),
        width: MediaQuery.of(context).size.width,
      ),
    );
  }
}
