// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<List<DocumentReference>?>
    queryFirestoreForDocumentReferencesBasedOnLocation(String? location) async {
  List<DocumentReference> documentReferences = [];

  // Mapping of full state names to abbreviations
  Map<String, String> stateAbbreviations = {
    'Alabama': 'AL',
    'Alaska': 'AK',
    'Arizona': 'AZ',
    'Arkansas': 'AR',
    'California': 'CA',
    'Colorado': 'CO',
    'Connecticut': 'CT',
    'Delaware': 'DE',
    'Florida': 'FL',
    'Georgia': 'GA',
    'Hawaii': 'HI',
    'Idaho': 'ID',
    'Illinois': 'IL',
    'Indiana': 'IN',
    'Iowa': 'IA',
    'Kansas': 'KS',
    'Kentucky': 'KY',
    'Louisiana': 'LA',
    'Maine': 'ME',
    'Maryland': 'MD',
    'Massachusetts': 'MA',
    'Michigan': 'MI',
    'Minnesota': 'MN',
    'Mississippi': 'MS',
    'Missouri': 'MO',
    'Montana': 'MT',
    'Nebraska': 'NE',
    'Nevada': 'NV',
    'New Hampshire': 'NH',
    'New Jersey': 'NJ',
    'New Mexico': 'NM',
    'New York': 'NY',
    'North Carolina': 'NC',
    'North Dakota': 'ND',
    'Ohio': 'OH',
    'Oklahoma': 'OK',
    'Oregon': 'OR',
    'Pennsylvania': 'PA',
    'Rhode Island': 'RI',
    'South Carolina': 'SC',
    'South Dakota': 'SD',
    'Tennessee': 'TN',
    'Texas': 'TX',
    'Utah': 'UT',
    'Vermont': 'VT',
    'Virginia': 'VA',
    'Washington': 'WA',
    'West Virginia': 'WV',
    'Wisconsin': 'WI',
    'Wyoming': 'WY'
  };

  // Convert full state name to abbreviation if necessary
  String? locationLower = location?.toLowerCase();
  stateAbbreviations.forEach((fullName, abbreviation) {
    if (locationLower?.contains(fullName.toLowerCase()) ?? false) {
      location = locationLower?.replaceAll(
          fullName.toLowerCase(), abbreviation.toLowerCase());
    }
  });

  // Query Firestore collection
  QuerySnapshot querySnapshot =
      await FirebaseFirestore.instance.collection('Listings').get();

  // Loop through each document in the collection
  for (var doc in querySnapshot.docs) {
    var data = doc.data() as Map<String, dynamic>;
    String street = data['street'] ?? '';
    String city = data['city'] ?? '';
    String state = data['state'] ?? '';
    String zipcode = data['zipcode'] ?? '';

    // Create combinations of address components
    List<String> addressCombinations = [
      street,
      '$street, $city',
      '$street, $city, $state',
      '$street, $city, $state $zipcode',
      city,
      '$city, $state',
      '$city, $state $zipcode',
      state,
      '$state $zipcode',
      zipcode
    ];

    // Check if any combination matches the location input
    bool matchesLocation = addressCombinations.any((combination) =>
        combination.toLowerCase().contains(location?.toLowerCase() ?? ''));

    if (matchesLocation) {
      // Add the document reference to the list
      documentReferences.add(doc.reference);
    }
  }
  ;

  return documentReferences;
}
