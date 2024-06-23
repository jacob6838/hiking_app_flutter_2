import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:hiking_app/hiking_service.dart';
import 'package:hiking_app/models/hike_metrics.dart';
import 'package:hiking_app/models/location_status.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';

class MapPage extends StatelessWidget {
  final HikingService? hikingService;
  const MapPage({super.key, this.hikingService});

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
        initialCenter: LatLng(43.763129598832194, -110.72952116687631),
        initialZoom: 9.2,
      ),
      children: [
        TileLayer(
          urlTemplate:
              "https://api.maptiler.com/maps/outdoor-v2/{z}/{x}/{y}.png?key=${dotenv.env['MAPTILER_API_KEY']}",
          userAgentPackageName: 'com.hikelytics.hiking_app',
        ),
        RichAttributionWidget(
          attributions: [
            TextSourceAttribution(
              'OpenStreetMap contributors',
              onTap: () =>
                  launchUrl(Uri.parse('https://openstreetmap.org/copyright')),
            ),
          ],
        ),
        StreamBuilder<HikeMetrics>(
          stream: hikingService?.currentHikerMetrics$,
          builder: (context, snapshot) {
            print("snapshot.data.toString()");
            print(snapshot.data.toString());
            return MarkerLayer(
              markers: [
                if (snapshot.data != null)
                  Marker(
                    point: LatLng(
                        snapshot.data!.latitude, snapshot.data!.longitude),
                    width: 25,
                    height: 25,
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue,
                        border: Border.all(
                          color: Colors.white, // Border color
                          width: 3.0, // Border width
                        ),
                      ),
                    ),
                  ),
              ],
            );
          },
        ),
        StreamBuilder<List<LocationStatus>>(
          stream: hikingService?.currentPathSub,
          builder: (context, snapshot) {
            return PolylineLayer(
              polylines: [
                if (snapshot.data != null)
                  Polyline(
                    points: snapshot.data!
                        .map((e) => LatLng(e.latitude, e.longitude))
                        .toList(),
                    strokeWidth: 4.0,
                    color: Colors.blue,
                  ),
              ],
            );
          },
        ),
      ],
    );
  }
}