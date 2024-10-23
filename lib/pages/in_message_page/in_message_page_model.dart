import '/flutter_flow/flutter_flow_util.dart';
import 'in_message_page_widget.dart' show InMessagePageWidget;
import 'package:flutter/material.dart';

class InMessagePageModel extends FlutterFlowModel<InMessagePageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TypeMessageHere widget.
  FocusNode? typeMessageHereFocusNode;
  TextEditingController? typeMessageHereTextController;
  String? Function(BuildContext, String?)?
      typeMessageHereTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    typeMessageHereFocusNode?.dispose();
    typeMessageHereTextController?.dispose();
  }
}
