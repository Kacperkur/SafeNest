import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'save_button_model.dart';
export 'save_button_model.dart';

class SaveButtonWidget extends StatefulWidget {
  const SaveButtonWidget({super.key});

  @override
  State<SaveButtonWidget> createState() => _SaveButtonWidgetState();
}

class _SaveButtonWidgetState extends State<SaveButtonWidget> {
  late SaveButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SaveButtonModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(1.0, -1.0),
      child: StreamBuilder<List<ListingsRecord>>(
        stream: queryListingsRecord(
          queryBuilder: (listingsRecord) => listingsRecord.where(
            'saved_by',
            arrayContains: currentUserReference,
          ),
          singleRecord: true,
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
          List<ListingsRecord> toggleIconListingsRecordList = snapshot.data!;
          // Return an empty Container when the item does not exist.
          if (snapshot.data!.isEmpty) {
            return Container();
          }
          final toggleIconListingsRecord =
              toggleIconListingsRecordList.isNotEmpty
                  ? toggleIconListingsRecordList.first
                  : null;

          return ToggleIcon(
            onPressed: () async {
              safeSetState(() => _model.isSaved = !_model.isSaved);
              logFirebaseEvent('SAVE_BUTTON_ToggleIcon_j8fftk9z_ON_TOGGL');
              if (_model.isSaved == true) {
                logFirebaseEvent('ToggleIcon_backend_call');

                await toggleIconListingsRecord!.reference.update({
                  ...mapToFirestore(
                    {
                      'saved_by':
                          FieldValue.arrayRemove([currentUserReference]),
                    },
                  ),
                });
                logFirebaseEvent('ToggleIcon_update_component_state');
                _model.isSaved = false;
                safeSetState(() {});
              } else {
                logFirebaseEvent('ToggleIcon_backend_call');

                await toggleIconListingsRecord!.reference.update({
                  ...mapToFirestore(
                    {
                      'saved_by': FieldValue.arrayUnion([currentUserReference]),
                    },
                  ),
                });
                logFirebaseEvent('ToggleIcon_update_component_state');
                _model.isSaved = true;
                safeSetState(() {});
              }
            },
            value: _model.isSaved,
            onIcon: Icon(
              Icons.favorite,
              color: FlutterFlowTheme.of(context).primary,
              size: 24.0,
            ),
            offIcon: Icon(
              Icons.favorite_border,
              color: FlutterFlowTheme.of(context).primaryBackground,
              size: 24.0,
            ),
          );
        },
      ),
    );
  }
}
