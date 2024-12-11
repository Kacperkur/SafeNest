// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future setShowNpsToFalse(DocumentReference authUserRef) async {
  // write a custom action that takes in a users document reference, accesses their showNps field, and sets it to false

  try {
    await authUserRef.update({'showNPS': false});
    print('showNps field set to false successfully');
  } catch (e) {
    print('Error setting showNps field to false: $e');
  }
}
