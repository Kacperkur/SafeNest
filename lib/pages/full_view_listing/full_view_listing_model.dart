import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'full_view_listing_widget.dart' show FullViewListingWidget;
import 'package:flutter/material.dart';

class FullViewListingModel extends FlutterFlowModel<FullViewListingWidget> {
  ///  Local state fields for this page.

  bool isSaved1 = false;

  String chatIdFullView = '0';

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ChatsRecord? newChatId;
  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
