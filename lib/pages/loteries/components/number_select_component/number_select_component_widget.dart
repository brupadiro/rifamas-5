import '/backend/api_requests/api_calls.dart';
import '/ff/ff_theme.dart';
import '/ff/ff_util.dart';
import '/ff/ff_widgets.dart';
import '/ff/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'number_select_component_model.dart';
export 'number_select_component_model.dart';

class NumberSelectComponentWidget extends StatefulWidget {
  const NumberSelectComponentWidget({
    Key? key,
    required this.idProduct,
    required this.numberTickets,
  }) : super(key: key);

  final int? idProduct;
  final String? numberTickets;

  @override
  _NumberSelectComponentWidgetState createState() =>
      _NumberSelectComponentWidgetState();
}

class _NumberSelectComponentWidgetState
    extends State<NumberSelectComponentWidget> {
  late NumberSelectComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NumberSelectComponentModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
      child: Container(
        width: MediaQuery.sizeOf(context).width * 0.85,
        height: 500.0,
        decoration: BoxDecoration(
          color: FFTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Elegir número(s) de papeleta(s)',
                      style: FFTheme.of(context).bodyMedium.override(
                            fontFamily: 'Montserrat',
                            color: FFTheme.of(context).primary,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w800,
                          ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.00, 0.00),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 0.85,
                    height: 250.0,
                    decoration: BoxDecoration(
                      color: FFTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    child: Align(
                      alignment: AlignmentDirectional(0.00, 0.00),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            10.0, 10.0, 10.0, 10.0),
                        child: Builder(
                          builder: (context) {
                            final papeletas = functions
                                .numberOfPapeletas(functions
                                    .numberOfPapeletas(widget.numberTickets!)
                                    .length
                                    .toString())
                                .toList();
                            return InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Numero seleccionado con exito!',
                                      style: TextStyle(
                                        color: FFTheme.of(context)
                                            .primaryText,
                                      ),
                                    ),
                                    duration: Duration(milliseconds: 4000),
                                    backgroundColor:
                                        FFTheme.of(context).secondary,
                                  ),
                                );
                              },
                              child: GridView.builder(
                                padding: EdgeInsets.zero,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 4,
                                  crossAxisSpacing: 10.0,
                                  mainAxisSpacing: 20.0,
                                  childAspectRatio: 1.0,
                                ),
                                scrollDirection: Axis.vertical,
                                itemCount: papeletas.length,
                                itemBuilder: (context, papeletasIndex) {
                                  final papeletasItem =
                                      papeletas[papeletasIndex];
                                  return Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      if (_model.lotteryNumbers
                                              .contains(papeletasIndex) ==
                                          true)
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            setState(() {
                                              _model.addToLotteryNumbers(
                                                  papeletasIndex);
                                            });
                                          },
                                          child: Container(
                                            width: 120.0,
                                            height: 50.0,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                fit: BoxFit.fitWidth,
                                                image: Image.asset(
                                                  'assets/images/LOGO-RIFAMAS-papeleta-small-VERDE.png',
                                                ).image,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  0.00, 0.00),
                                              child: Text(
                                                (papeletasIndex + 1).toString(),
                                                style:
                                                    FFTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          color: FFTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      if (_model.lotteryNumbers
                                              .contains(papeletasIndex) !=
                                          true)
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            setState(() {
                                              _model.addToLotteryNumbers(
                                                  papeletasIndex);
                                            });
                                          },
                                          child: Container(
                                            width: 120.0,
                                            height: 50.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FFTheme.of(context)
                                                      .secondaryBackground,
                                              image: DecorationImage(
                                                fit: BoxFit.fitWidth,
                                                image: Image.asset(
                                                  'assets/images/LOGO-RIFAMAS-papeleta-small.webp',
                                                ).image,
                                              ),
                                            ),
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  0.00, 0.00),
                                              child: Text(
                                                (papeletasIndex + 1).toString(),
                                                style:
                                                    FFTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          color: FFTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                              ),
                                            ),
                                          ),
                                        ),
                                    ],
                                  );
                                },
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              FFButtonWidget(
                onPressed: () async {
                  _model.apiResultywtCopy = await AddToCartCall.call(
                    productId: widget.idProduct,
                    userId: getJsonField(
                      FFAppState().jwtuser,
                      r'''$.ID''',
                    ),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Redirigiendo a la pasarela...',
                        style: TextStyle(
                          color:
                              FFTheme.of(context).secondaryBackground,
                        ),
                      ),
                      duration: Duration(milliseconds: 4000),
                      backgroundColor: FFTheme.of(context).primary,
                    ),
                  );
                  if ((_model.apiResultywtCopy?.succeeded ?? true)) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Ya participas de la rifa!',
                          style: TextStyle(
                            color: FFTheme.of(context).primaryText,
                          ),
                        ),
                        duration: Duration(milliseconds: 4000),
                        backgroundColor: FFTheme.of(context).secondary,
                      ),
                    );
                    Navigator.pop(context);
                    await launchURL(
                        'https://staging.rifamas.es/?user_id=${getJsonField(
                      FFAppState().jwtuser,
                      r'''$.ID''',
                    ).toString()}');
                  }

                  setState(() {});
                },
                text: 'SELECCIONAR NUMERO(S)',
                options: FFButtonOptions(
                  height: 50.0,
                  padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FFTheme.of(context).primary,
                  textStyle: FFTheme.of(context).titleSmall.override(
                        fontFamily: 'Montserrat',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                  elevation: 0.0,
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(25.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
