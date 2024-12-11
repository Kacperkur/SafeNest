import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CrimeStatisticsRecord extends FirestoreRecord {
  CrimeStatisticsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "city" field.
  String? _city;
  String get city => _city ?? '';
  bool hasCity() => _city != null;

  // "crimeRate" field.
  String? _crimeRate;
  String get crimeRate => _crimeRate ?? '';
  bool hasCrimeRate() => _crimeRate != null;

  // "nonviolent" field.
  int? _nonviolent;
  int get nonviolent => _nonviolent ?? 0;
  bool hasNonviolent() => _nonviolent != null;

  // "violent" field.
  int? _violent;
  int get violent => _violent ?? 0;
  bool hasViolent() => _violent != null;

  // "population" field.
  int? _population;
  int get population => _population ?? 0;
  bool hasPopulation() => _population != null;

  void _initializeFields() {
    _city = snapshotData['city'] as String?;
    _crimeRate = snapshotData['crimeRate'] as String?;
    _nonviolent = castToType<int>(snapshotData['nonviolent']);
    _violent = castToType<int>(snapshotData['violent']);
    _population = castToType<int>(snapshotData['population']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('crime_statistics');

  static Stream<CrimeStatisticsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CrimeStatisticsRecord.fromSnapshot(s));

  static Future<CrimeStatisticsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CrimeStatisticsRecord.fromSnapshot(s));

  static CrimeStatisticsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CrimeStatisticsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CrimeStatisticsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CrimeStatisticsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CrimeStatisticsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CrimeStatisticsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCrimeStatisticsRecordData({
  String? city,
  String? crimeRate,
  int? nonviolent,
  int? violent,
  int? population,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'city': city,
      'crimeRate': crimeRate,
      'nonviolent': nonviolent,
      'violent': violent,
      'population': population,
    }.withoutNulls,
  );

  return firestoreData;
}

class CrimeStatisticsRecordDocumentEquality
    implements Equality<CrimeStatisticsRecord> {
  const CrimeStatisticsRecordDocumentEquality();

  @override
  bool equals(CrimeStatisticsRecord? e1, CrimeStatisticsRecord? e2) {
    return e1?.city == e2?.city &&
        e1?.crimeRate == e2?.crimeRate &&
        e1?.nonviolent == e2?.nonviolent &&
        e1?.violent == e2?.violent &&
        e1?.population == e2?.population;
  }

  @override
  int hash(CrimeStatisticsRecord? e) => const ListEquality()
      .hash([e?.city, e?.crimeRate, e?.nonviolent, e?.violent, e?.population]);

  @override
  bool isValidKey(Object? o) => o is CrimeStatisticsRecord;
}
