import 'package:flutter/material.dart';
import 'package:hiking_app/models/hike_metrics.dart';
import 'package:kt_dart/collection.dart';

import '../../hiking_service_conversions.dart';
import '../../models/units.dart';

class MetricsUnitTable extends StatefulWidget {
  const MetricsUnitTable(this.savedUnits, {Key? key}) : super(key: key);

  final KtMap<String, Unit> savedUnits;

  @override
  _MetricsUnitTableState createState() => _MetricsUnitTableState();
}

class _MetricsUnitTableState extends State<MetricsUnitTable> {
  HikeMetricsData hikeMetrics = const HikeMetricsData();
  HikingServiceConversions hikeMetricsConversions = HikingServiceConversions();

  @override
  Widget build(BuildContext context) {
    const dataRowFontSize = 25.0;
    const dataRowHeightPadding = 25;
    // return Container();
    return DataTable(
        dataRowHeight: dataRowFontSize + dataRowHeightPadding,
        headingRowHeight: (dataRowFontSize + dataRowHeightPadding) * 1.2,
        dataTextStyle: const TextStyle(
          fontSize: dataRowFontSize,
          color: Colors.black,
          // height: 1
        ),
        headingTextStyle: const TextStyle(
          fontSize: dataRowFontSize,
          color: Colors.black,
          fontWeight: FontWeight.bold,
          // height: 1
        ),
        columns: const <DataColumn>[
          DataColumn(label: Text("Metric")),
          DataColumn(label: Text("Units"))
        ],
        rows: getDataRows(
            hikeMetricsConversions.metricsToData(const HikeMetrics())));
  }

  List<DataRow> getDataRows(HikeMetricsData? hikeMetrics) {
    if (hikeMetrics == null) return <DataRow>[];
    final vals = List<int>.generate(22, (i) => i + 1);
    final rows = <DataRow>[];
    for (int i in vals) {
      final metric = getHikeMetricsValue(i, hikeMetrics);
      if (metric == null ||
          !metric.visible ||
          metric.unitType == UnitType.unspecified) {
        continue;
      }
      rows.add(DataRow(cells: <DataCell>[
        DataCell(Text(metric.name)),
        DataCell(UnitDropdown(
            widget.savedUnits.getOrDefault(metric.name, UnspecifiedUnits.unit),
            metric.unitType,
            metric.unitType.listUnits()))
      ]));
    }
    return rows;
  }

  Metric? getHikeMetricsValue(int index, HikeMetricsData hikeMetrics) {
    switch (index) {
      case 15:
        return hikeMetrics.timeStartSec;
      case 16:
        return hikeMetrics.latitudeStart;
      case 17:
        return hikeMetrics.longitudeStart;
      case 18:
        return hikeMetrics.altitudeStart;
      case 1:
        return hikeMetrics.latitude;
      case 2:
        return hikeMetrics.longitude;
      case 0:
        return hikeMetrics.altitude;
      case 3:
        return hikeMetrics.speedMetersPerSec;
      case 19:
        return hikeMetrics.headingDegrees;
      case 4:
        return hikeMetrics.locationAccuracy;
      case 20:
        return hikeMetrics.speedAccuracy;
      case 11:
        return hikeMetrics.altitudeMax;
      case 10:
        return hikeMetrics.altitudeMin;
      case 13:
        return hikeMetrics.speedMax;
      case 21:
        return hikeMetrics.speedMin;
      case 12:
        return hikeMetrics.averageSpeedMetersPerSec;
      case 14:
        return hikeMetrics.netHeadingDegrees;
      case 6:
        return hikeMetrics.distanceTraveled;
      case 7:
        return hikeMetrics.netElevationChange;
      case 8:
        return hikeMetrics.cumulativeClimbMeters;
      case 9:
        return hikeMetrics.cumulativeDescentMeters;
      case 5:
        return hikeMetrics.metricPeriodSeconds;
    }
    return null;
  }
}

class UnitDropdown extends StatefulWidget {
  const UnitDropdown(this.initialValue, this.unitType, this.values,
      {super.key});

  final Unit initialValue;
  final UnitType unitType;
  final List<Unit> values;

  @override
  State<UnitDropdown> createState() => _UnitDropdownState();
}

class _UnitDropdownState extends State<UnitDropdown> {
  Unit? selectedUnit;

  @override
  void initState() {
    super.initState();

    selectedUnit = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<Unit>(
      items:
          widget.unitType.listUnits().map<DropdownMenuItem<Unit>>((Unit value) {
        return DropdownMenuItem<Unit>(
          value: value,
          child: Text(value.name),
        );
      }).toList(),
      value: selectedUnit,
      onChanged: (unit) {
        setState(() {
          selectedUnit = unit;
        });
      },
    );
  }
}
