/*import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:background_location/background_location.dart';
import 'package:flutter/material.dart';

import 'package:path_provider/path_provider.dart';


class Location extends StatefulWidget {

  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {
  String latitude = 'waiting...';
  String longitude = 'waiting...';
  String altitude = 'waiting...';
  String accuracy = 'waiting...';
  String bearing = 'waiting...';
  String speed = 'waiting...';
  String time = 'waiting...';


  Future<String> getFilePath() async {
    Directory appDocumentsDirectory = await getApplicationDocumentsDirectory();
    String appDocumentsPath = appDocumentsDirectory.path;
    String filePath = '$appDocumentsPath/demoTextFile.json';

    return filePath;
  }

  void saveFile(data) async {
    File file = File(await getFilePath());
    file.writeAsString(
        data);
    var path = await getFilePath();
    print(getFilePath());
  }


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Background Location Service'),
        ),
        body: Center(
          child: ListView(
            children: <Widget>[
              locationData('Latitude: ' + latitude),
              locationData('Longitude: ' + longitude),
              locationData('Altitude: ' + altitude),
              locationData('Accuracy: ' + accuracy),
              locationData('Bearing: ' + bearing),
              locationData('Speed: ' + speed),
              locationData('Time: ' + time),
              ElevatedButton(
                  onPressed: () async {
                    //await BackgroundLocation.setAndroidConfiguration(1000);
                    await BackgroundLocation.startLocationService(
                        distanceFilter: 20);
                    BackgroundLocation.getLocationUpdates((location) {
                      setState(() {
                        latitude = location.latitude.toString();
                        longitude = location.longitude.toString();
                        accuracy = location.accuracy.toString();
                        altitude = location.altitude.toString();
                        bearing = location.bearing.toString();
                        speed = location.speed.toString();
                        time = DateTime.fromMillisecondsSinceEpoch(
                            location.time.toInt())
                            .toString();
                      });

                      Map data = {
                        'latitude':  location.latitude.toString(),
                        'longitude': location.longitude.toString(),
                        'time': DateTime.fromMillisecondsSinceEpoch(
                            location.time.toInt())
                            .toString()
                      };


                      saveFile(json.encode(data));

                      print('''\n
                        Latitude:  $latitude
                        Longitude: $longitude
                        Altitude: $altitude
                        Accuracy: $accuracy
                        Bearing:  $bearing
                        Speed: $speed
                        Time: $time
                      ''');
                    });
                  },
                  child: Text('Start Location Service')),
              ElevatedButton(
                  onPressed: () {
                    BackgroundLocation.stopLocationService();
                  },
                  child: Text('Stop Location Service')),
              ElevatedButton(
                  onPressed: () {
                    getCurrentLocation();
                  },
                  child: Text('Get Current Location')),
            ],
          ),
        ),
      ),
    );
  }

  Widget locationData(String data) {
    return Text(
      data,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
      textAlign: TextAlign.center,
    );
  }

  void getCurrentLocation() {
    BackgroundLocation().getCurrentLocation().then((location) {
      print('This is current Location ' + location.toMap().toString());
    });
  }

  @override
  void dispose() {
    BackgroundLocation.stopLocationService();
    super.dispose();
  }
}
*/