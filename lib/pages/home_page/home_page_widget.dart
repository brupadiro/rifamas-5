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
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.apiResultln1 = await WalletGroup.getBalanceCall.call(
        idUser: getJsonField(
          FFAppState().jwtuser,
          r'''$.ID''',
        ).toString().toString(),
      );
      if ((_model.apiResultln1?.succeeded ?? true)) {
        setState(() {
          FFAppState().currentBalance = valueOrDefault<String>(
            (_model.apiResultln1?.jsonBody ?? '').toString(),
            '\$',
          );
        });
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FFTheme.of(context).secondaryBackground,
        body: SafeArea(
          top: true,
          child: Stack(
            alignment: AlignmentDirectional(0.0, 1.0),
            children: [
              Padding(
                padding:
                    EdgeInsetsDirectional.fromSTEB(10.0, 100.0, 10.0, 60.0),
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: MediaQuery.sizeOf(context).height * 1.0,
                  decoration: BoxDecoration(),
                  child: ListView(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 15.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Membresias de sorteos',
                                  style: FFTheme.of(context)
                                      .titleMedium
                                      .override(
                                        fontFamily: 'Montserrat',
                                        color: FFTheme.of(context)
                                            .primary,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pushNamed('membershipListPage');
                                  },
                                  child: Text(
                                    'Ver Todo >',
                                    style: FFTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          FutureBuilder<ApiCallResponse>(
                            future: GetSubscriptionsCall.call(),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 50.0,
                                    height: 50.0,
                                    child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        FFTheme.of(context).primary,
                                      ),
                                    ),
                                  ),
                                );
                              }
                              final rowGetSubscriptionsResponse =
                                  snapshot.data!;
                              return Builder(
                                builder: (context) {
                                  final subscriptions = getJsonField(
                                    rowGetSubscriptionsResponse.jsonBody,
                                    r'''$''',
                                  ).toList();
                                  return SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children:
                                          List.generate(subscriptions.length,
                                              (subscriptionsIndex) {
                                        final subscriptionsItem =
                                            subscriptions[subscriptionsIndex];
                                        return Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.2,
                                              height: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.2,
                                              decoration: BoxDecoration(
                                                color:
                                                    FFTheme.of(context)
                                                        .secondaryBackground,
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                  color: FFTheme.of(
                                                          context)
                                                      .primary,
                                                  width: 3.0,
                                                ),
                                              ),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  context.pushNamed(
                                                    'memberPage',
                                                    queryParameters: {
                                                      'idMembresy':
                                                          serializeParam(
                                                        getJsonField(
                                                          subscriptionsItem,
                                                          r'''$.id''',
                                                        ),
                                                        ParamType.int,
                                                      ),
                                                    }.withoutNulls,
                                                  );
                                                },
                                                child: Container(
                                                  width: 20.0,
                                                  height: 20.0,
                                                  clipBehavior: Clip.antiAlias,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: Image.network(
                                                    getJsonField(
                                                      subscriptionsItem,
                                                      r'''$.image''',
                                                    ),
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 10.0, 0.0, 0.0),
                                              child: Text(
                                                getJsonField(
                                                  subscriptionsItem,
                                                  r'''$.name''',
                                                ).toString(),
                                                style:
                                                    FFTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                              ),
                                            ),
                                          ],
                                        );
                                      }).divide(SizedBox(width: 5.0)),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 15.0, 0.0, 15.0),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          decoration: BoxDecoration(
                            color: Color(0x00FFFFFF),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 30.0, 0.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 15.0),
                                  child: Text(
                                    'Lo mas VIP para ti',
                                    style: FFTheme.of(context)
                                        .titleMedium
                                        .override(
                                          fontFamily: 'Montserrat',
                                          color: FFTheme.of(context)
                                              .primary,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ),
                                FutureBuilder<ApiCallResponse>(
                                  future: CategoriesCall.call(),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50.0,
                                          height: 50.0,
                                          child: CircularProgressIndicator(
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                              FFTheme.of(context)
                                                  .primary,
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    final rowCategoriesResponse =
                                        snapshot.data!;
                                    return Builder(
                                      builder: (context) {
                                        final categories = getJsonField(
                                          rowCategoriesResponse.jsonBody,
                                          r'''$''',
                                        ).toList();
                                        return SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children:
                                                List.generate(categories.length,
                                                    (categoriesIndex) {
                                              final categoriesItem =
                                                  categories[categoriesIndex];
                                              return FFButtonWidget(
                                                onPressed: () async {
                                                  setState(() {
                                                    _model.categorySelected =
                                                        getJsonField(
                                                      categoriesItem,
                                                      r'''$.id''',
                                                    ).toString();
                                                  });
                                                  await Future.delayed(
                                                      const Duration(
                                                          milliseconds: 1000));
                                                  setState(() => _model
                                                      .gridViewPagingController
                                                      ?.refresh());
                                                  await _model
                                                      .waitForOnePageForGridView();
                                                },
                                                text: getJsonField(
                                                  categoriesItem,
                                                  r'''$.name''',
                                                ).toString(),
                                                options: FFButtonOptions(
                                                  height: 48.0,
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          24.0, 0.0, 24.0, 0.0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: _model
                                                              .categorySelected ==
                                                          getJsonField(
                                                            categoriesItem,
                                                            r'''$.id''',
                                                          )
                                                      ? FFTheme.of(
                                                              context)
                                                          .primary
                                                      : FFTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                  textStyle:
                                                      FFTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .override(
                                                            fontFamily:
                                                                'Montserrat',
                                                            color: _model
                                                                        .categorySelected ==
                                                                    getJsonField(
                                                                      categoriesItem,
                                                                      r'''$.id''',
                                                                    )
                                                                ? FFTheme.of(
                                                                        context)
                                                                    .secondaryBackground
                                                                : FFTheme.of(
                                                                        context)
                                                                    .primary,
                                                            fontSize: 12.0,
                                                          ),
                                                  elevation: 0.0,
                                                  borderSide: BorderSide(
                                                    color: FFTheme.of(
                                                            context)
                                                        .primary,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          40.0),
                                                ),
                                              );
                                            }).divide(SizedBox(width: 4.0)),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.00, 0.00),
                        child: RefreshIndicator(
                          onRefresh: () async {
                            setState(() =>
                                _model.gridViewPagingController?.refresh());
                            await _model.waitForOnePageForGridView();
                          },
                          child: PagedGridView<ApiPagingParams, dynamic>(
                            pagingController: _model.setGridViewController(
                              (nextPageMarker) => GetProductsCall.call(
                                page: valueOrDefault<int>(
                                  valueOrDefault<int>(
                                        nextPageMarker.nextPageNumber,
                                        0,
                                      ) +
                                      1,
                                  1,
                                ),
                                perPage: 6,
                                type: 'lottery',
                                category: _model.categorySelected,
                              ),
                            ),
                            padding: EdgeInsets.zero,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 20.0,
                              mainAxisSpacing: 10.0,
                              childAspectRatio: 0.9,
                            ),
                            primary: false,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            builderDelegate: PagedChildBuilderDelegate<dynamic>(
                              // Customize what your widget looks like when it's loading the first page.
                              firstPageProgressIndicatorBuilder: (_) => Center(
                                child: SizedBox(
                                  width: 50.0,
                                  height: 50.0,
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      FFTheme.of(context).primary,
                                    ),
                                  ),
                                ),
                              ),
                              // Customize what your widget looks like when it's loading another page.
                              newPageProgressIndicatorBuilder: (_) => Center(
                                child: SizedBox(
                                  width: 50.0,
                                  height: 50.0,
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      FFTheme.of(context).primary,
                                    ),
                                  ),
                                ),
                              ),
                              noItemsFoundIndicatorBuilder: (_) => Center(
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  height: 100.0,
                                  child: NoResultComponentWidget(),
                                ),
                              ),
                              itemBuilder: (context, _, productsIndex) {
                                final productsItem = _model
                                    .gridViewPagingController!
                                    .itemList![productsIndex];
                                return InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pushNamed(
                                      'ProductDetail',
                                      queryParameters: {
                                        'idProduct': serializeParam(
                                          getJsonField(
                                            productsItem,
                                            r'''$.id''',
                                          ),
                                          ParamType.int,
                                        ),
                                      }.withoutNulls,
                                    );
                                  },
                                  child: wrapWithModel(
                                    model:
                                        _model.productCardWidgetModels.getModel(
                                      productsIndex.toString(),
                                      productsIndex,
                                    ),
                                    updateCallback: () => setState(() {}),
                                    child: ProductCardWidgetWidget(
                                      key: Key(
                                        'Keyg11_${productsIndex.toString()}',
                                      ),
                                      color: FFTheme.of(context)
                                          .secondaryBackground,
                                      title: getJsonField(
                                        productsItem,
                                        r'''$.name''',
                                      ).toString(),
                                      price: getJsonField(
                                        productsItem,
                                        r'''$.price''',
                                      ).toString(),
                                      image: valueOrDefault<String>(
                                        getJsonField(
                                          productsItem,
                                          r'''$.images[0].src''',
                                        ),
                                        'http://',
                                      ),
                                      participants: getJsonField(
                                        productsItem,
                                        r'''$.participants''',
                                      ),
                                      metadata: getJsonField(
                                        productsItem,
                                        r'''$.meta_data''',
                                      ),
                                      percentbar:
                                          random_data.randomDouble(0.0, 0.5),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.00, 1.00),
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: 100.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                  ),
                  child: wrapWithModel(
                    model: _model.bottomNavigationHomeComponentModel,
                    updateCallback: () => setState(() {}),
                    child: BottomNavigationHomeComponentWidget(
                      page: 'home',
                    ),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.00, -1.00),
                child: wrapWithModel(
                  model: _model.headerComponentModel,
                  updateCallback: () => setState(() {}),
                  child: HeaderComponentWidget(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
