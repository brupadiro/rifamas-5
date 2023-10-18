import '/backend/api_requests/api_calls.dart';
import '/components/calendar_component_widget.dart';
import '/components/secondaary_header_component_widget.dart';
import '/ff/ff_theme.dart';
import '/ff/ff_util.dart';
import '/ff/ff_widgets.dart';
import '/ff/upload_data.dart';
import 'first_create_gitf_page_widget.dart' show FirstCreateGitfPageWidget;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FirstCreateGitfPageModel
    extends FFModel<FirstCreateGitfPageWidget> {
  ///  Local state fields for this page.

  String? nombreRegalo;

  String descripcionRegalo = '';

  String fechaSorteo = '';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // Model for secondaaryHeaderComponent component.
  late SecondaaryHeaderComponentModel secondaaryHeaderComponentModel;
  // State field(s) for TextField widget.
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  String? _textController1Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Requerido';
    }

    return null;
  }

  // State field(s) for TextField widget.
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  String? _textController2Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Requerido';
    }

    return null;
  }

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Backend Call - API (create gift)] action in Button widget.
  ApiCallResponse? apiResultsul;
  // Stores action output result for [Backend Call - API (create gift)] action in Button widget.
  ApiCallResponse? apiResultjow;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    secondaaryHeaderComponentModel =
        createModel(context, () => SecondaaryHeaderComponentModel());
    textController1Validator = _textController1Validator;
    textController2Validator = _textController2Validator;
  }

  void dispose() {
    unfocusNode.dispose();
    secondaaryHeaderComponentModel.dispose();
    textController1?.dispose();
    textController2?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
