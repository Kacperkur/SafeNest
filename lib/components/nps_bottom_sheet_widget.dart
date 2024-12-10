import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'nps_bottom_sheet_model.dart';
export 'nps_bottom_sheet_model.dart';

class NpsBottomSheetWidget extends StatefulWidget {
  const NpsBottomSheetWidget({super.key});

  @override
  State<NpsBottomSheetWidget> createState() => _NpsBottomSheetWidgetState();
}

class _NpsBottomSheetWidgetState extends State<NpsBottomSheetWidget> {
  late NpsBottomSheetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NpsBottomSheetModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 393.0,
      height: 300.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(68.0),
          topRight: Radius.circular(68.0),
        ),
        border: Border.all(
          color: FlutterFlowTheme.of(context).secondaryText,
          width: 2.0,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'How would you rate\nyour SafeNest experience?',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).headlineMedium.override(
                        fontFamily: 'Inter Tight',
                        letterSpacing: 0.0,
                      ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '1',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Inter',
                        fontSize: 28.0,
                        letterSpacing: 0.0,
                      ),
                ),
                SizedBox(
                  width: 250.0,
                  child: Slider(
                    activeColor: const Color(0xDF978DF9),
                    inactiveColor: FlutterFlowTheme.of(context).alternate,
                    min: 1.0,
                    max: 10.0,
                    value: _model.sliderValue ??= 7.0,
                    divisions: 9,
                    onChanged: (newValue) async {
                      newValue = double.parse(newValue.toStringAsFixed(2));
                      safeSetState(() => _model.sliderValue = newValue);
                      logFirebaseEvent(
                          'NPS_BOTTOM_SHEET_Slider_y8r572x8_ON_FORM');
                      logFirebaseEvent('Slider_update_component_state');
                      _model.npsValue = _model.sliderValue;
                      safeSetState(() {});
                    },
                  ),
                ),
                Text(
                  '10',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Inter',
                        fontSize: 28.0,
                        letterSpacing: 0.0,
                      ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  valueOrDefault<String>(
                    formatNumber(
                      _model.sliderValue,
                      formatType: FormatType.decimal,
                      decimalType: DecimalType.automatic,
                    ),
                    '10',
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Inter',
                        fontSize: 28.0,
                        letterSpacing: 0.0,
                      ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FFButtonWidget(
                  onPressed: () async {
                    logFirebaseEvent('NPS_BOTTOM_SHEET_COMP_SUBMIT_BTN_ON_TAP');
                    logFirebaseEvent('Button_backend_call');

                    await NPSResponsesRecord.collection
                        .doc()
                        .set(createNPSResponsesRecordData(
                          rating: _model.npsValue,
                        ));
                    logFirebaseEvent('Button_custom_action');
                    await actions.setShowNpsToFalse(
                      currentUserReference!,
                    );
                    logFirebaseEvent('Button_bottom_sheet');
                    Navigator.pop(context);
                  },
                  text: 'Submit',
                  options: FFButtonOptions(
                    width: 230.0,
                    height: 40.0,
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    iconPadding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: const Color(0x9857636C),
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Inter Tight',
                          color: FlutterFlowTheme.of(context).primaryText,
                          letterSpacing: 0.0,
                        ),
                    elevation: 0.0,
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).primaryText,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(68.0),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
