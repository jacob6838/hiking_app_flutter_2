import 'package:flutter/material.dart';
import 'package:hiking_app/hiking_service.dart';
import 'package:hiking_app/models/trip_summary.dart';
import 'package:hiking_app/ui/about_page/main.dart';
import 'package:hiking_app/ui/active_trip_page/main.dart';
import 'package:hiking_app/ui/settings_page/main.dart';
import 'package:hiking_app/ui/trip_summary_page/main.dart';
import 'package:provider/provider.dart';

class TripsPage extends StatefulWidget {
  const TripsPage({super.key});

  @override
  State<TripsPage> createState() => _TripsPageState();
}

class _TripsPageState extends State<TripsPage> {
  HikingService? _hikingService;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _hikingService = Provider.of<HikingService>(context);
    List<TripSummary> trips = [
      const TripSummary(
        name: "lake view",
        locationName: "Test Trailhead",
        startTimeSeconds: 1719023723,
        durationSeconds: 3607,
        distanceMeters: 12355,
      ),
      const TripSummary(
        name: "mountain view",
        locationName: "Test Trailhead",
        startTimeSeconds: 1719023000,
        durationSeconds: 1255,
        distanceMeters: 1255,
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trips'),
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: handleClick,
            itemBuilder: (BuildContext context) {
              return {'About', 'Settings'}.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: StreamBuilder<List<TripSummary>>(
          stream: _hikingService?.archiveService.currentTripSummaries,
          builder: (context, snapshot) {
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                final trip = snapshot.data?[index];
                return Container(
                  decoration: BoxDecoration(
                    // color: Colors.amber, // Background color of the container
                    border: Border.all(
                      color: Colors.grey, // Color of the border
                      width: 1.0, // Width of the border
                    ),
                    borderRadius: BorderRadius.circular(10.0), // Rounded edges
                  ),
                  child: ListTile(
                    title: Text("${trip?.name}: ${trip?.locationName}"),
                    subtitle: Text(
                      trip == null
                          ? ''
                          : '${getTripDate(trip.startTimeSeconds)}\n${getDurationString(trip.durationSeconds)}    ${getDistanceString(trip.distanceMeters)}',
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                TripSummaryPage(tripName: trip?.fileName)),
                      );
                    },
                  ),
                );
              },
            );
          }),
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

  String getDurationString(int durationSeconds) {
    int hours = durationSeconds ~/ 3600;
    int minutes = (durationSeconds % 3600) ~/ 60;
    int seconds = durationSeconds % 60;
    return "${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}";
  }

  String getTripDate(int startTimeSeconds) {
    DateTime date =
        DateTime.fromMillisecondsSinceEpoch(startTimeSeconds * 1000);
    // add time of day, like 10:23am
    String timeOfDay =
        "${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}${date.hour < 12 ? 'am' : 'pm'}";
    return "${date.month.toString().padLeft(2, '0')}/${date.day.toString().padLeft(2, '0')}/${date.year} $timeOfDay";
  }

  String getDistanceString(int distanceMeters) {
    return "${(distanceMeters / 1000.0).toStringAsFixed(2)} km";
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
}
