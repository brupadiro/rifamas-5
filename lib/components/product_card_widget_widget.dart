import '/ff/ff_theme.dart';
import '/ff/ff_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'product_card_widget_model.dart';
export 'product_card_widget_model.dart';

class ProductCardWidgetWidget extends StatefulWidget {
  const ProductCardWidgetWidget({
    Key? key,
    Color? color,
    this.title,
    this.price,
    required this.image,
    int? participants,
    required this.metadata,
    double? percentbar,
  })  : this.color = color ?? const Color(0xFFDEDEDE),
        this.participants = participants ?? 0,
        this.percentbar = percentbar ?? 0.0,
        super(key: key);

  final Color color;
  final String? title;
  final String? price;
  final String? image;
  final int participants;
  final dynamic metadata;
  final double percentbar;

  @override
  _ProductCardWidgetWidgetState createState() =>
      _ProductCardWidgetWidgetState();
}

class _ProductCardWidgetWidgetState extends State<ProductCardWidgetWidget> {
  late ProductCardWidgetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProductCardWidgetModel());

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

    return Container(
      width: MediaQuery.sizeOf(context).width * 1.0,
      height: 240.0,
      decoration: BoxDecoration(
        color: widget.color,
        borderRadius: BorderRadius.circular(15.0),
        shape: BoxShape.rectangle,
        border: Border.all(
          color: FFTheme.of(context).alternate,
          width: 2.0,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
            child: Container(
              width: 100.0,
              height: 100.0,
              decoration: BoxDecoration(
                color: FFTheme.of(context).secondaryBackground,
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  valueOrDefault<String>(
                    widget.image,
                    'https://t3.ftcdn.net/jpg/02/48/42/64/360_F_248426448_NVKLywWqArG2ADUxDq6QprtIzsF82dMF.jpg',
                  ),
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: 250.0,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Expanded(
            child: Text(
              widget.title!,
              textAlign: TextAlign.center,
              style: FFTheme.of(context).bodyMedium.override(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(0.0),
                  child: Image.asset(
                    'assets/images/misrifsa-negro.png',
                    width: 25.0,
                    height: 25.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Text(
                '€ ${widget.price}',
                style: FFTheme.of(context).bodyMedium.override(
                      fontFamily: 'Montserrat',
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
          Expanded(
            child: Align(
              alignment: AlignmentDirectional(0.00, 1.00),
              child: Container(
                width: MediaQuery.sizeOf(context).width * 1.0,
                height: 20.0,
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.sizeOf(context).width * 1.0,
                ),
                decoration: BoxDecoration(),
                child: Align(
                  alignment: AlignmentDirectional(0.00, 0.00),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 2.0, 0.0),
                    child: LinearPercentIndicator(
                      percent: widget.percentbar,
                      width: MediaQuery.sizeOf(context).width * 0.45,
                      lineHeight: 20.0,
                      animation: true,
                      animateFromLastPercent: true,
                      progressColor: Color(0xFF00FF2E),
                      backgroundColor: FFTheme.of(context).accent4,
                      center: Text(
                        formatNumber(
                          widget.percentbar,
                          formatType: FormatType.percent,
                        ),
                        style:
                            FFTheme.of(context).headlineSmall.override(
                                  fontFamily: 'Montserrat',
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                      barRadius: Radius.circular(25.0),
                      padding: EdgeInsets.zero,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
