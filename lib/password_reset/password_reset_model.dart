import '/flutter_flow/flutter_flow_util.dart';
import 'password_reset_widget.dart' show PasswordResetWidget;
import 'package:flutter/material.dart';

class PasswordResetModel extends FlutterFlowModel<PasswordResetWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for passswordResetTextField widget.
  FocusNode? passswordResetTextFieldFocusNode;
  TextEditingController? passswordResetTextFieldTextController;
  String? Function(BuildContext, String?)?
      passswordResetTextFieldTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    passswordResetTextFieldFocusNode?.dispose();
    passswordResetTextFieldTextController?.dispose();
  }
}
