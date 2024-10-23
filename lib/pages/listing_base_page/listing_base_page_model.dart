import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'listing_base_page_widget.dart' show ListingBasePageWidget;
import 'package:flutter/material.dart';

class ListingBasePageModel extends FlutterFlowModel<ListingBasePageWidget> {
  ///  Local state fields for this page.

  double? updatePageState;

  ///  State fields for stateful widgets in this page.

  // State field(s) for Search widget.
  FocusNode? searchFocusNode;
  TextEditingController? searchTextController;
  String? Function(BuildContext, String?)? searchTextControllerValidator;
  // Stores action output result for [Backend Call - API (GeocodeAddress)] action in Search widget.
  ApiCallResponse? latLongParsed;
  // Stores action output result for [Custom Action - combineLatAndLongIntoLatLngDataType] action in Search widget.
  LatLng? coordinates;
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
