import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChatsRecord extends FirestoreRecord {
  ChatsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "userIds" field.
  List<DocumentReference>? _userIds;
  List<DocumentReference> get userIds => _userIds ?? const [];
  bool hasUserIds() => _userIds != null;

  // "lastMessage" field.
  String? _lastMessage;
  String get lastMessage => _lastMessage ?? '';
  bool hasLastMessage() => _lastMessage != null;

  // "displayNames" field.
  List<String>? _displayNames;
  List<String> get displayNames => _displayNames ?? const [];
  bool hasDisplayNames() => _displayNames != null;

  // "timeStamp" field.
  DateTime? _timeStamp;
  DateTime? get timeStamp => _timeStamp;
  bool hasTimeStamp() => _timeStamp != null;

  // "lastMessageSeenBy" field.
  List<DocumentReference>? _lastMessageSeenBy;
  List<DocumentReference> get lastMessageSeenBy =>
      _lastMessageSeenBy ?? const [];
  bool hasLastMessageSeenBy() => _lastMessageSeenBy != null;

  // "listingPic" field.
  String? _listingPic;
  String get listingPic => _listingPic ?? '';
  bool hasListingPic() => _listingPic != null;

  // "listingAddress" field.
  String? _listingAddress;
  String get listingAddress => _listingAddress ?? '';
  bool hasListingAddress() => _listingAddress != null;

  void _initializeFields() {
    _userIds = getDataList(snapshotData['userIds']);
    _lastMessage = snapshotData['lastMessage'] as String?;
    _displayNames = getDataList(snapshotData['displayNames']);
    _timeStamp = snapshotData['timeStamp'] as DateTime?;
    _lastMessageSeenBy = getDataList(snapshotData['lastMessageSeenBy']);
    _listingPic = snapshotData['listingPic'] as String?;
    _listingAddress = snapshotData['listingAddress'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('chats');

  static Stream<ChatsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChatsRecord.fromSnapshot(s));

  static Future<ChatsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ChatsRecord.fromSnapshot(s));

  static ChatsRecord fromSnapshot(DocumentSnapshot snapshot) => ChatsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChatsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ChatsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ChatsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ChatsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createChatsRecordData({
  String? lastMessage,
  DateTime? timeStamp,
  String? listingPic,
  String? listingAddress,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'lastMessage': lastMessage,
      'timeStamp': timeStamp,
      'listingPic': listingPic,
      'listingAddress': listingAddress,
    }.withoutNulls,
  );

  return firestoreData;
}

class ChatsRecordDocumentEquality implements Equality<ChatsRecord> {
  const ChatsRecordDocumentEquality();

  @override
  bool equals(ChatsRecord? e1, ChatsRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.userIds, e2?.userIds) &&
        e1?.lastMessage == e2?.lastMessage &&
        listEquality.equals(e1?.displayNames, e2?.displayNames) &&
        e1?.timeStamp == e2?.timeStamp &&
        listEquality.equals(e1?.lastMessageSeenBy, e2?.lastMessageSeenBy) &&
        e1?.listingPic == e2?.listingPic &&
        e1?.listingAddress == e2?.listingAddress;
  }

  @override
  int hash(ChatsRecord? e) => const ListEquality().hash([
        e?.userIds,
        e?.lastMessage,
        e?.displayNames,
        e?.timeStamp,
        e?.lastMessageSeenBy,
        e?.listingPic,
        e?.listingAddress
      ]);

  @override
  bool isValidKey(Object? o) => o is ChatsRecord;
}
