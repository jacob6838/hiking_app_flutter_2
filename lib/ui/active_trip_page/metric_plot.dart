import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hiking_app/models/plot_values.dart';

import '../../hiking_service.dart';
import '../../hiking_service_conversions.dart';

class MetricPlot extends StatefulWidget {
  const MetricPlot(
      {Key? key, required this.hikingService, required this.plotValues})
      : super(key: key);

  final HikingService hikingService;
  final PlotValues plotValues;

  @override
  MetricPlotState createState() => MetricPlotState();
}

class MetricPlotState extends State<MetricPlot> {
  @override
  Widget build(BuildContext context) {
    final plotValues = widget.plotValues;

    print(
        "x min: ${plotValues.xFormat.min}, max: ${plotValues.xFormat.max}, interval: ${plotValues.xFormat.interval}");
    print(
        "y min: ${plotValues.yFormat.min}, max: ${plotValues.yFormat.max}, interval: ${plotValues.yFormat.interval}");

    return SizedBox(
      width: plotValues.width,
      height: plotValues.height,
      child: LineChart(
        LineChartData(
          lineTouchData: LineTouchData(enabled: false),
          lineBarsData: [
            LineChartBarData(
              spots:
                  plotValues.values.map((it) => FlSpot(it[0], it[1])).toList(),
              // isCurved: true,
              barWidth: 3,
              color: Colors.purpleAccent,
              dotData: FlDotData(
                show: false,
              ),
            ),
          ],
          minX: plotValues.xFormat.min,
          maxX: plotValues.xFormat.max,
          minY: plotValues.yFormat.min,
          maxY: plotValues.yFormat.max,
          // // minY: 0,
          titlesData: FlTitlesData(
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 50,
                interval: plotValues.xFormat.interval,
                getTitlesWidget: (value, _) {
                  final int minutes = (value / secPerMin).round() % minPerHour;
                  final int hours = ((value / secPerMin) / minPerHour).floor();
                  return Text("$hours:$minutes");
                },
              ),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                interval: plotValues.yFormat.interval,
                reservedSize: 50,
              ),
            ),
            rightTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: false,
              ),
            ),
            topTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: false,
              ),
            ),
          ),
          // axisTitleData: FlAxisTitleData(
          //   bottomTitle:
          //       AxisTitle(showTitle: true, margin: 0, titleText: plotValues.xFormat.axisTitle, textAlign: TextAlign.right),
          //   leftTitle: AxisTitle(showTitle: true, titleText: plotValues.yFormat.axisTitle, margin: 4),
          // ),
          // gridData: FlGridData(
          //   show: true,
          //   checkToShowHorizontalLine: (double value) {
          //     return value == 1 || value == 6 || value == 4 || value == 5;
          //   },
          // ),
        ),
      ),
    );
  }
}
