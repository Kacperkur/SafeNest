import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/new_listing_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'saved_listing_page_model.dart';
export 'saved_listing_page_model.dart';

class SavedListingPageWidget extends StatefulWidget {
  const SavedListingPageWidget({super.key});

  @override
  State<SavedListingPageWidget> createState() => _SavedListingPageWidgetState();
}

class _SavedListingPageWidgetState extends State<SavedListingPageWidget> {
  late SavedListingPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SavedListingPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'SavedListingPage'});
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Align(
          alignment: const AlignmentDirectional(0.0, 0.0),
          child: Container(
            width: MediaQuery.sizeOf(context).width * 3.93,
            height: MediaQuery.sizeOf(context).height * 8.52,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF8A7EF4), Colors.white],
                stops: [0.0, 1.0],
                begin: AlignmentDirectional(0.0, -1.0),
                end: AlignmentDirectional(0, 1.0),
              ),
            ),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 24.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 30.0, 0.0),
                          child: FlutterFlowIconButton(
                            borderRadius: 8.0,
                            buttonSize: 40.0,
                            icon: Icon(
                              Icons.arrow_back,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 24.0,
                            ),
                            onPressed: () async {
                              logFirebaseEvent(
                                  'SAVED_LISTING_arrow_back_ICN_ON_TAP');
                              logFirebaseEvent('IconButton_navigate_to');

                              context.pushNamed('profileBasePage');
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 12.0),
                          child: Text(
                            'Saved Listings',
                            style: FlutterFlowTheme.of(context)
                                .headlineMedium
                                .override(
                                  fontFamily: 'Inter Tight',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      child: StreamBuilder<List<ListingsRecord>>(
                        stream: queryListingsRecord(
                          queryBuilder: (listingsRecord) =>
                              listingsRecord.where(
                            'saved_by',
                            arrayContains: currentUserReference,
                          ),
                        ),
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
                          List<ListingsRecord> listViewListingsRecordList =
                              snapshot.data!;

                          return ListView.separated(
                            padding: EdgeInsets.zero,
                            primary: false,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: listViewListingsRecordList.length,
                            separatorBuilder: (_, __) => const SizedBox(height: 16.0),
                            itemBuilder: (context, listViewIndex) {
                              final listViewListingsRecord =
                                  listViewListingsRecordList[listViewIndex];
                              return InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'SAVED_LISTING_Container_njrz5jb5_ON_TAP');
                                  logFirebaseEvent('NewListing_navigate_to');

                                  context.pushNamed(
                                    'FullViewListing',
                                    queryParameters: {
                                      'listingRef': serializeParam(
                                        listViewListingsRecord.reference,
                                        ParamType.DocumentReference,
                                      ),
                                    }.withoutNulls,
                                  );
                                },
                                child: NewListingWidget(
                                  key: Key(
                                      'Keynjr_${listViewIndex}_of_${listViewListingsRecordList.length}'),
                                  price: listViewListingsRecord.rentEstimate,
                                  bathrooms: listViewListingsRecord.bathroom
                                      .toString(),
                                  bedrooms:
                                      listViewListingsRecord.bedroom.toString(),
                                  area: listViewListingsRecord.area.toString(),
                                  street: listViewListingsRecord.street,
                                  city: listViewListingsRecord.city,
                                  state: listViewListingsRecord.state,
                                  zipcode: listViewListingsRecord.zipcode,
                                  photo: listViewListingsRecord.imgUrl,
                                  savedBy: listViewListingsRecord.savedBy,
                                ),
                              );
                            },
                          );
                        },
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
