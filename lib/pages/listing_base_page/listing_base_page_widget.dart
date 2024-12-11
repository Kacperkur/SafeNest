import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/new_listing_widget.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'listing_base_page_model.dart';
export 'listing_base_page_model.dart';

class ListingBasePageWidget extends StatefulWidget {
  const ListingBasePageWidget({super.key});

  @override
  State<ListingBasePageWidget> createState() => _ListingBasePageWidgetState();
}

class _ListingBasePageWidgetState extends State<ListingBasePageWidget> {
  late ListingBasePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListingBasePageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'listingBasePage'});
    getCurrentUserLocation(defaultLocation: const LatLng(0.0, 0.0), cached: true)
        .then((loc) => safeSetState(() => currentUserLocationValue = loc));
    _model.searchTextController ??= TextEditingController();
    _model.searchFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (currentUserLocationValue == null) {
      return Container(
        color: FlutterFlowTheme.of(context).primaryBackground,
        child: Center(
          child: SizedBox(
            width: 50.0,
            height: 50.0,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                FlutterFlowTheme.of(context).primary,
              ),
            ),
          ),
        ),
      );
    }

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        resizeToAvoidBottomInset: false,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        drawer: SizedBox(
          width: 250.0,
          child: Drawer(
            elevation: 16.0,
            child: Builder(
              builder: (context) {
                final drawerListingItem =
                    _model.documentReferences?.toList() ?? [];

                return SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: List.generate(drawerListingItem.length,
                        (drawerListingItemIndex) {
                      final drawerListingItemItem =
                          drawerListingItem[drawerListingItemIndex];
                      return StreamBuilder<ListingsRecord>(
                        stream:
                            ListingsRecord.getDocument(drawerListingItemItem),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                              ),
                            );
                          }

                          final listViewListingsRecord = snapshot.data!;

                          return ListView(
                            padding: EdgeInsets.zero,
                            primary: false,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            children: [
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'LISTING_BASE_Container_jt364uc0_ON_TAP');
                                  logFirebaseEvent('NewListing_navigate_to');

                                  context.pushNamed(
                                    'FullViewListing',
                                    queryParameters: {
                                      'drawerDocRef': serializeParam(
                                        listViewListingsRecord.reference,
                                        ParamType.DocumentReference,
                                      ),
                                    }.withoutNulls,
                                  );
                                },
                                child: NewListingWidget(
                                  key: Key(
                                      'Keyjt3_${drawerListingItemIndex}_of_${drawerListingItem.length}'),
                                  price: valueOrDefault<int>(
                                    listViewListingsRecord.rentEstimate,
                                    1,
                                  ),
                                  bathrooms: valueOrDefault<String>(
                                    listViewListingsRecord.bathroom.toString(),
                                    '1',
                                  ),
                                  bedrooms: valueOrDefault<String>(
                                    listViewListingsRecord.bedroom.toString(),
                                    '1',
                                  ),
                                  area: valueOrDefault<String>(
                                    listViewListingsRecord.area.toString(),
                                    '1',
                                  ),
                                  street: listViewListingsRecord.street,
                                  city: listViewListingsRecord.city,
                                  state: listViewListingsRecord.state,
                                  zipcode: valueOrDefault<String>(
                                    listViewListingsRecord.zipcode,
                                    '[zip]',
                                  ),
                                  photo: valueOrDefault<String>(
                                    listViewListingsRecord.imgUrl,
                                    'https://preview.redd.it/eo6v6k01xua51.png?auto=webp&s=ac261c1ecc049b48936a0d5bb56653044c50fac0',
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    }).divide(const SizedBox(height: 12.0)),
                  ),
                );
              },
            ),
          ),
        ),
        body: Align(
          alignment: const AlignmentDirectional(0.0, 0.0),
          child: Container(
            width: double.infinity,
            height: 852.0,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF8A7EF4), Colors.white],
                stops: [0.0, 1.0],
                begin: AlignmentDirectional(0.0, -1.0),
                end: AlignmentDirectional(0, 1.0),
              ),
            ),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 12.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Align(
                            alignment: const AlignmentDirectional(-1.0, 0.0),
                            child: Container(
                              decoration: const BoxDecoration(),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        8.0, 0.0, 0.0, 0.0),
                                    child: FutureBuilder<ApiCallResponse>(
                                      future: GeocodeAddressCall.call(
                                        locationToAPI:
                                            _model.searchTextController.text,
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50.0,
                                              height: 50.0,
                                              child: CircularProgressIndicator(
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                        final searchGeocodeAddressResponse =
                                            snapshot.data!;

                                        return SizedBox(
                                          width: 240.0,
                                          child: TextFormField(
                                            key: const ValueKey('Search_rm8l'),
                                            controller:
                                                _model.searchTextController,
                                            focusNode: _model.searchFocusNode,
                                            onFieldSubmitted: (_) async {
                                              logFirebaseEvent(
                                                  'LISTING_BASE_Search_ON_TEXTFIELD_SUBMIT');
                                              var shouldSetState = false;
                                              logFirebaseEvent(
                                                  'Search_update_page_state');
                                              _model.userSubmittedLocation =
                                                  _model.searchTextController
                                                      .text;
                                              safeSetState(() {});
                                              logFirebaseEvent(
                                                  'Search_backend_call');
                                              _model.latLongAPI =
                                                  await GeocodeAddressCall.call(
                                                locationToAPI: _model
                                                    .userSubmittedLocation,
                                              );

                                              shouldSetState = true;
                                              if ((_model
                                                      .latLongAPI?.succeeded ??
                                                  true)) {
                                                logFirebaseEvent(
                                                    'Search_wait__delay');
                                                await Future.delayed(
                                                    const Duration(
                                                        milliseconds: 1000));
                                                logFirebaseEvent(
                                                    'Search_update_page_state');
                                                _model.apiLat =
                                                    GeocodeAddressCall.lat(
                                                  (_model.latLongAPI
                                                          ?.jsonBody ??
                                                      ''),
                                                );
                                                safeSetState(() {});
                                                logFirebaseEvent(
                                                    'Search_update_page_state');
                                                _model.apiLng =
                                                    GeocodeAddressCall.long(
                                                  (_model.latLongAPI
                                                          ?.jsonBody ??
                                                      ''),
                                                );
                                                safeSetState(() {});
                                              } else {
                                                if (shouldSetState) {
                                                  safeSetState(() {});
                                                }
                                                return;
                                              }

                                              logFirebaseEvent(
                                                  'Search_custom_action');
                                              _model.apiLatLngReturned =
                                                  await actions
                                                      .combineLatAndLongIntoLatLngDataType(
                                                _model.apiLat!,
                                                _model.apiLng!,
                                              );
                                              shouldSetState = true;
                                              logFirebaseEvent(
                                                  'Search_update_page_state');
                                              _model.apiLatLng =
                                                  _model.apiLatLngReturned;
                                              safeSetState(() {});
                                              logFirebaseEvent(
                                                  'Search_google_map');
                                              await _model
                                                  .googleMapsController.future
                                                  .then(
                                                (c) => c.animateCamera(
                                                  CameraUpdate.newLatLng(_model
                                                      .apiLatLng!
                                                      .toGoogleMaps()),
                                                ),
                                              );
                                              logFirebaseEvent(
                                                  'Search_custom_action');
                                              _model.latLngList = await actions
                                                  .queryFirestoreCollectionBasedOnLocationToMakeMarkersOnGoogleMapsWidget(
                                                _model.userSubmittedLocation,
                                              );
                                              shouldSetState = true;
                                              logFirebaseEvent(
                                                  'Search_update_page_state');
                                              _model.latLngListPageState =
                                                  _model.latLngList!
                                                      .toList()
                                                      .cast<LatLng>();
                                              safeSetState(() {});
                                              logFirebaseEvent(
                                                  'Search_custom_action');
                                              _model.documentReferences =
                                                  await actions
                                                      .queryFirestoreForDocumentReferencesBasedOnLocation(
                                                _model.userSubmittedLocation,
                                              );
                                              shouldSetState = true;
                                              logFirebaseEvent(
                                                  'Search_update_page_state');
                                              _model.documentReferenceList =
                                                  _model.documentReferences!
                                                      .toList()
                                                      .cast<
                                                          DocumentReference>();
                                              safeSetState(() {});
                                              if (shouldSetState) {
                                                safeSetState(() {});
                                              }
                                            },
                                            autofocus: false,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              isDense: true,
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        letterSpacing: 0.0,
                                                      ),
                                              hintText:
                                                  'Street, City, State, Zip',
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        letterSpacing: 0.0,
                                                      ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(24.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(24.0),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(24.0),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(24.0),
                                              ),
                                              filled: true,
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  letterSpacing: 0.0,
                                                ),
                                            textAlign: TextAlign.center,
                                            validator: _model
                                                .searchTextControllerValidator
                                                .asValidator(context),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(0.0),
                                    ),
                                  ),
                                ].divide(const SizedBox(width: 12.0)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 400.0,
                      height: 680.0,
                      decoration: const BoxDecoration(),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(
                                alignment: const AlignmentDirectional(-1.0, 0.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'LISTING_BASE_DisplayListings_ON_TAP');
                                    logFirebaseEvent('DisplayListings_drawer');
                                    scaffoldKey.currentState!.openDrawer();
                                  },
                                  text: '',
                                  options: FFButtonOptions(
                                    width: 15.0,
                                    height: 550.0,
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Inter Tight',
                                          color: Colors.white,
                                          letterSpacing: 0.0,
                                        ),
                                    elevation: 0.0,
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      width: 3.0,
                                    ),
                                    borderRadius: BorderRadius.circular(68.0),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  2.0, 0.0, 10.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          2.0, 24.0, 2.0, 24.0),
                                      child: Container(
                                        width: 400.0,
                                        height: 100.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius: const BorderRadius.only(
                                            bottomLeft: Radius.circular(0.0),
                                            bottomRight: Radius.circular(0.0),
                                            topLeft: Radius.circular(0.0),
                                            topRight: Radius.circular(0.0),
                                          ),
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            width: 4.0,
                                          ),
                                        ),
                                        child: FlutterFlowGoogleMap(
                                          controller:
                                              _model.googleMapsController,
                                          onCameraIdle: (latLng) =>
                                              safeSetState(() => _model
                                                  .googleMapsCenter = latLng),
                                          initialLocation:
                                              _model.googleMapsCenter ??=
                                                  currentUserLocationValue!,
                                          markers: (_model.latLngList ?? [])
                                              .map(
                                                (marker) => FlutterFlowMarker(
                                                  marker.serialize(),
                                                  marker,
                                                ),
                                              )
                                              .toList(),
                                          markerColor: GoogleMarkerColor.violet,
                                          mapType: MapType.normal,
                                          style: GoogleMapStyle.standard,
                                          initialZoom: 14.0,
                                          allowInteraction: true,
                                          allowZoom: true,
                                          showZoomControls: true,
                                          showLocation: true,
                                          showCompass: false,
                                          showMapToolbar: false,
                                          showTraffic: false,
                                          centerMapOnMarkerTap: true,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
