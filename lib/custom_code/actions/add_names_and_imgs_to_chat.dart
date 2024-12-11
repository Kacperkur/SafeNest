// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<void> addNamesAndImgsToChat(ChatsRecord chat) async {
  // Create a function that takes in a chat document. It accesses the document's field called userIds.
  // Using these userIds, it should access these users' documents, pull their display_name fields,
  // combine them into a list and add it to the chat document. It should do the same with their image paths.

  List<DocumentReference> userRefs = chat.userIds;

  List<String> displayNames = [];
  List<String> imagePaths = [];

  for (DocumentReference userRef in userRefs) {
    DocumentSnapshot userDoc = await userRef.get();
    if (userDoc.exists) {
      displayNames.add(userDoc['display_name'] as String);
      imagePaths.add(userDoc['image_path'] as String);
    }
  }

  await chat.reference.update({
    'displayNames': displayNames,
    'imagePaths': imagePaths,
  });
}
