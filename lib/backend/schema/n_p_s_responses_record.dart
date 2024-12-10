import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NPSResponsesRecord extends FirestoreRecord {
  NPSResponsesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "userId" field.
  DocumentReference? _userId;
  DocumentReference? get userId => _userId;
  bool hasUserId() => _userId != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  // "rating" field.
  double? _rating;
  double get rating => _rating ?? 0.0;
  bool hasRating() => _rating != null;

  void _initializeFields() {
    _userId = snapshotData['userId'] as DocumentReference?;
    _timestamp = snapshotData['timestamp'] as DateTime?;
    _rating = castToType<double>(snapshotData['rating']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('NPSResponses');

  static Stream<NPSResponsesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NPSResponsesRecord.fromSnapshot(s));

  static Future<NPSResponsesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NPSResponsesRecord.fromSnapshot(s));

  static NPSResponsesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      NPSResponsesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NPSResponsesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NPSResponsesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NPSResponsesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NPSResponsesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNPSResponsesRecordData({
  DocumentReference? userId,
  DateTime? timestamp,
  double? rating,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userId': userId,
      'timestamp': timestamp,
      'rating': rating,
    }.withoutNulls,
  );

  return firestoreData;
}

class NPSResponsesRecordDocumentEquality
    implements Equality<NPSResponsesRecord> {
  const NPSResponsesRecordDocumentEquality();

  @override
  bool equals(NPSResponsesRecord? e1, NPSResponsesRecord? e2) {
    return e1?.userId == e2?.userId &&
        e1?.timestamp == e2?.timestamp &&
        e1?.rating == e2?.rating;
  }

  @override
  int hash(NPSResponsesRecord? e) =>
      const ListEquality().hash([e?.userId, e?.timestamp, e?.rating]);

  @override
  bool isValidKey(Object? o) => o is NPSResponsesRecord;
}
