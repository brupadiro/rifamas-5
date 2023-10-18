import '/backend/api_requests/api_calls.dart';
import '/components/secondaary_header_component_widget.dart';
import '/ff/ff_theme.dart';
import '/ff/ff_util.dart';
import '/ff/ff_widgets.dart';
import 'third_create_page_widget.dart' show ThirdCreatePageWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ThirdCreatePageModel extends FFModel<ThirdCreatePageWidget> {
  ///  Local state fields for this page.

  int? variacion1 = 0;

  int? papeletasvariacion1 = 0;

  int? variacion2 = 0;

  int? papeletavariacion2 = 0;

  int? variacion3 = 0;

  int? papeletasvariacion3 = 0;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey2 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  final formKey3 = GlobalKey<FormState>();
  // Model for secondaaryHeaderComponent component.
  late SecondaaryHeaderComponentModel secondaaryHeaderComponentModel;
  // State field(s) for TextField widget.
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for TextField widget.
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  // State field(s) for TextField widget.
  TextEditingController? textController4;
  String? Function(BuildContext, String?)? textController4Validator;
  // State field(s) for TextField widget.
  TextEditingController? textController5;
  String? Function(BuildContext, String?)? textController5Validator;
  // State field(s) for TextField widget.
  TextEditingController? textController6;
  String? Function(BuildContext, String?)? textController6Validator;
  // Stores action output result for [Backend Call - API (create)] action in Button widget.
  ApiCallResponse? apiResultcy2;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    secondaaryHeaderComponentModel =
        createModel(context, () => SecondaaryHeaderComponentModel());
  }

  void dispose() {
    unfocusNode.dispose();
    secondaaryHeaderComponentModel.dispose();
    textController1?.dispose();
    textController2?.dispose();
    textController3?.dispose();
    textController4?.dispose();
    textController5?.dispose();
    textController6?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
