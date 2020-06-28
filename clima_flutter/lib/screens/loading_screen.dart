import 'package:clima/services/location.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() {
    return _LoadingScreenState();
  }
}

class _LoadingScreenState extends State<LoadingScreen> {
  double lat;
  double lon;

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() {
    Location location = Location();
    location.getCurrentLocation();
    print(location.lat);
    print(location.lon);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
