// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<LatLng> combineLatAndLongIntoLatLngDataType(
  double lat,
  double long,
) async {
  // Takes in two doubles, lat and long, which represent latitude and longitude respectively. The function will convert these two values into a single LatLng data type variable to return
  print(lat);
  print(long);
  LatLng latLng = LatLng(lat, long);
  return latLng;
}
