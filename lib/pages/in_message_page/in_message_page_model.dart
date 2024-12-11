import '/flutter_flow/flutter_flow_util.dart';
import 'in_message_page_widget.dart' show InMessagePageWidget;
import 'package:flutter/material.dart';

class InMessagePageModel extends FlutterFlowModel<InMessagePageWidget> {
  ///  Local state fields for this page.

  DocumentReference? chatId;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
