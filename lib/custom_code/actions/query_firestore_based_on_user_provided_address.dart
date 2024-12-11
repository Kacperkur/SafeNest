// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<void> queryFirestoreBasedOnUserProvidedAddress(
    String? propertyAddress, String userId) async {
  print("start of function");

  if (propertyAddress == null || userId.isEmpty) {
    print("Invalid property address or user ID");
    return;
  }

  // Mapping of street types to their abbreviations
  Map<String, String> streetTypeMap = {
    'Street': 'St',
    'Avenue': 'Ave',
    'Boulevard': 'Blvd',
    'Road': 'Rd',
    'Drive': 'Dr',
    'Lane': 'Ln',
    'Court': 'Ct',
    'Terrace': 'Ter',
    'Place': 'Pl',
    'Square': 'Sq',
    'Trail': 'Trl',
    'Parkway': 'Pkwy',
    'Commons': 'Cmns'
  };

  // Mapping of state names to their abbreviations
  Map<String, String> stateMap = {
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

  // Function to replace street types and state names with abbreviations
  String abbreviateAddress(String address) {
    streetTypeMap.forEach((full, abbr) {
      address = address.replaceAll(full, abbr);
    });
    stateMap.forEach((full, abbr) {
      address = address.replaceAll(full, abbr);
    });
    return address;
  }

  // Abbreviate the provided property address
  propertyAddress = abbreviateAddress(propertyAddress);

  print("before query");

  // Query Firestore for the Listings collection
  QuerySnapshot querySnapshot =
      await FirebaseFirestore.instance.collection('Listings').get();

  print("fetch user doc");

  // Fetch the user's document to get the display_name
  DocumentSnapshot userDoc =
      await FirebaseFirestore.instance.collection('users').doc(userId).get();
  String displayName = userDoc.get('display_name');

  print("cycle listings");

  // Loop through each document in the collection
  for (var doc in querySnapshot.docs) {
    // Get the street, city, state, and zipcode fields from the document
    String street = doc['street'];
    String city = doc['city'];
    String state = doc['state'];
    String zipcode = doc['zipcode'];

    // Combine the fields into an address format
    String address = '$street, $city, $state, $zipcode';

    // Abbreviate the address from Firestore
    address = abbreviateAddress(address);

    print("before match test");

    // Compare if the provided propertyAddress matches
    if (propertyAddress == address) {
      print("Address found: $address");

      // Add a reference to that document into the user's owned_property field
      await FirebaseFirestore.instance.collection('users').doc(userId).update({
        'owned_property': FieldValue.arrayUnion([doc.reference])
      });

      print("Before updating document");
      // Update the landlord_Id field and add the display_name to the listing document
      await doc.reference.update({
        'landlord_ID':
            FirebaseFirestore.instance.collection('users').doc(userId),
        'landlord_display_name': displayName
      });

      // Stop searching through the rest of the listings documents
      break;
    }
  }
}
