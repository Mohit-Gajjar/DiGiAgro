import 'package:flutter/material.dart';

class Air extends StatefulWidget {
 final dynamic airData;
  const Air({Key? key,required this.airData}) : super(key: key);

  @override
  _AirState createState() => _AirState();
}

class _AirState extends State<Air> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: const [
          Text("CO2"),
          Text("NO2"),
          Text("OZONE"),
          Text("CO2"),
          Text("CO2"),
          Text("CO2"),
          Text("CO2"),
        ],
      ),
    );
  }
}
class AirData {
  String? message;
  List<Stations>? stations;

  AirData({this.message, this.stations});

  AirData.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['stations'] != null) {
      stations = <Stations>[];
      json['stations'].forEach((v) {
        stations!.add(new Stations.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.stations != null) {
      data['stations'] = this.stations!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Stations {
  double? cO;
  double? nO2;
  double? oZONE;
  double? pM10;
  double? pM25;
  double? sO2;
  String? city;
  String? countryCode;
  String? division;
  double? lat;
  double? lng;
  String? placeName;
  String? postalCode;
  String? state;
  String? updatedAt;
  int? aQI;
  AqiInfo? aqiInfo;

  Stations(
      {this.cO,
      this.nO2,
      this.oZONE,
      this.pM10,
      this.pM25,
      this.sO2,
      this.city,
      this.countryCode,
      this.division,
      this.lat,
      this.lng,
      this.placeName,
      this.postalCode,
      this.state,
      this.updatedAt,
      this.aQI,
      this.aqiInfo});

  Stations.fromJson(Map<String, dynamic> json) {
    cO = json['CO'];
    nO2 = json['NO2'];
    oZONE = json['OZONE'];
    pM10 = json['PM10'];
    pM25 = json['PM25'];
    sO2 = json['SO2'];
    city = json['city'];
    countryCode = json['countryCode'];
    division = json['division'];
    lat = json['lat'];
    lng = json['lng'];
    placeName = json['placeName'];
    postalCode = json['postalCode'];
    state = json['state'];
    updatedAt = json['updatedAt'];
    aQI = json['AQI'];
    aqiInfo =
        json['aqiInfo'] != null ? new AqiInfo.fromJson(json['aqiInfo']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['CO'] = this.cO;
    data['NO2'] = this.nO2;
    data['OZONE'] = this.oZONE;
    data['PM10'] = this.pM10;
    data['PM25'] = this.pM25;
    data['SO2'] = this.sO2;
    data['city'] = this.city;
    data['countryCode'] = this.countryCode;
    data['division'] = this.division;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    data['placeName'] = this.placeName;
    data['postalCode'] = this.postalCode;
    data['state'] = this.state;
    data['updatedAt'] = this.updatedAt;
    data['AQI'] = this.aQI;
    if (this.aqiInfo != null) {
      data['aqiInfo'] = this.aqiInfo!.toJson();
    }
    return data;
  }
}

class AqiInfo {
  String? pollutant;
  double? concentration;
  String? category;

  AqiInfo({this.pollutant, this.concentration, this.category});

  AqiInfo.fromJson(Map<String, dynamic> json) {
    pollutant = json['pollutant'];
    concentration = json['concentration'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pollutant'] = this.pollutant;
    data['concentration'] = this.concentration;
    data['category'] = this.category;
    return data;
  }
}
