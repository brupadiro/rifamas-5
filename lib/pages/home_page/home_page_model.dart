import '/backend/api_requests/api_calls.dart';
import '/components/header_component_widget.dart';
import '/components/no_result_component_widget.dart';
import '/components/product_card_widget_widget.dart';
import '/ff/ff_theme.dart';
import '/ff/ff_util.dart';
import '/ff/ff_widgets.dart';
import '/pages/bottomnavigations/bottom_navigation_home_component/bottom_navigation_home_component_widget.dart';
import '/ff/random_data_util.dart' as random_data;
import 'dart:async';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';

class HomePageModel extends FFModel<HomePageWidget> {
  ///  Local state fields for this page.

  String? categorySelected = '29';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (get balance)] action in HomePage widget.
  ApiCallResponse? apiResultln1;
  // State field(s) for GridView widget.

  PagingController<ApiPagingParams, dynamic>? gridViewPagingController;
  Function(ApiPagingParams nextPageMarker)? gridViewApiCall;

  // Models for productCardWidget dynamic component.
  late FFDynamicModels<ProductCardWidgetModel> productCardWidgetModels;
  // Model for bottomNavigationHomeComponent component.
  late BottomNavigationHomeComponentModel bottomNavigationHomeComponentModel;
  // Model for headerComponent component.
  late HeaderComponentModel headerComponentModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    productCardWidgetModels =
        FFDynamicModels(() => ProductCardWidgetModel());
    bottomNavigationHomeComponentModel =
        createModel(context, () => BottomNavigationHomeComponentModel());
    headerComponentModel = createModel(context, () => HeaderComponentModel());
  }

  void dispose() {
    unfocusNode.dispose();
    gridViewPagingController?.dispose();
    productCardWidgetModels.dispose();
    bottomNavigationHomeComponentModel.dispose();
    headerComponentModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  Future waitForOnePageForGridView({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete =
          (gridViewPagingController?.nextPageKey?.nextPageNumber ?? 0) > 0;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  PagingController<ApiPagingParams, dynamic> setGridViewController(
    Function(ApiPagingParams) apiCall,
  ) {
    gridViewApiCall = apiCall;
    return gridViewPagingController ??= _createGridViewController(apiCall);
  }

  PagingController<ApiPagingParams, dynamic> _createGridViewController(
    Function(ApiPagingParams) query,
  ) {
    final controller = PagingController<ApiPagingParams, dynamic>(
      firstPageKey: ApiPagingParams(
        nextPageNumber: 0,
        numItems: 0,
        lastResponse: null,
      ),
    );
    return controller..addPageRequestListener(gridViewGetProductsPage);
  }

  void gridViewGetProductsPage(ApiPagingParams nextPageMarker) =>
      gridViewApiCall!(nextPageMarker).then((gridViewGetProductsResponse) {
        final pageItems = (getJsonField(
                  gridViewGetProductsResponse.jsonBody,
                  r'''$''',
                ) ??
                [])
            .toList() as List;
        final newNumItems = nextPageMarker.numItems + pageItems.length;
        gridViewPagingController?.appendPage(
          pageItems,
          (pageItems.length > 0)
              ? ApiPagingParams(
                  nextPageNumber: nextPageMarker.nextPageNumber + 1,
                  numItems: newNumItems,
                  lastResponse: gridViewGetProductsResponse,
                )
              : null,
        );
      });
}
