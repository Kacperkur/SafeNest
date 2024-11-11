import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'amenity_box_model.dart';
export 'amenity_box_model.dart';

class AmenityBoxWidget extends StatefulWidget {
  const AmenityBoxWidget({
    super.key,
    String? amenity,
  }) : amenity = amenity ?? 'feature';

  final String amenity;

  @override
  State<AmenityBoxWidget> createState() => _AmenityBoxWidgetState();
}

class _AmenityBoxWidgetState extends State<AmenityBoxWidget> {
  late AmenityBoxModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AmenityBoxModel());

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
      alignment: const AlignmentDirectional(0.0, 0.0),
      child: Container(
        height: 50.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          boxShadow: [
            BoxShadow(
              blurRadius: 4.0,
              color: FlutterFlowTheme.of(context).primary,
              offset: const Offset(
                0.0,
                2.0,
              ),
            )
          ],
          borderRadius: BorderRadius.circular(12.0),
          shape: BoxShape.rectangle,
        ),
        alignment: const AlignmentDirectional(0.0, 0.0),
        child: Text(
          widget.amenity,
          textAlign: TextAlign.center,
          style: FlutterFlowTheme.of(context).titleSmall.override(
                fontFamily: 'Inter Tight',
                letterSpacing: 0.0,
              ),
        ),
      ),
    );
  }
}
