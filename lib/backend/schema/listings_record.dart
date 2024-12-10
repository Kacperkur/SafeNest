import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ListingsRecord extends FirestoreRecord {
  ListingsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "bathroom" field.
  int? _bathroom;
  int get bathroom => _bathroom ?? 0;
  bool hasBathroom() => _bathroom != null;

  // "bedroom" field.
  int? _bedroom;
  int get bedroom => _bedroom ?? 0;
  bool hasBedroom() => _bedroom != null;

  // "city" field.
  String? _city;
  String get city => _city ?? '';
  bool hasCity() => _city != null;

  // "latitude" field.
  double? _latitude;
  double get latitude => _latitude ?? 0.0;
  bool hasLatitude() => _latitude != null;

  // "longitude" field.
  double? _longitude;
  double get longitude => _longitude ?? 0.0;
  bool hasLongitude() => _longitude != null;

  // "rentEstimate" field.
  int? _rentEstimate;
  int get rentEstimate => _rentEstimate ?? 0;
  bool hasRentEstimate() => _rentEstimate != null;

  // "state" field.
  String? _state;
  String get state => _state ?? '';
  bool hasState() => _state != null;

  // "street" field.
  String? _street;
  String get street => _street ?? '';
  bool hasStreet() => _street != null;

  // "zipcode" field.
  String? _zipcode;
  String get zipcode => _zipcode ?? '';
  bool hasZipcode() => _zipcode != null;

  // "amenities" field.
  List<String>? _amenities;
  List<String> get amenities => _amenities ?? const [];
  bool hasAmenities() => _amenities != null;

  // "img_url" field.
  String? _imgUrl;
  String get imgUrl => _imgUrl ?? '';
  bool hasImgUrl() => _imgUrl != null;

  // "area" field.
  int? _area;
  int get area => _area ?? 0;
  bool hasArea() => _area != null;

  // "saved_by" field.
  List<DocumentReference>? _savedBy;
  List<DocumentReference> get savedBy => _savedBy ?? const [];
  bool hasSavedBy() => _savedBy != null;

  // "landlord_ID" field.
  DocumentReference? _landlordID;
  DocumentReference? get landlordID => _landlordID;
  bool hasLandlordID() => _landlordID != null;

  // "landlord_display_name" field.
  String? _landlordDisplayName;
  String get landlordDisplayName => _landlordDisplayName ?? '';
  bool hasLandlordDisplayName() => _landlordDisplayName != null;

  // "cityReference" field.
  DocumentReference? _cityReference;
  DocumentReference? get cityReference => _cityReference;
  bool hasCityReference() => _cityReference != null;

  void _initializeFields() {
    _bathroom = castToType<int>(snapshotData['bathroom']);
    _bedroom = castToType<int>(snapshotData['bedroom']);
    _city = snapshotData['city'] as String?;
    _latitude = castToType<double>(snapshotData['latitude']);
    _longitude = castToType<double>(snapshotData['longitude']);
    _rentEstimate = castToType<int>(snapshotData['rentEstimate']);
    _state = snapshotData['state'] as String?;
    _street = snapshotData['street'] as String?;
    _zipcode = snapshotData['zipcode'] as String?;
    _amenities = getDataList(snapshotData['amenities']);
    _imgUrl = snapshotData['img_url'] as String?;
    _area = castToType<int>(snapshotData['area']);
    _savedBy = getDataList(snapshotData['saved_by']);
    _landlordID = snapshotData['landlord_ID'] as DocumentReference?;
    _landlordDisplayName = snapshotData['landlord_display_name'] as String?;
    _cityReference = snapshotData['cityReference'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Listings');

  static Stream<ListingsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ListingsRecord.fromSnapshot(s));

  static Future<ListingsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ListingsRecord.fromSnapshot(s));

  static ListingsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ListingsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ListingsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ListingsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ListingsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ListingsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createListingsRecordData({
  int? bathroom,
  int? bedroom,
  String? city,
  double? latitude,
  double? longitude,
  int? rentEstimate,
  String? state,
  String? street,
  String? zipcode,
  String? imgUrl,
  int? area,
  DocumentReference? landlordID,
  String? landlordDisplayName,
  DocumentReference? cityReference,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'bathroom': bathroom,
      'bedroom': bedroom,
      'city': city,
      'latitude': latitude,
      'longitude': longitude,
      'rentEstimate': rentEstimate,
      'state': state,
      'street': street,
      'zipcode': zipcode,
      'img_url': imgUrl,
      'area': area,
      'landlord_ID': landlordID,
      'landlord_display_name': landlordDisplayName,
      'cityReference': cityReference,
    }.withoutNulls,
  );

  return firestoreData;
}

class ListingsRecordDocumentEquality implements Equality<ListingsRecord> {
  const ListingsRecordDocumentEquality();

  @override
  bool equals(ListingsRecord? e1, ListingsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.bathroom == e2?.bathroom &&
        e1?.bedroom == e2?.bedroom &&
        e1?.city == e2?.city &&
        e1?.latitude == e2?.latitude &&
        e1?.longitude == e2?.longitude &&
        e1?.rentEstimate == e2?.rentEstimate &&
        e1?.state == e2?.state &&
        e1?.street == e2?.street &&
        e1?.zipcode == e2?.zipcode &&
        listEquality.equals(e1?.amenities, e2?.amenities) &&
        e1?.imgUrl == e2?.imgUrl &&
        e1?.area == e2?.area &&
        listEquality.equals(e1?.savedBy, e2?.savedBy) &&
        e1?.landlordID == e2?.landlordID &&
        e1?.landlordDisplayName == e2?.landlordDisplayName &&
        e1?.cityReference == e2?.cityReference;
  }

  @override
  int hash(ListingsRecord? e) => const ListEquality().hash([
        e?.bathroom,
        e?.bedroom,
        e?.city,
        e?.latitude,
        e?.longitude,
        e?.rentEstimate,
        e?.state,
        e?.street,
        e?.zipcode,
        e?.amenities,
        e?.imgUrl,
        e?.area,
        e?.savedBy,
        e?.landlordID,
        e?.landlordDisplayName,
        e?.cityReference
      ]);

  @override
  bool isValidKey(Object? o) => o is ListingsRecord;
}
