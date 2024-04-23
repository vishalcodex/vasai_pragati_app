import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../../../../common/color_pallete.dart';
import '../../../components/ui/rounded_container.dart';

class SliderViewWidget extends StatefulWidget {
  final SfRangeValues range;
  final String? metric;
  final double? value;
  final double? step;
  final Function(double value) onChanged;
  const SliderViewWidget(
      {super.key,
      required this.range,
      required this.onChanged,
      this.metric,
      this.step,
      required this.value});

  @override
  State<SliderViewWidget> createState() => _SliderViewWidgetState();
}

class _SliderViewWidgetState extends State<SliderViewWidget> {
  double start = 0;
  double end = 0;
  double min = 0;
  double max = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    min = widget.range.start;
    max = widget.range.end;
    start = min;
    end = widget.value!;
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    // double ffem = fem * 0.97;
    return RoundedContainer(
      radius: 0,
      child: Padding(
        padding: EdgeInsets.only(top: 0.0 * fem),
        child:

            // RangeSlider(
            //   min: 0,
            //   max: 50,
            //   values: RangeValues(start, end),
            //   labels: RangeLabels(start.toString(), end.toString()),
            //   onChanged: (value) {
            //     setState(() {
            //       start = value.start;
            //       end = value.end;
            //     });
            //   },
            // )

            SfSlider(
          min: min,
          max: max,
          // shouldAlwaysShowTooltip: true,
          // enableTooltip: true,
          // tooltipShape: SfRectangularTooltipShape(),

          // tooltipTextFormatterCallback: (actualValue, formattedText) {
          //   return "${widget.metric == "₹" ? "${widget.metric} " : ""}$formattedText${widget.metric == "km" ? " ${widget.metric}" : ""}";
          // },
          activeColor: ColorPallete.primary,
          showDividers: true,
          showTicks: true,
          showLabels: true,
          interval: widget.step ?? 1,
          stepSize: 0.5,
          labelFormatterCallback: (actualValue, formattedText) {
            return formattedText.toString() + widget.metric!;
          },
          // labels: RangeLabels(start.toString(), end.toString()),
          // values: SfRangeValues(start, end),
          value: end,
          onChanged: (value) {
            widget.onChanged(value);
            setState(() {
              // start = value.start;
              end = value;
            });
          },
        ),
      ),
    );
  }
}
