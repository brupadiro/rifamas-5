import '/components/secondaary_header_component_widget.dart';
import '/ff/ff_theme.dart';
import '/ff/ff_util.dart';
import '/ff/ff_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'historial_user_page_model.dart';
export 'historial_user_page_model.dart';

class HistorialUserPageWidget extends StatefulWidget {
  const HistorialUserPageWidget({Key? key}) : super(key: key);

  @override
  _HistorialUserPageWidgetState createState() =>
      _HistorialUserPageWidgetState();
}

class _HistorialUserPageWidgetState extends State<HistorialUserPageWidget> {
  late HistorialUserPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HistorialUserPageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

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
          child: Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
            height: MediaQuery.sizeOf(context).height * 1.0,
            decoration: BoxDecoration(
              color: FFTheme.of(context).secondaryBackground,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                wrapWithModel(
                  model: _model.secondaaryHeaderComponentModel,
                  updateCallback: () => setState(() {}),
                  child: SecondaaryHeaderComponentWidget(
                    title: 'Historial',
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
                    child: GridView(
                      padding: EdgeInsets.zero,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10.0,
                        mainAxisSpacing: 10.0,
                        childAspectRatio: 1.0,
                      ),
                      scrollDirection: Axis.vertical,
                      children: [
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pushNamed('myProductsSelledListPage');
                          },
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 0.5,
                            height: 100.0,
                            decoration: BoxDecoration(
                              color: FFTheme.of(context).primary,
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 10.0, 10.0, 10.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FaIcon(
                                    FontAwesomeIcons.solidMoneyBillAlt,
                                    color: FFTheme.of(context)
                                        .secondaryBackground,
                                    size: 50.0,
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.00, 0.00),
                                    child: Text(
                                      'VENDIDOS',
                                      textAlign: TextAlign.center,
                                      style: FFTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Montserrat',
                                            color: FFTheme.of(context)
                                                .secondaryBackground,
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pushNamed('myProductsSelledListPage');
                          },
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 0.5,
                            height: 100.0,
                            decoration: BoxDecoration(
                              color: FFTheme.of(context).primary,
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 10.0, 10.0, 10.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.shopping_cart_checkout_rounded,
                                    color: FFTheme.of(context)
                                        .secondaryBackground,
                                    size: 50.0,
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.00, 0.00),
                                    child: Text(
                                      'VENTAS ACTIVAS',
                                      textAlign: TextAlign.center,
                                      style: FFTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Montserrat',
                                            color: FFTheme.of(context)
                                                .secondaryBackground,
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pushNamed('myProductsBuyedListPage');
                          },
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 0.5,
                            height: 100.0,
                            decoration: BoxDecoration(
                              color: FFTheme.of(context).primary,
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 10.0, 10.0, 10.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.add_shopping_cart,
                                    color: FFTheme.of(context)
                                        .secondaryBackground,
                                    size: 50.0,
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.00, 0.00),
                                    child: Text(
                                      'COMPRADOS',
                                      textAlign: TextAlign.center,
                                      style: FFTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Montserrat',
                                            color: FFTheme.of(context)
                                                .secondaryBackground,
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.sizeOf(context).width * 0.5,
                          height: 100.0,
                          decoration: BoxDecoration(
                            color: FFTheme.of(context).primary,
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 10.0, 10.0, 10.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.fact_check_sharp,
                                  color: FFTheme.of(context)
                                      .secondaryBackground,
                                  size: 50.0,
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.00, 0.00),
                                  child: Text(
                                    'RIFAS GANADAS',
                                    textAlign: TextAlign.center,
                                    style: FFTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Montserrat',
                                          color: FFTheme.of(context)
                                              .secondaryBackground,
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pushNamed('myLotteriesListPage');
                          },
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 0.5,
                            height: 100.0,
                            decoration: BoxDecoration(
                              color: FFTheme.of(context).primary,
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 10.0, 10.0, 10.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.post_add_sharp,
                                    color: FFTheme.of(context)
                                        .secondaryBackground,
                                    size: 50.0,
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.00, 0.00),
                                    child: Text(
                                      'RIFAS CREADAS',
                                      textAlign: TextAlign.center,
                                      style: FFTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Montserrat',
                                            color: FFTheme.of(context)
                                                .secondaryBackground,
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pushNamed('MyparticipedLoteriesPage');
                          },
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 0.5,
                            height: 100.0,
                            decoration: BoxDecoration(
                              color: FFTheme.of(context).primary,
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 10.0, 10.0, 10.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FaIcon(
                                    FontAwesomeIcons.play,
                                    color: FFTheme.of(context)
                                        .secondaryBackground,
                                    size: 50.0,
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.00, 0.00),
                                    child: Text(
                                      'RIFAS ACTIVAS',
                                      textAlign: TextAlign.center,
                                      style: FFTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Montserrat',
                                            color: FFTheme.of(context)
                                                .secondaryBackground,
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
