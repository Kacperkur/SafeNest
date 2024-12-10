import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

List<DocumentReference> generateUserList(
  DocumentReference authUser,
  DocumentReference landlord,
) {
  return [authUser, landlord];
}

List<String> generateUsersNames(
  String authUserName,
  String landlordName,
) {
  return [authUserName, landlordName];
}

String returnOtherName(
  List<String> userNameList,
  String authUserName,
) {
  return authUserName == userNameList.first
      ? userNameList.last
      : userNameList.first;
}
