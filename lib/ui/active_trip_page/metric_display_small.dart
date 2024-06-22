import 'package:flutter/material.dart';
import 'package:hiking_app/hiking_service_conversions.dart';
import 'package:hiking_app/models/hike_metrics.dart';
import 'package:hiking_app/models/plot_values.dart';
import 'package:hiking_app/models/units.dart';
import 'package:hiking_app/ui/active_trip_page/metric_plot.dart';

class MetricDisplaySmall extends StatefulWidget {
  final HikeMetrics? hikeMetrics;
  final PlotValues? elevationPlot;
  final PlotValues? speedPlot;

  const MetricDisplaySmall(
      {super.key,
      required this.hikeMetrics,
      this.elevationPlot,
      this.speedPlot});

  @override
  State<MetricDisplaySmall> createState() => _MetricDisplaySmallState();
}

class _MetricDisplaySmallState extends State<MetricDisplaySmall> {
  final MainUnits unit = MainUnits.imperial;
  final List<String> _dataTypes = ['Elev.', 'Speed', 'Dist.'];
  String _selectedDataType = 'Elev.'; // Default selection

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: Row(
            children: [
              PowerMetric(
                  value: getDurationString(
                      widget.hikeMetrics?.metricPeriodSeconds ?? 0),
                  subtitle: 'Time'),
              PowerMetric(
                  value: getDistanceString(
                      widget.hikeMetrics?.distanceTraveled ?? 0.0),
                  unit: unit.distanceUnitShort,
                  subtitle: 'Distance'),
              PowerMetric(
                  value: getElevationString(
                      widget.hikeMetrics?.cumulativeClimbMeters ?? 0),
                  unit: unit.elevationUnitShort,
                  subtitle: 'Elev. Gain'),
            ],
          ),
        ),
        Row(
          children: [
            PowerMetric(
                value: getElevationString(widget.hikeMetrics?.altitude ?? 0),
                unit: unit.elevationUnitShort,
                subtitle: 'Elev.'),
            PowerMetric(
                value: getSpeedString(
                    widget.hikeMetrics?.averageSpeedMetersPerSec ?? 0),
                unit: unit.speedUnitShort,
                subtitle: 'Speed'),
            PowerMetric(
                value: getPaceString(
                    widget.hikeMetrics?.averageSpeedMetersPerSec ?? 0),
                unit: unit.distanceUnitShort,
                subtitle: 'Pace'),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 25, bottom: 0),
          child: Center(
            child: widget.elevationPlot == null
                ? null
                : MetricPlot(
                    plotValues: widget.elevationPlot!
                        .copyWith(height: 200, width: screenWidth * 0.9),
                  ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: Wrap(
            spacing: 8.0, // Gap between chips
            children: _dataTypes.map((String type) {
              bool isSelected = _selectedDataType == type;
              return RawChip(
                label: Text(
                  type,
                  style: TextStyle(
                    color: isSelected
                        ? Colors.white
                        : Colors
                            .white, // Text color remains white for visibility
                  ),
                ),
                selected: isSelected,
                onSelected: (bool selected) {
                  setState(() {
                    _selectedDataType = type;
                    // Update your plot data here based on the selected type
                  });
                },
                showCheckmark: false, // Do not show check mark
                selectedColor: Colors.blue, // Selected color for visibility
                backgroundColor: Colors
                    .transparent, // Ensure background is transparent for all chips
                // color: Colors.transparent,
                shape: isSelected
                    ? StadiumBorder()
                    : StadiumBorder(
                        side: BorderSide
                            .none), // Remove border for unselected chips
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  String getDurationString(double durationSeconds) {
    int hours = durationSeconds ~/ 3600;
    int minutes = (durationSeconds % 3600) ~/ 60;
    return "${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}";
  }

  String getTripDate(int startTimeSeconds) {
    DateTime date =
        DateTime.fromMillisecondsSinceEpoch(startTimeSeconds * 1000);
    // add time of day, like 10:23am
    String timeOfDay =
        "${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}${date.hour < 12 ? 'am' : 'pm'}";
    return "${date.month.toString().padLeft(2, '0')}/${date.day.toString().padLeft(2, '0')}/${date.year} $timeOfDay";
  }

  String getDistanceString(double distanceMeters) {
    switch (unit) {
      case MainUnits.imperial:
        return "${(metersToMiles(distanceMeters)).toStringAsFixed(2)}";
      case MainUnits.metric:
        return "${(distanceMeters ~/ 1000.0).toStringAsFixed(2)}";
    }
  }

  String getElevationString(double elevationMeters) {
    switch (unit) {
      case MainUnits.imperial:
        return "${(metersToFeet(elevationMeters)).toStringAsFixed(0)}";
      case MainUnits.metric:
        return "${(elevationMeters).toStringAsFixed(0)}";
    }
  }

  String getSpeedString(double speedMetersPerSec) {
    switch (unit) {
      case MainUnits.imperial:
        return "${(metersPerSecToMilesPerHour(speedMetersPerSec)).toStringAsFixed(1)}";
      case MainUnits.metric:
        return "${speedMetersPerSec.toStringAsFixed(1)}";
    }
  }

  String getPaceString(double speedMetersPerSec) {
    switch (unit) {
      case MainUnits.imperial:
        return "${(getDurationString(metersPerSecToMinutesPerMile(speedMetersPerSec)))}";
      case MainUnits.metric:
        return "${(getDurationString(metersPerSecToMinutesPerKm(speedMetersPerSec)))}";
    }
  }
}

class PowerMetric extends StatelessWidget {
  final String value;
  final String unit;
  final String subtitle;
  const PowerMetric(
      {super.key, required this.value, this.unit = "", this.subtitle = ""});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: value,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(
                        221, 221, 221, 1), // Specify the color for consistency
                  ),
                ),
                TextSpan(
                  text: unit,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Color.fromRGBO(221, 221, 221, 1),
                  ),
                ),
              ],
            ),
          ),
          Text(
            subtitle,
            style: const TextStyle(
              fontSize: 16,
              color: Color.fromRGBO(151, 151, 151, 1),
            ),
          ),
        ],
      ),
    );
  }
}
