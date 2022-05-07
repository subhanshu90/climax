import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:skeletons/skeletons.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:app/helpers/hourlyweather.dart';

import '../constants/skeletonview.dart';
import '../helpers/getlocdata.dart';
import '../helpers/weatherdata.dart';

Future gethour() async {
  return gethourlydata();
}

class graph extends StatefulWidget {
  const graph({Key? key}) : super(key: key);

  @override
  State<graph> createState() => _graphState();
}

class _graphState extends State<graph> {
  @override
  Widget build(BuildContext context) {
    LinearGradient gaygradient = LinearGradient(colors: [
      Theme.of(context).colorScheme.primary,
      Theme.of(context).colorScheme.secondary,
      Theme.of(context).colorScheme.tertiary
    ]);
    return FutureBuilder(
        future: gethour(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Skeleton(
                isLoading: true, skeleton: const haddi(), child: Column());
          }
          if (snapshot.connectionState == ConnectionState.none) {
            return Container(
              child: Image.asset("images/nointernet.jpg"),
            );
          }
          if (!snapshot.hasData) {
            return Text("no data");
          }
          return Card(
            elevation: 10,
            color: Theme.of(context).colorScheme.secondaryContainer,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            child: SfCartesianChart(
              tooltipBehavior: TooltipBehavior(enable: true, header: 'Temp'),
              plotAreaBorderWidth: 1,
              zoomPanBehavior:
                  ZoomPanBehavior(enablePanning: true, zoomMode: ZoomMode.x),
              primaryXAxis: DateTimeAxis(
                intervalType: DateTimeIntervalType.hours,
                visibleMinimum: hourlydata[hourlydata.length - 8].time,
                visibleMaximum: hourlydata[hourlydata.length - 1].time,
                dateFormat: DateFormat.j(),
                isVisible: true,
                majorGridLines: const MajorGridLines(width: 0),
              ),
              primaryYAxis: NumericAxis(
                  isVisible: true,
                  majorGridLines: const MajorGridLines(width: 0),
                  axisLine: const AxisLine(width: 0),
                  edgeLabelPlacement: EdgeLabelPlacement.shift,
                  labelFormat: '{value}°C',
                  majorTickLines: const MajorTickLines(size: 0)),
              series: [
                AreaSeries(
                    // splineType: SplineType.clamped,
                    gradient: gaygradient,
                    dataSource: hourlydata,
                    markerSettings: const MarkerSettings(isVisible: true),
                    xValueMapper: (HourlyWeather kek, _) => kek.time,
                    yValueMapper: (HourlyWeather kek, _) => kek.temp),
              ],
            ),
          );
        });
  }
}
