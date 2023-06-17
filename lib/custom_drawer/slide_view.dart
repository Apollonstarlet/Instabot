import 'package:flutter/material.dart';

class SliderView extends StatefulWidget {
  const SliderView({Key? key, this.onChangedistValue, this.distValue, this.unit, this.max})
      : super(key: key);

  final Function(double)? onChangedistValue;
  final double? distValue;
  final String? unit;
  final double? max;

  @override
  _SliderViewState createState() => _SliderViewState();
}

class _SliderViewState extends State<SliderView> {
  double distValue = 0;
  double max = 100;
  @override
  void initState() {
    distValue = widget.distValue!;
    max = widget.max!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                flex: distValue.round(),
                child: const SizedBox(),
              ),
              Container(
                width: 170,
                child: widget.unit == "km" ? Text('Less than ${(distValue / 10).toStringAsFixed(1)}${(widget.unit)}', textAlign: TextAlign.center,
                ) : Text('Less than ${(widget.unit)}${(distValue).toStringAsFixed(1)}', textAlign: TextAlign.center,),
              ),
              Expanded(
                flex: 100 - distValue.round(),
                child: const SizedBox(),
              ),
            ],
          ),
          SliderTheme(
            data: SliderThemeData(
              thumbShape: CustomThumbShape(),
            ),
            child: Slider(
              onChanged: (double value) {
                setState(() {
                  distValue = value;
                });
                try {
                  widget.onChangedistValue!(distValue);
                } catch (_) {}
              },
              min: 0,
              max: max,
              activeColor: Theme.of(context).primaryColor,
              inactiveColor: Colors.grey.withOpacity(0.4),
              divisions: 100,
              value: distValue,
            ),
          ),
        ],
      ),
    );
  }
}

class CustomThumbShape extends SliderComponentShape {
  static const double _thumbSize = 3.0;
  static const double _disabledThumbSize = 3.0;

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return isEnabled
        ? const Size.fromRadius(_thumbSize)
        : const Size.fromRadius(_disabledThumbSize);
  }

  static final Animatable<double> sizeTween = Tween<double>(
    begin: _disabledThumbSize,
    end: _thumbSize,
  );

  @override
  void paint(
      PaintingContext context,
      Offset thumbCenter, {
        Animation<double>? activationAnimation,
        Animation<double>? enableAnimation,
        bool? isDiscrete,
        TextPainter? labelPainter,
        RenderBox? parentBox,
        Size? sizeWithOverflow,
        SliderThemeData? sliderTheme,
        TextDirection textDirection = TextDirection.ltr,
        double? textScaleFactor,
        double? value,
      }) {
    final Canvas canvas = context.canvas;
    final ColorTween colorTween = ColorTween(
      begin: sliderTheme?.disabledThumbColor,
      end: sliderTheme?.thumbColor,
    );
    canvas.drawPath(
        Path()
          ..addOval(Rect.fromPoints(
              Offset(thumbCenter.dx + 12, thumbCenter.dy + 12),
              Offset(thumbCenter.dx - 12, thumbCenter.dy - 12)))
          ..fillType = PathFillType.evenOdd,
        Paint()
          ..color = Colors.black.withOpacity(0.5)
          ..maskFilter =
          MaskFilter.blur(BlurStyle.normal, convertRadiusToSigma(8)));

    final Paint cPaint = Paint();
    cPaint..color = Colors.white;
    cPaint..strokeWidth = 14 / 2;
    canvas.drawCircle(Offset(thumbCenter.dx, thumbCenter.dy), 12, cPaint);
    cPaint..color = colorTween.evaluate(enableAnimation!)!;
    canvas.drawCircle(Offset(thumbCenter.dx, thumbCenter.dy), 10, cPaint);
  }

  double convertRadiusToSigma(double radius) {
    return radius * 0.57735 + 0.5;
  }
}
