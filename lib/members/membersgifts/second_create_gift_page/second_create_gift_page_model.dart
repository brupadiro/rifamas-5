import '/backend/api_requests/api_calls.dart';
import '/components/calendar_component_widget.dart';
import '/components/secondaary_header_component_widget.dart';
import '/ff/ff_theme.dart';
import '/ff/ff_util.dart';
import '/ff/ff_widgets.dart';
import '/ff/upload_data.dart';
import 'second_create_gift_page_widget.dart' show SecondCreateGiftPageWidget;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SecondCreateGiftPageModel
    extends FFModel<SecondCreateGiftPageWidget> {
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
  // State field(s) for TextField widget.
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
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
