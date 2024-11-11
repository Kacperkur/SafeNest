import '/components/amenity_box_widget.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'full_view_listing_widget.dart' show FullViewListingWidget;
import 'package:flutter/material.dart';

class FullViewListingModel extends FlutterFlowModel<FullViewListingWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for AmenityBox component.
  late AmenityBoxModel amenityBoxModel;
  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();

  @override
  void initState(BuildContext context) {
    amenityBoxModel = createModel(context, () => AmenityBoxModel());
  }

  @override
  void dispose() {
    amenityBoxModel.dispose();
  }
}
