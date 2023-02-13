import 'package:flutter/material.dart';
import 'package:hiking_app/models/plot_values.dart';
import 'package:hiking_app/ui/active_trip_page/status_button.dart';
import 'package:hiking_app/ui/trip_summary_page/main.dart';
import 'package:intl/intl.dart';
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
  String tripName = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tripName = DateFormat('yyyy-MM-dd_kk:mm:ss').format(DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    _hikingService = Provider.of<HikingService>(context);
    const dateTextStyle = TextStyle(
        fontSize: 10, color: Colors.purple, fontWeight: FontWeight.bold);

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text('Hello, Hiker!'),
        // actions: <Widget>[
        //   PopupMenuButton<String>(
        //     onSelected: handleClick,
        //     itemBuilder: (BuildContext context) {
        //       return {'Trips', 'Settings'}.map((String choice) {
        //         return PopupMenuItem<String>(
        //           value: choice,
        //           child: Text(choice),
        //         );
        //       }).toList();
        //     },
        //   ),
        // ],
      ),
      body: ListView(
        // shrinkWrap: true,
        children: <Widget>[
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                      initialValue: tripName,
                      onChanged: (val) {
                        print(tripName);
                        setState(() {
                          tripName = val;
                        });
                      }),
                ),
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
                      sendCommand(command) => onEnableBtnClicked(
                          context, _hikingService!, command, tripName);

                      return StatusButtons(activeStatus, sendCommand);
                    }),
              ],
            ),
          ),
        ],
      ),
      // floatingActionButton: !isDropdownEnabled ? null : FloatingActionButton.extended(
      //   onPressed: () {
      //     Navigator.pop(context);
      //   },
      //   label: const Text('View Trips'),
      //   icon: const Icon(Icons.remove_red_eye),
      //   backgroundColor: Colors.pink,
      // ),
    );
  }

  // void handleClick(String value) {
  //   switch (value) {
  //     case 'Trips':
  //       Navigator.pop(
  //         context,
  //         MaterialPageRoute(builder: (context) => const TripSummaryPage()),
  //       );
  //       break;
  //     case 'Settings':
  //       break;
  //   }
  // }

  Future<String?> onEnableBtnClicked(
      BuildContext context,
      HikingService _hikingService,
      TripStatusCommand command,
      String tripName) async {
    return _hikingService.updateStatus(
        context, _hikingService, command, tripName);
  }

  String _enableBtnName(bool activeStatus) {
    if (activeStatus) {
      return "STOP";
    } else {
      return "START";
    }
  }
}
