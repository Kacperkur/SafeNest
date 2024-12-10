import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'listing_base_page_widget.dart' show ListingBasePageWidget;
import 'package:flutter/material.dart';

class ListingBasePageModel extends FlutterFlowModel<ListingBasePageWidget> {
  ///  Local state fields for this page.

  double? updatePageState;

  bool isSaved = false;

  List<LatLng> latLngListPageState = [];
  void addToLatLngListPageState(LatLng item) => latLngListPageState.add(item);
  void removeFromLatLngListPageState(LatLng item) =>
      latLngListPageState.remove(item);
  void removeAtIndexFromLatLngListPageState(int index) =>
      latLngListPageState.removeAt(index);
  void insertAtIndexInLatLngListPageState(int index, LatLng item) =>
      latLngListPageState.insert(index, item);
  void updateLatLngListPageStateAtIndex(int index, Function(LatLng) updateFn) =>
      latLngListPageState[index] = updateFn(latLngListPageState[index]);

  String? userSubmittedLocation;

  LatLng? apiLatLng;

  double? apiLat;

  double? apiLng;

  List<DocumentReference> documentReferenceList = [];
  void addToDocumentReferenceList(DocumentReference item) =>
      documentReferenceList.add(item);
  void removeFromDocumentReferenceList(DocumentReference item) =>
      documentReferenceList.remove(item);
  void removeAtIndexFromDocumentReferenceList(int index) =>
      documentReferenceList.removeAt(index);
  void insertAtIndexInDocumentReferenceList(
          int index, DocumentReference item) =>
      documentReferenceList.insert(index, item);
  void updateDocumentReferenceListAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      documentReferenceList[index] = updateFn(documentReferenceList[index]);

  ///  State fields for stateful widgets in this page.

  // State field(s) for Search widget.
  FocusNode? searchFocusNode;
  TextEditingController? searchTextController;
  String? Function(BuildContext, String?)? searchTextControllerValidator;
  // Stores action output result for [Backend Call - API (GeocodeAddress)] action in Search widget.
  ApiCallResponse? latLongAPI;
  // Stores action output result for [Custom Action - combineLatAndLongIntoLatLngDataType] action in Search widget.
  LatLng? apiLatLngReturned;
  // Stores action output result for [Custom Action - queryFirestoreCollectionBasedOnLocationToMakeMarkersOnGoogleMapsWidget] action in Search widget.
  List<LatLng>? latLngList;
  // Stores action output result for [Custom Action - queryFirestoreForDocumentReferencesBasedOnLocation] action in Search widget.
  List<DocumentReference>? documentReferences;
  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    searchFocusNode?.dispose();
    searchTextController?.dispose();
  }
}
