import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hiking_app/models/trip_summary.dart';
import 'package:hiking_app/ui/about_page/main.dart';
import 'package:hiking_app/ui/active_trip_page/main.dart';
import 'package:hiking_app/ui/active_trip_page/metric_plot.dart';
import 'package:hiking_app/ui/active_trip_page/metrics_table.dart';
import 'package:hiking_app/models/location_status.dart';
import 'package:hiking_app/models/plot_values.dart';
import 'package:hiking_app/ui/management_page/main.dart';
import 'package:hiking_app/ui/settings_page/main.dart';
import 'package:kt_dart/collection.dart';
import 'package:provider/provider.dart';

import '../../hiking_service.dart';
import '../../main.dart';

class TripSummaryPage extends StatefulWidget {
  const TripSummaryPage({Key? key, this.tripName}) : super(key: key);

  final String? tripName;

  @override
  TripSummaryPageState createState() => TripSummaryPageState();
}

class TripSummaryPageState extends State<TripSummaryPage> {
  HikingService? _hikingService;
  bool isStartButtonEnabled = true;
  bool isDropdownEnabled = true;
  GoogleMapController? mapController;

  Completer<GoogleMapController> _controller = Completer();

  String? _prevDropdownValue;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  bool validateBounds(LatLngBounds bounds) {
    LatLng northeast = bounds.northeast;
    LatLng southwest = bounds.southwest;
    double latLngThreshold = 0.000001;

    return (northeast.latitude - southwest.latitude).abs() > latLngThreshold &&
        (northeast.longitude - southwest.longitude).abs() > latLngThreshold;
  }

  @override
  Widget build(BuildContext context) {
    _hikingService = Provider.of<HikingService>(context);
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text('Hello, Hiker!'),
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: handleClick,
            itemBuilder: (BuildContext context) {
              return {'About', 'Settings', 'Manage Trips'}.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: Center(
        child: ListView(
          // shrinkWrap: true,
          children: <Widget>[
            StreamBuilder<List<LocationStatus>>(
                stream: _hikingService!.currentPathSub,
                builder: (context, snapshot) {
                  List<LatLng> pathList =
                      snapshot.data?.map(locationStatusToLatLong).toList() ??
                          [];
                  List<LatLng> unfilteredPathList = _hikingService!
                      .currentRawPathSub.value
                      .map(locationStatusToLatLong)
                      .toList();
                  print("Re-generating Map: ${snapshot.data?.length}");
                  LatLngBounds? bounds;
                  if (pathList != []) {
                    final pair = getPathBounds(pathList);
                    if (pair != null) {
                      bounds = LatLngBounds(
                          northeast: pair.first, southwest: pair.second);
                      if (mapController != null) {
                        if (validateBounds(bounds)) {
                          print("MOVING CAMERA BASE");
                          mapController?.animateCamera(
                              CameraUpdate.newLatLngBounds(bounds, 20));
                        }
                      }
                    }
                  }

                  return Container(
                    height: 300,
                    child: GoogleMap(
                      polylines: {
                        Polyline(
                            polylineId: const PolylineId("unfilteredPath"),
                            width: 10,
                            color: Colors.black,
                            points: unfilteredPathList),
                        Polyline(
                            polylineId: const PolylineId("path"),
                            width: 5,
                            color: Colors.blue,
                            points: pathList),
                      },
                      onMapCreated: (GoogleMapController controller) {
                        mapController = controller;
                        _controller.complete(controller);

                        if (bounds != null) {
                          if (validateBounds(bounds)) {
                            print("MOVING CAMERA INIT");
                            mapController?.animateCamera(
                                CameraUpdate.newLatLngBounds(bounds, 20));
                          }
                        }
                      },
                      initialCameraPosition: const CameraPosition(
                        target: LatLng(40.275266, -74.7244817),
                        zoom: 0,
                      ),
                      gestureRecognizers: Set()
                        ..add(Factory<EagerGestureRecognizer>(
                            () => EagerGestureRecognizer())),
                    ),
                  );
                }),
            MetricsTable(
                hikingService: _hikingService!,
                metricsHiddenMap: List.filled(22, true)),
            Padding(
              padding: EdgeInsets.only(bottom: 50),
              child: Row(children: <Widget>[
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
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          _hikingService!.clearData();
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ActiveTripPage()),
          );
        },
        label: const Text('New Trip'),
        icon: const Icon(Icons.add),
        backgroundColor: Colors.pink,
      ),
    );
  }

  LatLng locationStatusToLatLong(LocationStatus locationStatus) {
    return LatLng(locationStatus.latitude, locationStatus.longitude);
  }

  KtPair<LatLng, LatLng>? getPathBounds(List<LatLng> path) {
    LatLng? northeast;
    LatLng? southwest;
    path.forEach((point) {
      if (northeast == null || point.latitude > northeast!.latitude) {
        northeast =
            LatLng(point.latitude, northeast?.longitude ?? point.longitude);
      }
      if (northeast == null || point.longitude > northeast!.longitude) {
        northeast =
            LatLng(northeast?.latitude ?? point.latitude, point.longitude);
      }

      if (southwest == null || point.latitude < southwest!.latitude) {
        southwest =
            LatLng(point.latitude, southwest?.longitude ?? point.longitude);
      }
      if (southwest == null || point.longitude < southwest!.longitude) {
        southwest =
            LatLng(southwest?.latitude ?? point.latitude, point.longitude);
      }
    });
    if (northeast == null || southwest == null) return null;
    return KtPair(northeast!, southwest!);
  }

  void handleClick(String value) {
    switch (value) {
      case 'About':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AboutPage()),
        );
        break;
      case 'Settings':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SettingsPage()),
        );
        break;
      // case 'Manage Trips':
      //   Navigator.push(
      //     context,
      //     MaterialPageRoute(builder: (context) => ManagementPage()),
      //   );
      //   break;
    }
  }

  void onEnableBtnClicked(BuildContext context, HikingService _hikingService) {
    _hikingService.toggleStatus(context, _hikingService, "");
  }

  Widget confirmDeletionPopup(
      BuildContext context, String message, Function onConfirmCallback) {
    return AlertDialog(
      title: const Text('Confirm Action'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(message),
        ],
      ),
      actions: <Widget>[
        OutlinedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Cancel',
              style: TextStyle(color: Theme.of(context).primaryColor)),
        ),
        OutlinedButton(
          onPressed: () {
            onConfirmCallback();
            Navigator.of(context).pop();
          },
          child: Text('Confirm',
              style: TextStyle(color: Theme.of(context).primaryColor)),
        ),
      ],
    );
  }
}
