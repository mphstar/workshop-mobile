// ignore_for_file: prefer_final_fields, camel_case_types, unnecessary_brace_in_string_interps, prefer_const_constructors, file_names, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class pageGps extends StatefulWidget {
  @override
  State<pageGps> createState() => _pageGpsState();
}

class _pageGpsState extends State<pageGps> {
  Position _myPosition = Position(
    longitude: 0,
    latitude: 0,
    timestamp: DateTime.now(),
    accuracy: 0,
    altitude: 0.0,
    heading: 0.0,
    speed: 0.0,
    speedAccuracy: 0.0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page GPS'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${_myPosition}',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _determinePosition(),
        tooltip: 'Cek GPS',
        child: Icon(Icons.location_on),
      ),
    );
  }

  Future<void> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location service belum aktif');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permission ditolak');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permission ditolak, gagal request permission');
    }

    Position myPosition = await Geolocator.getCurrentPosition();
    setState(() {
      _myPosition = myPosition;
    });
  }
}
