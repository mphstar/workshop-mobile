// ignore_for_file: prefer_final_fields, camel_case_types, unnecessary_brace_in_string_interps, prefer_const_constructors, file_names, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:android_intent_plus/android_intent.dart';


class pageGps2 extends StatefulWidget {
  @override
  State<pageGps2> createState() => _pageGps2State();
}

class _pageGps2State extends State<pageGps2> {
  String location = 'Belum mendapatkan Lat dan long, Silahkan tekan button';
  String address = 'Mencari lokasi...';
  TextEditingController textLokasi = TextEditingController();

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
              'Koordinat Point',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Address',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '${address}', textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () async {
                Position pos = await _determinePosition();
                setState(() {
                  location = '${pos.latitude}, ${pos.longitude}';
                });
                getAddressFromLongLat(pos);
              },
              child: Text('Get Koordinat'),
            ),
            Text(
              'Tujuan Anda',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: textLokasi,
              autofocus: false,
              obscureText: false,
              decoration: InputDecoration(
                  hintText: 'Lokasi Tujuan Anda',
                  contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32),
                  )),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Material(
                borderRadius: BorderRadius.circular(32),
                shadowColor: Colors.lightBlueAccent.shade100,
                elevation: 5.0,
                child: MaterialButton(
                  minWidth: 200.0,
                  height: 42,
                  color: Colors.lightBlueAccent,
                  child: Text(
                    'Cari Alamat',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    final intent = AndroidIntent(
                      action: 'action_view',
                      data: Uri.encodeFull(
                          'google.navigation:q=${textLokasi.text}&avoid=tf'),
                      package: 'com.google.android.apps.maps',
                    );
                    intent.launch();
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<Position> _determinePosition() async {
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

    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }

  Future<void> getAddressFromLongLat(Position position) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);

    Placemark place = placemarks[0];
    setState(() {
      address =
          '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}. ${place.country}';
    });
  }
}
