import 'package:flutter/material.dart';
import 'package:hiking_app/models/hike_metrics.dart';
import 'package:hiking_app/models/plot_values.dart';
import 'package:hiking_app/ui/active_trip_page/metric_display_small.dart';
import 'package:hiking_app/ui/map.dart';
import 'package:hiking_app/ui/trip_summary_page/main.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../hiking_service.dart';
import '../../main.dart';
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
  bool _isExpanded = false;
  final double _dragSensitivity = 600;

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

    // Inside your widget build method
    double screenHeight = MediaQuery.of(context).size.height;

// Desired snap sizes in pixels
    double snapSizeInPixels1 = 90; // Example value in pixels
    double snapSizeInPixels2 = 155; // Another example value in pixels
    double snapSizeInPixels3 = 450; // Another example value in pixels

// Calculating the fractions
    double snapFraction1 = snapSizeInPixels1 / screenHeight;
    double snapFraction2 = snapSizeInPixels2 / screenHeight;
    double snapFraction3 = snapSizeInPixels3 / screenHeight;

    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Expanded(
              child: MapPage(
                hikingService: _hikingService,
              ),
            ),
            Container(
              height: 200,
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
                  StreamBuilder<bool>(
                      stream: _hikingService!.currentHikerStatus$,
                      builder: (context, AsyncSnapshot<bool> snapshot) {
                        final bool activeStatus = snapshot.data ?? false;
                        return SizedBox(
                            height: 80,
                            width: 80,
                            child: Container(
                                decoration: BoxDecoration(
                                  color:
                                      !activeStatus ? Colors.green : Colors.red,
                                  shape: BoxShape.circle,
                                ),
                                child: InkWell(
                                  onTap: () async {
                                    if (activeStatus) {
                                      setState(() {
                                        isDropdownEnabled = true;
                                      });
                                      await onEnableBtnClicked(
                                          context, _hikingService!, tripName);
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const TripSummaryPage()),
                                      );
                                      // tripName: name
                                    } else {
                                      setState(() {
                                        isDropdownEnabled = false;
                                      });
                                      onEnableBtnClicked(
                                          context, _hikingService!, tripName);
                                    }
                                  },
                                  child: Icon(
                                    !activeStatus
                                        ? Icons.play_arrow
                                        : Icons.stop_rounded,
                                    color: Colors.white,
                                    size: 60,
                                  ),
                                )));
                      }),
                ],
              ),
            ),

            // Positioned(
            //   bottom: 50,
            //   left: 0,
            //   right: 0,
            //   height: 900,
            //   // width: 300,
            //   child: // Assuming this is inside a Scaffold body or similar widget
            DraggableScrollableSheet(
              initialChildSize:
                  snapFraction1, // Initial size of the sheet when the app starts (10% of the screen height)
              minChildSize:
                  snapFraction1, // Minimum size of the sheet (collapsed state)
              maxChildSize:
                  snapFraction3, // Maximum size of the sheet (expanded state)
              snap: true,
              snapSizes: [snapFraction1, snapFraction2, snapFraction3],
              builder:
                  (BuildContext context, ScrollController scrollController) {
                return Container(
                    decoration: BoxDecoration(
                      color: Colors.black, // Background color
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0),
                      ),
                    ),
                    child: Column(mainAxisSize: MainAxisSize.min, children: [
                      // Scroll Indicator Bar
                      Container(
                        width: 40, // Adjust the width as needed
                        height: 5, // Adjust the height as needed
                        margin: EdgeInsets.only(
                            top: 8), // Adjust the margin as needed
                        decoration: BoxDecoration(
                          color: Colors.grey[300], // Adjust the color as needed
                          borderRadius: BorderRadius.circular(
                              2.5), // Adjust the border radius as needed
                        ),
                      ),
                      // Your existing ListView.builder
                      Expanded(
                          // StreamBuilder<HikeMetrics>(
                          //   stream: _hikingService?.currentHikerMetrics$,
                          //   builder: (context, snapshot) {
                          //     if (snapshot.hasData) {
                          //       return
                          child: ListView.builder(
                              controller: scrollController,
                              itemCount: 1,
                              padding: EdgeInsets.only(top: 16),
                              itemBuilder: (context, index) {
                                return MetricDisplaySmall(
                                  hikeMetrics: HikeMetrics(
                                    altitude: 0,
                                    averageSpeedMetersPerSec: 0,
                                    cumulativeClimbMeters: 0,
                                    distanceTraveled: 0,
                                    metricPeriodSeconds: 0,
                                  ),
                                  elevationPlot: PlotValues(
                                      // height: 100,
                                      // width: 200,
                                      ),
                                  speedPlot: PlotValues(
                                      // height: 100,
                                      // width: 200,
                                      ),
                                );
                              })
                          // } else {
                          //   return Center(child: CircularProgressIndicator());
                          // }
                          //   },
                          // ),
                          )
                    ]));
              },
              // ),
            )
          ],
        ),
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

  Future<String?> onEnableBtnClicked(BuildContext context,
      HikingService _hikingService, String tripName) async {
    return _hikingService.toggleStatus(context, _hikingService, tripName);
  }

  String _enableBtnName(bool activeStatus) {
    if (activeStatus) {
      return "STOP";
    } else {
      return "START";
    }
  }
}

/// A draggable widget that accepts vertical drag gestures
/// and this is only visible on desktop and web platforms.
class Grabber extends StatelessWidget {
  const Grabber({
    super.key,
    required this.onVerticalDragUpdate,
    required this.isOnDesktopAndWeb,
  });

  final ValueChanged<DragUpdateDetails> onVerticalDragUpdate;
  final bool isOnDesktopAndWeb;

  @override
  Widget build(BuildContext context) {
    if (!isOnDesktopAndWeb) {
      return const SizedBox.shrink();
    }
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onVerticalDragUpdate: onVerticalDragUpdate,
      child: Container(
        width: double.infinity,
        color: colorScheme.onSurface,
        child: Align(
          alignment: Alignment.topCenter,
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            width: 32.0,
            height: 4.0,
            decoration: BoxDecoration(
              color: colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
      ),
    );
  }
}
