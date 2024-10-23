import '/flutter_flow/flutter_flow_util.dart';
import 'signin_page_widget.dart' show SigninPageWidget;
import 'package:flutter/material.dart';

class SigninPageModel extends FlutterFlowModel<SigninPageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for SignInEmail widget.
  FocusNode? signInEmailFocusNode;
  TextEditingController? signInEmailTextController;
  String? Function(BuildContext, String?)? signInEmailTextControllerValidator;
  // State field(s) for SignInPassword widget.
  FocusNode? signInPasswordFocusNode;
  TextEditingController? signInPasswordTextController;
  late bool signInPasswordVisibility;
  String? Function(BuildContext, String?)?
      signInPasswordTextControllerValidator;
  // State field(s) for SignUpEmail widget.
  FocusNode? signUpEmailFocusNode;
  TextEditingController? signUpEmailTextController;
  String? Function(BuildContext, String?)? signUpEmailTextControllerValidator;
  // State field(s) for SignUpPassword widget.
  FocusNode? signUpPasswordFocusNode;
  TextEditingController? signUpPasswordTextController;
  late bool signUpPasswordVisibility;
  String? Function(BuildContext, String?)?
      signUpPasswordTextControllerValidator;
  // State field(s) for SignUpConfirmPassword widget.
  FocusNode? signUpConfirmPasswordFocusNode;
  TextEditingController? signUpConfirmPasswordTextController;
  late bool signUpConfirmPasswordVisibility;
  String? Function(BuildContext, String?)?
      signUpConfirmPasswordTextControllerValidator;

  @override
  void initState(BuildContext context) {
    signInPasswordVisibility = false;
    signUpPasswordVisibility = false;
    signUpConfirmPasswordVisibility = false;
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    signInEmailFocusNode?.dispose();
    signInEmailTextController?.dispose();

    signInPasswordFocusNode?.dispose();
    signInPasswordTextController?.dispose();

    signUpEmailFocusNode?.dispose();
    signUpEmailTextController?.dispose();

    signUpPasswordFocusNode?.dispose();
    signUpPasswordTextController?.dispose();

    signUpConfirmPasswordFocusNode?.dispose();
    signUpConfirmPasswordTextController?.dispose();
  }
}
