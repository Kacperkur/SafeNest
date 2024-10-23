import '/components/message_display_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'message_base_page_widget.dart' show MessageBasePageWidget;
import 'package:flutter/material.dart';

class MessageBasePageModel extends FlutterFlowModel<MessageBasePageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for MessageDisplay component.
  late MessageDisplayModel messageDisplayModel;

  @override
  void initState(BuildContext context) {
    messageDisplayModel = createModel(context, () => MessageDisplayModel());
  }

  @override
  void dispose() {
    messageDisplayModel.dispose();
  }
}
