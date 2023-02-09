import 'package:flutter/material.dart';
import 'package:hiking_app/models/plot_values.dart';
import 'package:hiking_app/ui/active_trip_page/status_button.dart';
import 'package:hiking_app/ui/trip_summary_page/main.dart';
import 'package:provider/provider.dart';

import '../../hiking_service.dart';
import '../../main.dart';
import '../../models/trip_status.dart';
import 'metric_plot.dart';
import 'metrics_table.dart';

class ActiveTripPage extends StatefulWidget {
  const ActiveTripPage({Key? key}) : super(key: key);

  @override
  ActiveTripPageState createState() => ActiveTripPageState();
}

class ActiveTripPageState extends State<ActiveTripPage> {
  HikingService? _hikingService;
  bool isDropdownEnabled = true;

  @override
  Widget build(BuildContext context) {
    _hikingService = Provider.of<HikingService>(context);
    const dateTextStyle = TextStyle(
        fontSize: 10, color: Colors.purple, fontWeight: FontWeight.bold);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Hello, Hiker!'),
      ),
      body: ListView(
        // shrinkWrap: true,
        children: <Widget>[
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                MetricsTable(
                    hikingService: _hikingService!,
                    metricsHiddenMap: List.filled(22, true)),
                Row(children: <Widget>[
                  StreamBuilder<PlotValues>(
                      stream: _hikingService!.elevationPlot,
                      builder: (context, snapshot) {
                        final plotValues = snapshot.data ?? PlotValues();
                        return MetricPlot(
                            hikingService: _hikingService!,
                            plotValues: plotValues);
                      }),
                  StreamBuilder<PlotValues>(
                      stream: _hikingService!.speedPlot,
                      builder: (context, snapshot) {
                        final plotValues = snapshot.data ?? PlotValues();
                        return MetricPlot(
                            hikingService: _hikingService!,
                            plotValues: plotValues);
                      }),
                ]),
                StreamBuilder<TripStatus>(
                    stream: _hikingService!.currentHikerStatus$,
                    builder: (context, AsyncSnapshot<TripStatus> snapshot) {
                      final TripStatus activeStatus =
                          snapshot.data ?? TripStatus.stopped;
                      sendCommand(command) =>
                          onEnableBtnClicked(context, _hikingService!, command);

                      return StatusButtons(activeStatus, sendCommand);
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<String?> onEnableBtnClicked(BuildContext context,
      HikingService _hikingService, TripStatusCommand command) async {
    return _hikingService.updateStatus(context, _hikingService, command);
  }
}
